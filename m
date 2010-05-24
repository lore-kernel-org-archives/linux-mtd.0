Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1OGStu-0004Wq-HG
	for linux-mtd@lists.infradead.org; Mon, 24 May 2010 08:20:43 +0000
Subject: Re: ubifs became broken on contigous power-fails
From: Artem Bityutskiy <dedekind1@gmail.com>
To: pazdnikov@prosoftsystems.ru
In-Reply-To: <201005241249.28629.pazdnikov@prosoft.ural.ru>
References: <E1OBqfw-0002Rs-00.pazdnikov-list-ru@f27.mail.ru>
	<1274614112.22999.17.camel@localhost>
	<1274617419.22999.24.camel@localhost>
	<201005241249.28629.pazdnikov@prosoft.ural.ru>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 24 May 2010 11:18:00 +0300
Message-ID: <1274689080.22999.43.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-05-24 at 12:49 +0600, Alexander Pazdnikov wrote:
> Artem, thank you very much, now applying your patches and making new stress-tests :-)
> 
> Also last holidays have caught another issue.
> 
> We've modified our program to primary mount ubi2:dbfs in RO, then sleep 3 secs, then remount in RW.
> Today have found half (5/10) of devices with the error : No space left on device
> If mount by hands this stalled fs primary in RW mode, then everything goes OK.
> If drop down mount "mount ubi2:dbfs in RO, then sleep 3 secs", leave only mount in RW, everything also goes OK.
> 
> [    6.576168] UBIFS: recovery needed
> [    6.665035] UBIFS: recovery deferred
> [    6.668941] UBIFS: mounted UBI device 2, volume 0, name "dbfs"
> [    6.674801] UBIFS: mounted read-only
> [    6.678707] UBIFS: file system size:   189407232 bytes (184968 KiB, 180 MiB, 1468 LEBs)
> [    6.687496] UBIFS: journal size:       9418752 bytes (9198 KiB, 8 MiB, 73 LEBs)
> [    6.694332] UBIFS: media format:       w4/r0 (latest is w4/r0)
> [    6.700191] UBIFS: default compressor: lzo
> [    6.705074] UBIFS: reserved for root:  4952683 bytes (4836 KiB)
> [    9.787104] UBIFS: completing deferred recovery
> Remounting ubi2:dbfs on /usr/local/ecom/db failed: No space left on device
> 
> # df
> Filesystem                Size      Used Available Use% Mounted on
> ubi0:rootfs              13.2M      7.2M      6.0M  55% /
> tmpfs                     4.0K         0      4.0K   0% /dev
> shm                       1.0M         0      1.0M   0% /dev/shm
> tmpfs                     1.0M     12.0K   1012.0K   1% /tmp
> tmpfs                     1.0M      4.0K   1020.0K   0% /root
> ubi1:logs                11.5M      2.4M      8.4M  22% /var/log
> ubi1:tmp                 13.4M     16.0K     12.7M   0% /usr/local/ecom/tmp
> ubi0:local                2.1M     44.0K      1.9M   2% /var/local
> ubi:config                2.0M     68.0K      1.9M   3% /usr/local/ecom/conf
> ubi2:dbfs               169.2M     18.7M    145.8M  11% /usr/local/ecom/db

Could you enable debugging messages when mounging it after power cuts?
The messages generate a lot of noise, so you need to disable them before
starting the real test. The idea is to get UBIFS debugging messages when
errors occur.

You can read about how to enable/disable the messages here:
http://www.linux-mtd.infradead.org/doc/ubifs.html#L_how_send_bugreport
and in the
Documentation/filesystems/ubifs.txt

The problems you see are probably budgeting bugs. Please, read this
section to get some idea what is the UBIFS budgeting subsystem about:
http://www.linux-mtd.infradead.org/doc/ubifs.html#L_spaceacc

I have a test which reproduces budgeting bugs here:
git://git.infradead.org/users/dedekind/ubifs-userspace.git

see the "freespace" test and the 'freespace.sh' script which runs the
freespace test on various NAND/NOR size and geometry flashes.

I never had time to really dig this and fix. Would be nice if you could
do this because I will unlikely have time in the nearest future, but I
can help you.

One think you can do is to make sure you do not fill UBIFS completely,
then you will avoid hitting these budgeting bugs, also known as ENOSPC
issues (I think btrfs uses this terminology).

E.g., if you work under a normal user, you can reserve more space for
the root (see -R mkfs.ubifs option). But of course, ideally we should
just fix the issues.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
