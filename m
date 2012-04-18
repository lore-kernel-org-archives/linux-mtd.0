Received: from mail-gx0-f177.google.com ([209.85.161.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SKXWC-0000jf-4F
 for linux-mtd@lists.infradead.org; Wed, 18 Apr 2012 16:14:08 +0000
Received: by ggnk1 with SMTP id k1so4222579ggn.36
 for <linux-mtd@lists.infradead.org>; Wed, 18 Apr 2012 09:14:07 -0700 (PDT)
Message-ID: <4F8EE832.3090002@gmail.com>
Date: Wed, 18 Apr 2012 09:13:38 -0700
From: Brian Norris <computersforpeace@gmail.com>
MIME-Version: 1.0
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Subject: Re: [PATCH 2/2] mtd: nand: nand_do_{read, write}_ops - pass OOB buffer
 through
References: <1334615755-15418-1-git-send-email-computersforpeace@gmail.com>
 <1334615755-15418-3-git-send-email-computersforpeace@gmail.com>
 <20120418145232.6ba77552@pixies.home.jungo.com>
In-Reply-To: <20120418145232.6ba77552@pixies.home.jungo.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Viresh Kumar <viresh.kumar@st.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Nicolas Ferre <nicolas.ferre@atmel.com>, Vipin Kumar <vipin.kumar@st.com>,
 linux-mtd@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Florian Fainelli <ffainelli@freebox.fr>, Jamie Iles <jamie@jamieiles.com>,
 Mike Dunn <mikedunn@newsguy.com>, Bastian Hecht <hechtb@gmail.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Kevin Cernekee <cernekee@gmail.com>, Lei Wen <leiwen@marvell.com>,
 Axel Lin <axel.lin@gmail.com>, Li Yang <leoli@freescale.com>,
 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>,
 Armando Visconti <armando.visconti@st.com>, Liu Shuo <b35362@freescale.com>,
 Thomas Gleixner <tglx@linutronix.de>, Scott Branden <sbranden@broadcom.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, Wolfram Sang <w.sang@pengutronix.de>,
 Huang Shijie <b32955@freescale.com>, Jiandong Zheng <jdzheng@broadcom.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 4/18/2012 4:52 AM, Shmulik Ladkani wrote:
> On Mon, 16 Apr 2012 15:35:55 -0700 Brian Norris<computersforpeace@gmail.com>  wrote:
>> Now that we have a function parameter for the OOB buffer, we can pass the OOB
>> buffer as an argument to the nand_ecc_ctrl functions. This allows drivers to
>> know when OOB data must be returned to the upper layers and when it is simply
>> needed for internal calculations, potentially saving time for NAND HW/SW that
>> can simply avoid reading the OOB data.
>
> I think for consistency sake, existing chip->ecc.{read,write}_page_xxx
> methods do need to be ported to support the new 'oob' parameter.

OK, but it's difficult to tell sometimes what is and isn't needed; some 
drivers might expect OOB data in chip->oob_poi unconditionally so they 
can perform correction, whereas others might fill up buffers that won't 
be used in the end.

>> @@ -2272,12 +2272,14 @@ static int nand_do_write_ops(struct mtd_info *mtd, loff_t to,
>>   			size_t len = min(oobwritelen, oobmaxlen);
>>   			oob = nand_fill_oob(mtd, oob, len, ops);
>>   			oobwritelen -= len;
>> +			oobpoi = chip->oob_poi;
>>   		} else {
>> +			oobpoi = NULL;
>>   			/* We still need to erase leftover OOB data */
>>   			memset(chip->oob_poi, 0xff, mtd->oobsize);
>>   		}
>>
>> -		ret = chip->write_page(mtd, chip, wbuf, NULL, page, cached,
>> +		ret = chip->write_page(mtd, chip, wbuf, oobpoi, page, cached,
>>   				       (ops->mode == MTD_OPS_RAW));
>>   		if (ret)
>>   			break;
>
> The 'write_page' interface is problematic, as the meaning of 'oob'
> parameter is a bit inconsistent:
> - A NULL 'oob' actually states "no OOB buffer to write"
> - Your driver instructs HW to write the page (ECC taken care of by HW)
> - However default chip->ecc.write_page_xxx methods do need a temp buffer
>    for OOB ECC calculation (hence will probably use the internal
>    chip->oob_poi buffer)

Right, this is a trouble spot for 'porting them to support the new oob 
parameter', since many driver-users still need a buffer even when OOB is 
not needed for the higher levels.

> - But when non-null 'oob' is passed to the default methods, they should
>    probably use the given 'oob' buffer (and not a temp buffer)

Yes. This gets strange and potentially ugly, with code snippets like below.

> (This is same for the read interface.)
>
> So the 'oob' parameter is more of a boolean than an actual buffer to be
> used by the various ecc.{read,write}_page implementors.

Yes, I suppose so. I naturally used 'oob' as a buffer, since that's very 
straightforward and logical from a 'layers' perspective and because my 
driver doesn't need any buffer when oob is not required. But I see that 
it essentially would become a boolean flag for many of the other 
interfaces, and so a boolean can work just as well.

> Any reason not to pass a boolean instead?

Only reason I'm thinking of: a cleaner interface.

To me, the interface is rather non-obvious and ugly when data is 
constantly shuttled back and forth behind the scenes (i.e., not via 
function arguments or ret values) by using chip->oob_poi.

However, this sense of "ugliness" competes with the ugliness of needing 
a buffer even when the interface might otherwise say "no OOB." Many 
{read,write}_page functions would need something like:

     uint8_t *oobbuf = oob ? oob : chip->oob_poi;

which is not pretty.

I'm open to either way, I guess, but I'm now leaning a little toward 
'oob' as a boolean.

Brian
