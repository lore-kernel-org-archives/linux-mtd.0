Received: from 235-216.205.122.dellhost.com ([216.205.122.235] helo=imagequestdesign.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17aKx1-0001e4-00
	for <linux-mtd@lists.infradead.org>; Thu, 01 Aug 2002 19:45:31 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: Mark Meade <mark@lakeshoremicro.com>
To: Ilguiz Latypov <ilatypov@superbt.com>
Subject: Re: [patch] doc_stage1.S : GRUB on DoC
Date: Thu, 1 Aug 2002 14:43:00 -0400
Cc: linux-mtd@lists.infradead.org
References: <Pine.LNX.4.44.0207300002170.7104-100000@server.superbt.com>
In-Reply-To: <Pine.LNX.4.44.0207300002170.7104-100000@server.superbt.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20020801144115.SM02488@there>
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

Ilguiz,

I tested the 07-29 patch on a DoC Millennium, and everything seemed to be 
working great.  I was able to build it against cvs grub with no errors, and 
the resulting grub_firmware booted fine on a 1.3Ghz Athlon.

However, I have also been experimenting with booting a variant of the Linux 
Router Project (LRP) from my DoC, and this latest Grub patch locks up on two 
different Pentium-133 PC's.  

Additionally, the M-Sys firmware also locked up on both machines.  The 
earlier Grub patch (the one with the -256 and -512 options) works fine.  I'm 
not sure what's going on here, but I'll continue to try to figure out what is 
wrong.  

Mark

Ilguiz Latypov wrote:
> I added floppy disk BIOS number (0) as a last resort when looking for boot
> configuration file.  Would you mind testing the aggregate patch I stored
> under
>
>     patches/grub-2002-07-29-doc.patch
