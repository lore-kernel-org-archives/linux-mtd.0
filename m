Received: from web14402.mail.yahoo.com ([216.136.174.59])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17BHA7-0003dC-00
	for <linux-mtd@lists.infradead.org>; Fri, 24 May 2002 16:39:27 +0100
Message-ID: <20020524153926.81509.qmail@web14402.mail.yahoo.com>
Date: Fri, 24 May 2002 23:39:26 +0800 (CST)
From: =?gb2312?q?cytang?= <cytang_cn@yahoo.com.cn>
Subject: Why cannot boot off my doc 2000 ?
To: linux-mtd@lists.infradead.org
In-Reply-To: <E17AqL9-00010h-00@pentafluge.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=gb2312
Content-Transfer-Encoding: 8bit
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

I have make a new kernel which can support doc . and I
have make a mini system on my doc like the following 
/doc/{bin,etc,sbin,lib,dev,proc,var,usr,mnt}, and
copied files I needed in respective directories

I mount the /dev/nftla1 on /doc .
my /doc/etc/lilo.conf is :

boot=/dev/nftla
install=/boot/boot.b-mtd
map=/boot/map-doc
disk=/dev/nftla
bios=0x80
prompt
delay = 50
timeout = 50
image = /boot/bzImage-doc
label = linuxondoc
root = /dev/nftla1
read-only

run:  lilo-mtd  -v -C /doc/etc/lilo.conf -r /doc

Patched LILO for M-Systems' DiskOnChip 2000
LILO version 21, Copyright 1992-1998 Werner
Almesberger

Ignoring entry 'install' 
Ignoring entry 'map'
Reading boot sector from /dev/nftla
Merging with /boot/boot.b-mtd
              ~~~~
Boot image: /boot/bzImage-doc
             ~~~~
Added linuxondoc *
/boot/boot.5D00 exists - no backup copy made.
~~~~~
Writing boot sector.

It seemed ok .but above why not /doc/boot?

If i remove my harddisk , I still cannot boot from my
doc . just get  "boot failure " .
why ?  Is something I did wrong ?  or I miss something
?


_________________________________________________________
Do You Yahoo!? 
摊开你的掌心 让我看看你
http://sweepstakes.yahoo.com/2002cnuser
