Received: from mail.utstar.com ([216.37.114.6])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1CtuhQ-0002ee-MX
	for linux-mtd@lists.infradead.org; Wed, 26 Jan 2005 16:27:42 -0500
Received: from njtckasturi (njtc-kasturi.nj.us.utstar.com [172.16.2.139])
	by mail.utstar.com (8.13.2/8.13.2) with SMTP id j0QLRSDe023520
	for <linux-mtd@lists.infradead.org>;
	Wed, 26 Jan 2005 16:27:29 -0500 (EST)
From: "Kasturi Raghunath" <kasturi@utstar.com>
To: <linux-mtd@lists.infradead.org>
Date: Wed, 26 Jan 2005 16:27:28 -0500
Message-ID: <DJEELHNCJDICCAIMLCCCCEIOEGAA.kasturi@utstar.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: do_write_buffer(): software timeout
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi
  I am running 2.4.18 linux on my 8270 board with AMD29LV128ML flash chip. I
have patched May 27 2004 snapshot into my linux OS. JFFS2 and the MTD driver
works fine when there is no load on the CPU. But when I start sending wire
speed traffic on the ethernet port and simultaneously download a file to the
flash I get following error:
MTD do_write_buffer(): software timeout
Write of 580 bytes at 0x01ae5624 failed. returned -5, retlen 220
MTD do_write_buffer(): software timeout
Write of 580 bytes at 0x01aef944 failed. returned -5, retlen 68
MTD do_write_buffer(): software timeout
Write of 580 bytes at 0x01a802ec failed. returned -5, retlen 212
MTD do_write_buffer(): software timeout
Write of 580 bytes at 0x01a88898 failed. returned -5, retlen 168
MTD do_write_buffer(): software timeout
Write of 580 bytes at 0x01a8cc90 failed. returned -5, retlen 112
MTD do_write_buffer(): software timeout
Write of 580 bytes at 0x01a92dfc failed. returned -5, retlen 132
MTD do_write_buffer(): software timeout
Write of 580 bytes at 0x01a9d7e8 failed. returned -5, retlen 152
MTD do_write_buffer(): software timeout
Write of 580 bytes at 0x01524e08 failed. returned -5, retlen 184
MTD do_write_buffer(): software timeout
Write of 580 bytes at 0x0152bf50 failed. returned -5, retlen 240
MTD do_write_buffer(): software timeout
Write of 580 bytes at 0x0107259c failed. returned -5, retlen 228
MTD do_write_buffer(): software timeout
Write of 580 bytes at 0x01074e64 failed. returned -5, retlen 156
MTD do_write_buffer(): software timeout
Write of 580 bytes at 0x0107e874 failed. returned -5, retlen 140
MTD do_write_buffer(): software timeout
Write of 580 bytes at 0x00f60638 failed. returned -5, retlen 200
MTD do_write_buffer(): software timeout
Write of 580 bytes at 0x00f669e8 failed. returned -5, retlen 216
MTD do_write_buffer(): software timeout
Write of 580 bytes at 0x00f69738 failed. returned -5, retlen 136
MTD do_write_buffer(): software timeout
Write of 580 bytes at 0x00f4b0b4 failed. returned -5, retlen 76
MTD do_write_buffer(): software timeout
Write of 538 bytes at 0x00f4c078 failed. returned -5, retlen 264
MTD do_write_buffer(): software timeout
Write of 580 bytes at 0x00f50418 failed. returned -5, retlen 232
MTD do_write_buffer(): software timeout

Any idea what could be the issue. Thanks in advance
