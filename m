Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 175i66-00078m-00
	for <linux-mtd@lists.infradead.org>; Thu, 09 May 2002 08:12:18 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <MPBBIIEFELAEABNCNHMMAELCDAAA.mailinglists@grimmerink.nl> 
References: <MPBBIIEFELAEABNCNHMMAELCDAAA.mailinglists@grimmerink.nl> 
To: "Pieter Grimmerink" <mailinglists@grimmerink.nl>
Cc: linux-mtd@lists.infradead.org, gleixner@autronix.de
Subject: Re: Current status JFFS2 on DOC 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 09 May 2002 08:11:54 +0100
Message-ID: <1596.1020928314@redhat.com>
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

mailinglists@grimmerink.nl said:
> > The minimum requirement is 1MB for a compressed kernel image
> > and a bootloader. That's affordable and working :)
> Well, it's still something like up to 10 $ extra. Might not sound much
> for a few devices, but when numbers get higher...

The minimum requirement is a lot less than that. All you need is enough 
code to set up DRAM and start pulling more off the NAND flash. The 
LinuxBIOS guys do this in 512 bytes -- which is all that the DiskOnChip 
Millennium has available.

--
dwmw2
