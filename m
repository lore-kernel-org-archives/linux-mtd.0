Received: from natpool.ud.com ([65.112.245.211] helo=dzuylt)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17FiDh-0006tu-00
	for <linux-mtd@lists.infradead.org>; Wed, 05 Jun 2002 22:21:30 +0100
Received: from infinity-studios.com (localhost.localdomain [127.0.0.1])
	by dzuylt (8.11.6/8.11.6) with ESMTP id g55LLMW01440
	for <linux-mtd@lists.infradead.org>; Wed, 5 Jun 2002 16:21:23 -0500
Message-ID: <3CFE80D2.5010508@infinity-studios.com>
Date: Wed, 05 Jun 2002 16:21:22 -0500
From: Dzuy Nguyen <dzuy@infinity-studios.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: GRUB on DoC Millenium
Content-Type: text/plain; charset=us-ascii; format=flowed
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

What is the status on GRUB and DoC Millenium?  I've read the posts in 
the archive but it seems that people
have had mixed results with using GRUB to boot DoC Millenium.

I have 8MB a DoC Millenium.  I've got mtd-snapshot-22020529 from CVS, 
I've tried with grub 0.90, 0.91,
and 0.92 (with proper patches) and the board acts as if the DoC is not 
even there.  I dformat it to verify and
it works OK.  Here's what I did:

1. patch grub.
2. aclocal, automake, autoconf.
3. configure with --enable-diskonchip for grub0.90.  For grub0.91 and 
grub 0.92, I've tried each
--enable-diskonchip-2000, --enable-diskonchip-mil512, 
--enable-diskonchip-mil256.
4. cp stage2/pre_stage2 mtd/grub and make (for grub0.90), cp 
stage1/grub_firmware mtd/grub for 0.91/2.
5. doc_loadbios.
6. nftl_format with offset 98304 doesn't work.  With grub 0.91 and 0.92, 
I notice grub_firmware gets larger
so I compensate by adding 8192 bytes to the grub_firmware size.
7. fdisk, mke2fs, etc.
8. Reboot and never see the grub.

Has anyone got it working.  If so, please help.
