Received: from fep02.superonline.com ([212.252.115.9])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1618PF-0008AI-00
	for <linux-mtd@lists.infradead.org>; Tue, 06 Nov 2001 15:44:53 +0000
Received: from yunux ([212.253.32.23]) by fep02.superonline.com
          (InterMail vK.4.03.02.00 201-232-124 license 82877460054e144bf0b390e626dd66fc)
          with SMTP id <20011106155218.FCST26177.fep02@yunux>
          for <linux-mtd@lists.infradead.org>;
          Tue, 6 Nov 2001 17:52:18 +0200
Content-Type: text/plain;
  charset="iso-8859-9"
From: Yunus Yucel Altunbicak <yunus.altunbicak@eliar.com.tr>
To: MTD <linux-mtd@lists.infradead.org>
Subject: problem with cross compiling
Date: Tue, 6 Nov 2001 17:54:10 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20011106155218.FCST26177.fep02@yunux>
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

Hi all,
i couldn't compile the util directory neither m68k-elf-gcc nor 
m68k-pic-coff-gcc.
if i try this
m68k-elf-gcc -I../include -O2 -m68000 -Wl,-elf2flt nftl_format.c -o 
nftl_format -lc

get below error message

/************************************/
nftl_format.elf2flt: In function `check_block_2':
nftl_format.elf2flt(.text+0xf6): undefined reference to `pread'
nftl_format.elf2flt(.text+0x14a): undefined reference to `pwrite'
nftl_format.elf2flt(.text+0x1ec): undefined reference to `pwrite'
nftl_format.elf2flt(.text+0x204): undefined reference to `pread'
nftl_format.elf2flt(.text+0x28c): undefined reference to `pwrite'
nftl_format.elf2flt(.text+0x2a4): undefined reference to `pread'
nftl_format.elf2flt: In function `main':
nftl_format.elf2flt(.text+0x6b0): undefined reference to `pwrite'
collect2: ld returned 1 exit status
/*****************************************/

does anybody encounter same error and solve it ?

Sincerely,
yunus
