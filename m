Received: from mail-qw0-f49.google.com ([209.85.216.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OyH3i-0000gg-JM
	for linux-mtd@lists.infradead.org; Wed, 22 Sep 2010 04:35:55 +0000
Received: by qwe4 with SMTP id 4so81982qwe.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 21 Sep 2010 21:35:53 -0700 (PDT)
MIME-Version: 1.0
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Wed, 22 Sep 2010 00:35:33 -0400
Message-ID: <AANLkTi=efR8LkMr_FVxV7V6TzZ2yd1-=2ph5vsaNz41U@mail.gmail.com>
Subject: flash_erase vs flash_eraseall
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

while looking to extend the erase ioctl abi to take a flags argument,
i needed updated utils to test my work.  reviewing the flash_erase and
flash_eraseall code bases makes me wonder why there are even two tools
in the first place.  "eraseall" sounds like it should simply be an
option to the "erase" util.  so why does it warrant its own code base
for a mere option ?

also in looking at these utils, flash_erase does not support the
extended 64bit api as it is doing ioctls directly nor does it use
getopt.  flash_eraseall however is using the common libmtd api (so it
gets the extend api support for free), and it is cleanly using getopt
cleanly.  which leads to a simple conclusion from my side ...

let's punt the current flash_erase code, rename flash_eraseall to
flash_erase, and then extend its options to support the minor
functionality of flash_erase.  doesnt look like it'll be hard at all
to do this.  but before i undertake the task, i want to make sure the
idea isnt simply going to be rejected due to some concern about
retaining backwards compatibility.

running `flash_erase /dev/mtd#` (no arguments) will make it erase the
first block.  this seems kind of useless to me.

so i'd make the arguments:
flash_erase [options] <mtd> <start> [count]
Options:
  -N, --erasebad
  -j, --jffs2
  -u, --unlock
  -q, --quiet
        --silent

for the "all" functionality, we can have a value of "-1" or "0" for
the count mean "all", or make people type "all".
-mike
