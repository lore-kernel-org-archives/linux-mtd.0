Received: from sccrmhc02.attbi.com ([204.127.202.62])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17rlOu-00049h-00
	for <linux-mtd@lists.infradead.org>; Wed, 18 Sep 2002 21:26:20 +0100
Received: from there ([12.245.142.8]) by sccrmhc02.attbi.com
          (InterMail vM.4.01.03.27 201-229-121-127-20010626) with SMTP
          id <20020918202548.JYOZ21527.sccrmhc02.attbi.com@there>
          for <linux-mtd@lists.infradead.org>;
          Wed, 18 Sep 2002 20:25:48 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Mark Meade <mark@lakeshoremicro.com>
To: linux-mtd@lists.infradead.org
Subject: Re: DiskOnChip 2000 with Mandrake Linux with kernel 2.4.18
Date: Wed, 18 Sep 2002 16:25:28 -0400
References: <3D88F3B4.CAEC541@pacific.net.sg>
In-Reply-To: <3D88F3B4.CAEC541@pacific.net.sg>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20020918202548.JYOZ21527.sccrmhc02.attbi.com@there>
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

Hor Meng Yoong wrote:
> b)  The DOC firmware was DOC42.EXB
>       - I tried to boot normal or failsafe mode, in both cases, grub
> told me:
>            "kernel (hd0,0)/boot/vmlinuz root=/dev/hda1 devfs=mount
> failsafe mem=128M
>                  [Linux-bzImage,  setup=0x1400,  size=0xfe6c8]
>                  Error 28: Selected item cannot fit into memory".

This error is caused by not having enough conventional memory (<608k).  The 
latest Grub code (CVS) appears to have lowered the memory requirements needed 
to boot a bzImage kernel.

The M-Sys DOC firmware seems to use up quite a bit of lower memory, and it 
hasn't gotten any better with the 5.x versions.  Yet another reason to 
replace it with Grub... ;-)
