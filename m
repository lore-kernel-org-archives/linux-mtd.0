Received: from mx0.gmx.de ([213.165.64.100] helo=mx0.gmx.net)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17ZCSF-0002xe-00
	for <linux-mtd@lists.infradead.org>; Mon, 29 Jul 2002 16:29:03 +0100
Date: Mon, 29 Jul 2002 17:28:31 +0200 (MEST)
From: Frank Oltmanns <frank.oltmanns.ml@gmx.de>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
References: <Pine.LNX.4.44.0207261230250.6899-100000@server.superbt.com>
Subject: Re: Compiling Grub for DOC2000
Message-ID: <20537.1027956511@www7.gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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

> 
> On Fri, 26 Jul 2002, Mark Meade wrote:
> 
> > I've had good luck patching GRUB 0.92 with the 2002-05-30 patch at:
> 
> It's the autoconf/automake change.  These now require CCAS and CCASFLAGS
> variables instead of AS and ASFLAGS.  The June 2002 MTD patch at the
> savannah link you've mentioned will change those in Makefile.am's as
> needed.  I advise to apply the patch against the post July 2, 2002 version
> of GRUB if you need serial port console at boot time.
> 
> Ilguiz
> 
Thank you all... It's working fine now. But I got some new problems.
1) With grub on my DoC, I can't boot from diskette anymore (I want to use
Etherboot)
2) My root-filesystem on DoC is not being mounted. I did the following:
      doc_loadbios grub_firmware
      nftl_format /dev/mtd0 90112  (since my firmware is 89792 bytes)
      fdisk /dev/nftla  (created 1 partition)
      mke2fs /dev/nftla1
   copied the files from my root-diskette to nftla1
   When I reboot, grub starts so I can enter:
      kernel (dc0,0)/boot/bzImage root=/dev/nftla1
      boot
   The kernel is being loaded and uncompressed. My DiskOnChip (and its
partition)
   is found, but when it should say: "INIT: version x.xx booting" there is
nothing.
   If I enter:
      kernel (dc0,0)/boot/bzImage root=/dev/fd0
      boot
   everything works fine...

I browsed through the Mailing-list, but I can't find anyone, who had the
same
problem. I hope someone can help!?

TIA
  Frank

-- 
GMX - Die Kommunikationsplattform im Internet.
http://www.gmx.net
