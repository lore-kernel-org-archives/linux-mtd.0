Received: from law14-oe53.law14.hotmail.com ([64.4.20.46] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Mnu8-0002yK-6B
	for <linux-mtd@lists.infradead.org>; Mon, 02 Jun 2003 12:55:08 +0100
From: "Vikram Mehta" <vm6580@hotmail.com>
To: "mtd" <linux-mtd@lists.infradead.org>
Date: Mon, 2 Jun 2003 17:25:43 -0700
MIME-Version: 1.0
Message-ID: <Law14-OE536PDT89CLh0002e430@hotmail.com>
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
cc: uclinux-dev@uclinux.org
Subject: uCdimm 68VZ328  JFFS2 Questions
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi folks,

A few questions
1.) I am using uCdimm 68VZ328 with AM29DL323GB flash chip
NOw I am on CYGWIN and am using Patrice KADIONIK guide HOW TO USE MTD/JFFS2
UNDER µClinux

I don't know If my chip is 2 MB or 4MB and nothing else abt it.

My questions are

1.) by following his guide ... I am making two partions.. as he does .... do
I risk erasing the bootloader. Wha precautions can I take not to ersae the
bootloader. Any ideas.

2.) Earlier one was  a silly but important  question, The makefile in
mtd-utils compliles files with 2 compilers... Onewith m68k-elf-gcc and other
with gcc. Now on my machine ( I guess due to bein gon CYGWIN) gcc build
doesnot work for all files and I get linker errors. So I hv removed gcc
build parts from the makefile. How does that affect the working of the
tools, kernels etc.

3.) Mr David Woodhouse was kind enough to answer me saying that MTD CVS
utils/makefile doenot contain any gcc build options. So Can someone send me
this makefile... I tried using the CVS but couldnot ..... I am trying but
still

4.) Can someone tell me from where can I read in detail about the
significance of changes Mentioned in  vendors/.../Makefile
DEVICES = \
tty,c,5,0 console,c,5,1 cua0,c,5,64 cua1,c,5,65 \

mtd0,c,90,0 mtd1,c,90,2 mdt2,c,90,4 mtd3,c,90,6 \

mtd4,c,90,8 mtd5,c,90,10 mtd6,c,90,12 mtd7,c,90,14 \

mtdblock0,b,31,0 mtdblock1,b,31,1 mtdblock2,b,31,2 mtdblock3,b,31,3 \

In the guide..
Thanx and Regrds

Vikram
