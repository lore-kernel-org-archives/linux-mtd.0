Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by pentafluge.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EKEhX-0007fJ-7U
	for linux-mtd@lists.infradead.org; Tue, 27 Sep 2005 13:36:53 +0100
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: =?UTF-8?Q?=EC=B5=9C=EC=98=81?= =?UTF-8?Q?=EC=9D=BC?= <yichoi@moimstone.com>
In-Reply-To: <000901c5c356$101c96c0$b400a8c0@LocalHost>
References: <000901c5c356$101c96c0$b400a8c0@LocalHost>
Content-Type: text/plain; charset=UTF-8
Date: Tue, 27 Sep 2005 15:57:04 +0400
Message-Id: <1127822225.5380.4.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: large-nand flash mount ?
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2005-09-27 at 20:24 +0900, 최영일 wrote:
> Hi
> I am developing system with cpu au1550 and 2G nand flash?
> I want root filesystem by 2G nand flash. 
> for test, I can mount nand flash and read, write to flash.
> so, I make jffs2 filesystem and write to flash.
> then, I make to boot with boot argument(root=/dev/mtdblock0), but fail
> the message follows
> ----------------------------
> mtdblock_open
> ok
> mtdblock: read on "Db1550 NAND FS 0" at 0x400, size 0x200
> nand_read_ecc: from = 0x00000400, len = 512
> mtdblock: read on "Db1550 NAND FS 0" at 0x600, size 0x200
> nand_read_ecc: from = 0x00000600, len = 512
> mtdblock_release
> nand_sync: called
> ok

Even if you have healed your problems with MTD, JFFS2 is anyway unusable
on large flashes. Hmm, MTD archive seems broken, so I just insert here
my recent reply to similar questions.


-------- Original Message --------
Subject: Re: fragtree method?
Date: Mon, 26 Sep 2005 12:16:01 +0400
From: Artem B. Bityutskiy <dedekind@yandex.ru>
To: hinko.kocevar@cetrtapot.si <hinko.kocevar@cetrtapot.si>
CC: Linux MTD <linux-mtd@lists.infradead.org>
References: <4337A604.6050204@cetrtapot.si>

Hello Hinko,

hinko.kocevar@cetrtapot.si wrote:
> Hello all,
> 
> We are using JFFS2 fs on toshiba NAND flash. There are several 
> partitions defined, but scan time at boot time gets longer every day
of 
> usage. Eg.  when flash is empty it takes ~10 s to mount 20Mb of flash
in 
> 3 partitions later when there are some files present it takes > 30s
and 
> increasing.
The picture you are observing is normal for JFFS2. The more data is in 
your flash, the longer is JFFS2 being mounted. I would shortly explain 
this as follows.

There is no indexing information stored on the flash media. Each JFFS2 
node contains full information about itself, but there is no central 
index. The index is the crucial part of any file system as it is used
to 
quickly locate any piece of information (i.e., find all the files kept 
in a directory, find the physical flash address where the files data is 
stored, etc.). In JFFS2, the index is maintained in RAM and takes 
significant amount of it. Roughly speaking, there is a in-RAM data 
structure for each on-flash node.

The in RAM index must be built on each mount. For this reason, JFFS2 
must scan the flash media. And it is logically then the more data you 
have on flash, the longer is JFFS2 mount time and memory consumption. 
Namely, the above 2 characteristics linearly depend on the flash size 
(O(N), N - flash size).

You may also glance at 
http://www.linux-mtd.infradead.org/tech/JFFS3design.pdf for some 
additional info.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
