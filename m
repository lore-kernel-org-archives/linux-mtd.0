From: "Kyungmin Park" <kmpark@infradead.org>
To: "'Adrian Hunter'" <ext-adrian.hunter@nokia.com>,
	<linux-mtd@lists.infradead.org>
References: <45C2EE39.7050909@nokia.com>
	<003a01c748f0$48530620$c7a3580a@swcenter.sec.samsung.co.kr>
	<45C6DB35.3040106@nokia.com>
Subject: RE: [PATCH] [MTD] OneNAND: Do not allow oob write past end of page
Date: Mon, 5 Feb 2007 16:44:11 +0900
Message-ID: <003d01c748f9$705677c0$c7a3580a@swcenter.sec.samsung.co.kr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
In-reply-to: <45C6DB35.3040106@nokia.com>
Reply-To: kmpark@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> ext Kyungmin Park wrote:
> > Umm Why is it required in OneNAND? Even though OneNAND is based on 
> > NAND. We regard it as NOR
> 
> I am not sure what you mean.  In onenand_base.c it has:
> 
> 	mtd->type = MTD_NANDFLASH;
> 
> So mtd sees it as NAND.

I mean that in the view point of software OnenNAND is NAND, but the one of
hardware it is NOR.
So we don't need to work it as NAND. I think we don't need to restrict the
OneNAND

Thank you,
Kyungmin Park
