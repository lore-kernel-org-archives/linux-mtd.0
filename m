Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16njt4-0005ZJ-00
	for <linux-mtd@lists.infradead.org>; Wed, 20 Mar 2002 17:28:34 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <200203201026.g2KAQH801788@thomas.tec.autronix.de> 
References: <200203201026.g2KAQH801788@thomas.tec.autronix.de>  <Pine.LNX.4.33.0203180449270.17977-100000@seattle.neotribe.com> 
To: gleixner@autronix.de
Cc: Paul <paul@oz.net>, linux-mtd@lists.infradead.org
Subject: Re: Linux SmartMedia driver advice requested 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 20 Mar 2002 17:39:46 +0000
Message-ID: <9616.1016645986@redhat.com>
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

gleixner@autronix.de said:
> That's one side of the problem. The other is, that you can use only
> JFFS2 on  this devices at the moment . There is no other filesystem,
> which handles the  nand stuff correct.  If you want to use the
> original SMC DOS-FAT filesystem, which is used by  MP3-Players,
> Digicams etc., you have to hack a new filesystem driver. 

SmartMedia is just another translation layer which pretends to be a block 
device (cf. previous rants). You normally put FAT on that block device, 
just as you do with NFTL and FTL - but you don't have to.

At least two people have expressed interest in writing that translation 
layer code. I haven't seen any of it yet.

--
dwmw2
