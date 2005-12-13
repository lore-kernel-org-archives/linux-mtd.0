Received: from fmr19.intel.com ([134.134.136.18] helo=orsfmr004.jf.intel.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Em3iC-0004Uv-2j
	for linux-mtd@lists.infradead.org; Tue, 13 Dec 2005 01:32:35 -0500
From: "zhao, forrest" <forrest.zhao@intel.com>
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>
In-Reply-To: <439D5159.4030704@yandex.ru>
References: <439C33D2.506@yandex.ru>
	<1134367675.3152.9.camel@localhost.localdomain>
	<439D5159.4030704@yandex.ru>
Content-Type: text/plain
Date: Tue, 13 Dec 2005 14:26:49 +0800
Message-Id: <1134455209.7346.12.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: EBH question 1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi, Artem

The following is what I do in my lab:
1 download MTD snapshot of 2005/10/30(the
snapshot before I check in EBH patch)
2 ./patchkernel.sh -c -2 /usr/src/linux.2.6.12.2
3 make; make modules_install
4 modprobe mtdram
5 cd util/; make
6 ./flash_eraseall -j /dev/mtd0
Then kernel panic happened, seemed there's a bug
in mtd_char code.

So I use another way to do the test:
1 download MTD snapshot of 2005/10/30(the
snapshot before I check in EBH patch)
2 ./patchkernel.sh -c -2 /usr/src/linux.2.6.12.2
3 make; make modules_install
4 modprobe mtdram
5 mount -t jffs2 /dev/mtdblock0 /mnt
6 copy two files to /mnt
7 umount /mnt
8 download MTD snapshot of 2005/11/10(the
snapshot with EBH patch)
9 ./patchkernel.sh -c -2 /usr/src/linux.2.6.12.2
10 make; make modules_install
11 mount -t jffs2 /dev/mtdblock0 /mnt
12 the previously copied two files are still there
13 run ltp fs test on /mnt
14 nothing wrong happened, no error report

May I know what happened at your side?

Thanks,
Forrest
