Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SKaoU-00071i-UH
 for linux-mtd@lists.infradead.org; Wed, 18 Apr 2012 19:45:15 +0000
Received: by werp11 with SMTP id p11so6026244wer.36
 for <linux-mtd@lists.infradead.org>; Wed, 18 Apr 2012 12:45:11 -0700 (PDT)
Date: Wed, 18 Apr 2012 22:43:56 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 2/2] mtd: nand: nand_do_{read,write}_ops - pass OOB
 buffer through
Message-ID: <20120418224356.0709fc40@halley>
In-Reply-To: <4F8EE832.3090002@gmail.com>
References: <1334615755-15418-1-git-send-email-computersforpeace@gmail.com>
 <1334615755-15418-3-git-send-email-computersforpeace@gmail.com>
 <20120418145232.6ba77552@pixies.home.jungo.com>
 <4F8EE832.3090002@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
 Armando Visconti <armando.visconti@st.com>,
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

Hi Brian,

On Wed, 18 Apr 2012 09:13:38 -0700 Brian Norris <computersforpeace@gmail.com> wrote:
> > So the 'oob' parameter is more of a boolean than an actual buffer to be
> > used by the various ecc.{read,write}_page implementors.
> 
> Yes, I suppose so. I naturally used 'oob' as a buffer, since that's very 
> straightforward and logical from a 'layers' perspective and because my 
> driver doesn't need any buffer when oob is not required. But I see that 
> it essentially would become a boolean flag for many of the other 
> interfaces, and so a boolean can work just as well.
> 
> > Any reason not to pass a boolean instead?
> 
> Only reason I'm thinking of: a cleaner interface.
> 
> To me, the interface is rather non-obvious and ugly when data is 
> constantly shuttled back and forth behind the scenes (i.e., not via 
> function arguments or ret values) by using chip->oob_poi.
> 
> However, this sense of "ugliness" competes with the ugliness of needing 
> a buffer even when the interface might otherwise say "no OOB." Many 
> {read,write}_page functions would need something like:
> 
>      uint8_t *oobbuf = oob ? oob : chip->oob_poi;
> 
> which is not pretty.
> 
> I'm open to either way, I guess, but I'm now leaning a little toward 
> 'oob' as a boolean.

Yes, both approaches aren't perfect.

However a 'int has_user_oob' (or 'has_oob') has a precise, consistent
meaning: the mtd user explicitly provided an OOB buffer (or in the read
case, the mtd user expects the OOB to be returned).
(need help with the boolean's name, though)

Also, I think it will result in less changes (makes the whole
s/oob/oobbuf/ collateral damage of 1st patch irrelevant).

So IMO a boolean is better.

Regards,
Shmulik
