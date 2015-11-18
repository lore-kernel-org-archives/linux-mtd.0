Received: from mail-pa0-x230.google.com ([2607:f8b0:400e:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZyspN-0000ti-LQ
 for linux-mtd@lists.infradead.org; Wed, 18 Nov 2015 02:50:37 +0000
Received: by pabfh17 with SMTP id fh17so29693730pab.0
 for <linux-mtd@lists.infradead.org>; Tue, 17 Nov 2015 18:50:13 -0800 (PST)
Date: Tue, 17 Nov 2015 18:50:10 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Bean Huo =?utf-8?B?6ZyN5paM5paMIChiZWFuaHVvKQ==?= <beanhuo@micron.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: enhance ONFI table reliability/stable
Message-ID: <20151118025010.GB140057@google.com>
References: <A765B125120D1346A63912DDE6D8B6310BF37D1C@NTXXIAMBX02.xacn.micron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <A765B125120D1346A63912DDE6D8B6310BF37D1C@NTXXIAMBX02.xacn.micron.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Bean,

I was sorting through old email and I found this.

On Tue, Jul 21, 2015 at 02:42:34PM +0000, Bean Huo 霍斌斌 (beanhuo) wrote:
> Hi, 
> 
> Recently, I faced some case about ONFI table reliability, now it used CRC.
> If there is bit flips in ONFI parameter pages, parameter backup page will be taken. 
> For latest linux,default read three copys.
> 
> 	chip->cmdfunc(mtd, NAND_CMD_PARAM, 0, -1);
> 	for (i = 0; i < 3; i++) {
> 		for (j = 0; j < sizeof(*p); j++)
> 			((uint8_t *)p)[j] = chip->read_byte(mtd);
> 		if (onfi_crc16(ONFI_CRC_BASE, (uint8_t *)p, 254) ==
> 				le16_to_cpu(p->crc)) {
> 			break;
> 		}
> 	}
> 
> However ,with technoogy improvement,for TLC and new generatin MLC,I
> think, three copys of 

Ha, "improvement" :)

> Parameter tables is not powerful enough.my question is that if there
> is a good method to protect and corrent parameter page. For example,we
> can use linux software BCH ecc. Any suggections and input be
> welcomed,if you having any concerns about this,don't free tell me.

I recall this being brought up at my old job, and I all I can say is...
(please pardon my censored language)

...that is complete and utter bulls***. An ONFI standard that can't
guarantee "reliable enough" parameter pages is no standard at all.

To step back a bit: How would one expect to store and retrieve ECC
parity data? ...on the NAND flash? But to do that, we have to know the
geometry parameters of said NAND flash. How do we figure out the
geometry? From the ONFI parameter pages! Nice Catch 22 you have there.

Please encourage your employer never to produce "ONFI-compliant" flash
that are this bad.

Regards,
Brian
