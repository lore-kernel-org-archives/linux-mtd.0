Received: from smtp-out4.blueyonder.co.uk ([195.188.213.7])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AOEYu-0001M5-BO
	for <linux-mtd@lists.infradead.org>; Mon, 24 Nov 2003 11:07:24 +0000
Message-ID: <002601c3b27b$62ca9130$6401a8c0@f87htyy9967774jjyuww2>
From: "stephen" <lcbr17306@blueyonder.co.uk>
To: <linux-mtd@lists.infradead.org>
Date: Mon, 24 Nov 2003 11:09:10 -0000
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: booting from DOC
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

didn't get a reply from my last post , which was me rambling on a bit too
much or my text sounds arrogant? (sorry if it does i am just a newbie)

I've been reading Karim Yaghmours book, got much further now, maybe someone
can put me straight on a couple of things? (hopefully)

first of all I managed to install grub using 'doc_loadbios' so it replaces
the DOC's SPL , then I managed to use 'nftl_format' and formatted from
memory address '98304' which isn't the size of the grub boot loader but I
assume represents '16384 + 81920' , '81920' being the last erase offset,
from here I managed to 'fdisk nftla' and created a new partition
'/dev/nftla1', I can format this partition and safely read and write data. I
compiled all the DOC files as modules, I didn't patch the kernel I decided
to use a clean '2.4.19' kernel' , I also couldn't compile the latest CVS
tools ;/ so I went back to a previous snapshot
'Mtd-snapshot-20020708.tar.bz2' , this compiled fine (mainly I couldnt
compile nftl_format and something to do with empty LIST_HEAD structures,
blktrans.h with the latest CVS). I also realised that 'grub-0.92' needed
patching so i did that and repeated the steps with 'doc_loadbios' and
realised the last erase offset was now '65536' so the boot loader is smaller
and my new partition begins at offset '81920', plus this should have
contained 'ctrlbypass' as part of the grub compiled with patch.

The grub loader boots from the DOC but stops at the grub prompt, how do I
get grub to boot my kernel image ?
in karims book it talks about building a root filesystem and
/boot/grub/menu.lst but I can't see how this can run without the modules
loaded needed by the kernel (e.g. docecc.o, doc2000.o etc) confused ;/ ...

kind regards

Stephen
