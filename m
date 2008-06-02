Received: from mail17.syd.optusnet.com.au ([211.29.132.198])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K3HhG-0005BK-NL
	for linux-mtd@lists.infradead.org; Mon, 02 Jun 2008 21:36:07 +0000
Subject: Re: u-boot reports ecc error on blocks written by nandwrite
From: James <jamessteward@optusnet.com.au>
To: Mark Roths <mroths@softairmicro.com>
In-Reply-To: <01b301c8c4db$c5ebb560$6601a8c0@mrothsduo>
References: <01b301c8c4db$c5ebb560$6601a8c0@mrothsduo>
Content-Type: text/plain
Date: Tue, 03 Jun 2008 07:35:52 +1000
Message-Id: <1212442552.6121.8.camel@Ubuntu-Desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Mark,

On Mon, 2008-06-02 at 11:09 -0700, Mark Roths wrote:
> There appears to be a discrepancy between how the linux mtd driver and
> u-boot handle the ecc.  Or I am doing something
> boneheadded.

It is unlikely but possible that you have one configured for hardware
ECC, and the other software ECC.

Can U-boot erase, write and read back some data properly?
(see u-boot-1.1.5/doc/README.nand for commands)

You are erasing before writing?

Regards,
James.
