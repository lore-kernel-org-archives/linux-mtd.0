Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d1VYQ-0007fu-D5
 for linux-mtd@lists.infradead.org; Fri, 21 Apr 2017 10:12:44 +0000
Subject: Re: fsl_ifc_nand: are blank pages protected by ECC?
To: Pavel Machek <pavel@ucw.cz>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Dipen.Dudhat@freescale.com
References: <20170419121332.GA26979@amd> <20170419231804.5a04ed69@bbrezillon>
 <20170421100813.GA4332@amd>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com,
 cyrille.pitchen@atmel.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, mark.marshall@omicronenergy.com,
 b44839@freescale.com, prabhakar@freescale.com
From: Richard Weinberger <richard@nod.at>
Message-ID: <17f3f536-4b42-3ed9-ae2f-81940eb4ed07@nod.at>
Date: Fri, 21 Apr 2017 12:12:15 +0200
MIME-Version: 1.0
In-Reply-To: <20170421100813.GA4332@amd>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Pavel,

Am 21.04.2017 um 12:08 schrieb Pavel Machek:
> (BTW, switching to ecc.mode = ECC_SOFT will cause compatibility
> problems but should make the problem go away, right?) 

Yes and it is slow.
So, fixing the driver is the way to go. :-)

Thanks,
//richard
