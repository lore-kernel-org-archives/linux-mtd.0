Received: from sccrmhc01.attbi.com ([204.127.202.61])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17lrGS-0005hu-00
	for <linux-mtd@lists.infradead.org>; Mon, 02 Sep 2002 14:29:12 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: Mark Meade <mark@lakeshoremicro.com>
To: Henrik =?iso-8859-1?q?Nordstr=F6m?= <hno@marasystems.com>
Subject: Re: 48meg DOC
Date: Mon, 2 Sep 2002 09:27:55 -0400
Cc: linux-mtd@lists.infradead.org
References: <Pine.LNX.4.44.0209011654210.31089-100000@filer.marasystems.com>
In-Reply-To: <Pine.LNX.4.44.0209011654210.31089-100000@filer.marasystems.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20020902132838.NFAO11061.sccrmhc01.attbi.com@there>
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

Henrik Nordström wrote:
> Do I have to use the GRUB DOC firmware to support multiple partitions, or
> will it also work if using the M-Sys DOS driver firmware and loading GRUB
> via MBR?

You shouldn't need to have GRUB on the DoC to support multiple partitions.  
Grub is simply the bootloader -- the MTD/DoC stuff should work the same 
regardless of the presence of GRUB/LILO/whatever.  

> Not yet sure if I will go for the GRUB firmware or booting GRUB via the
> MBR and the M-Sys DOS driver, but having multiple partitions is a definite
> win!

Use the GRUB firmware if the DoC is the primary non-volatile storage in your 
system.  Off-topic, but if you have a MBR in your target system, what is the 
DoC used for?

> If I use the GRUB firmware, is there any difference if I install it using
> the M-Sys DFORMAT utility or by using the doc_loadbios Linux command?
> Would be great if DFORMAT could be used for the initial install, and
> doc_loadbios for field upgrades.

I have not found a reliable way to use DFORMAT to load the Grub firmware.  

In general, DFORMAT is only needed once (to install M-Sys firmware version 
4.2), and doc_loadbios is used to install GRUB.  

Mark
