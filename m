Received: from 228-216.205.122.dellhost.com ([216.205.122.228] helo=lakeshoremicro.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16e1bD-0004Wd-00
	for <linux-mtd@lists.infradead.org>; Thu, 21 Feb 2002 22:21:59 +0000
Message-ID: <001601c1bb27$b8bac0d0$0101a8c0@dellc800>
From: "Mark Meade" <mark@lakeshoremicro.com>
To: "Ilguiz Latypov" <ilatypov@superbt.com>
Cc: <linux-mtd@lists.infradead.org>
References: <Pine.LNX.4.44.0202211614390.27335-100000@server.superbt.com>
Subject: Re: DiskOnChip 2000 and Millenium support in GRUB bootloader 
Date: Thu, 21 Feb 2002 17:32:20 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

Ilguiz,

It appears that the 2-byte signature (55 AA) is not there after I run the "doc_loadbios"
program.  The entire IPL that was there (after the M-Sys DFORMAT) is modified by
doc_loadbios.  The motherboard BIOS is no longer seeing that 2-byte signature, so none of
the other steps are even attempted.

I did apply the grub-2002-02-19-doc.patch prior to trying all of this; I used the
2002-02-19 version of GRUB as detailed in your initial post, using the configure options
specified.

Regards,

Mark

On Thur, 21 Feb 2002,  Ilguiz Latypov wrote:

> Can you please try the updated DoC GRUB patch?  This shouldn't fix the INT
> 19h problem though.
