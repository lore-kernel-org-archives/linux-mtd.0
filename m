Received: from pd9e41274.dip.t-dialin.net ([217.228.18.116] helo=thomas.tec.autronix.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16nlHC-0005fY-00
	for <linux-mtd@lists.infradead.org>; Wed, 20 Mar 2002 18:57:34 +0000
Message-Id: <200203201912.g2KJCZn20682@thomas.tec.autronix.de>
Content-Type: text/plain;
  charset="iso-8859-1"
From: Thomas Gleixner <gleixner@autronix.de>
Reply-To: gleixner@autronix.de
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: Linux SmartMedia driver advice requested
Date: Wed, 20 Mar 2002 20:12:34 +0100
Cc: Paul <paul@oz.net>, linux-mtd@lists.infradead.org
References: <200203201026.g2KAQH801788@thomas.tec.autronix.de> <Pine.LNX.4.33.0203180449270.17977-100000@seattle.neotribe.com> <9616.1016645986@redhat.com>
In-Reply-To: <9616.1016645986@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Mittwoch, 20. März 2002 18:39 , David Woodhouse wrote:
> gleixner@autronix.de said:
> > That's one side of the problem. The other is, that you can use only
> > JFFS2 on  this devices at the moment . There is no other filesystem,
> > which handles the  nand stuff correct.  If you want to use the
> > original SMC DOS-FAT filesystem, which is used by  MP3-Players,
> > Digicams etc., you have to hack a new filesystem driver.
>
> SmartMedia is just another translation layer which pretends to be a block
> device (cf. previous rants). You normally put FAT on that block device,
> just as you do with NFTL and FTL - but you don't have to.
Yep, but the SmartMedia FAT is different to MSDOS-FAT in some points.

-- 
Thomas
_________________________________
Thomas Gleixner <gleixner@autronix.de>
autronix automation http://www.autronix.de
