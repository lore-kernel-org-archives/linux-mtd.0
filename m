Received: from [2001:a60:0:488::2] (helo=mail-out.m-online.net)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BjQmA-0004b7-0j
	for linux-mtd@lists.infradead.org; Sat, 10 Jul 2004 18:56:59 -0400
To: "Robert P. J. Day" <rpjday@mindspring.com>
From: Wolfgang Denk <wd@denx.de>
Mime-version: 1.0
Content-Type: multipart/mixed ;
	boundary="==_Exmh_12765404630"
Date: Sun, 11 Jul 2004 00:56:50 +0200
Sender: wd@denx.de
Message-Id: <20040710225655.2EF35C109F@atlas.denx.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: sflash: CFI does not contain boot bank location. Assuming top. 
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multipart MIME message.

--==_Exmh_12765404630
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: 8bit
In-reply-to: Your message of "Sat, 10 Jul 2004 13:15:00 EDT."
	<Pine.LNX.4.60.0407101310380.16786@localhost.localdomain>

Dear Robert,

in message <Pine.LNX.4.60.0407101310380.16786@localhost.localdomain> you wrote:
> 
>    the build is successful, but at boot time, i get (excerpt):
> 
> init_synergy_mtd: processing flash bank 0: sflash.
> init_synergy_mtd: Remapped flash bank sflash to 0xc3000000.
> sflash: Found 1 x16 devices at 0x0 in 16-bit mode
>   Amd/Fujitsu Extended Query Table at 0x0040
> sflash: CFI does not contain boot bank location. Assuming top. (?????)

Fujitsu flash, right?

>    the 2 partitions listed are correct based on my defined partitions, 
> but i don't ever recall seeing the following diagnostic working with 
> earlier boards:
> 
> sflash: CFI does not contain boot bank location. Assuming top.
> 
>    i'm assuming i've just messed up a pointer, or dereferenced 
> something incorrectly.  can anyone explain what this means?

It's a bug. Please try if the attached patch helps.

Best regards,

Wolfgang Denk

-- 
Software Engineering:  Embedded and Realtime Systems,  Embedded Linux
Phone: (+49)-8142-4596-87  Fax: (+49)-8142-4596-88  Email: wd@denx.de
"Confound these ancestors.... They've stolen our best ideas!"
- Ben Jonson


--==_Exmh_12765404630
Content-Type: application/octet-stream ; name="patch"
Content-Description: patch
Content-Disposition: attachment; filename="patch"

diff -Nur drivers/mtd/chips/cfi_cmdset_0002.c drivers/mtd/chips/cfi_cmdset_0002.c
--- drivers/mtd/chips/cfi_cmdset_0002.c	Fri Jun 11 10:22:55 2004
+++ drivers/mtd/chips/cfi_cmdset_0002.c	Fri Jun 11 10:22:55 2004
@@ -147,6 +147,11 @@
 		CFI_ID_ANY,
 		fixup_amd_bootblock, NULL
 	},
+	{
+		0x0004,		/* Fujitsu */
+		CFI_ID_ANY,
+		fixup_amd_bootblock, NULL
+	},
 #endif
 	{ 0, 0, NULL, NULL }
 };

--==_Exmh_12765404630--
