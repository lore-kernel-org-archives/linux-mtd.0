Received: from mx1.prosoftsystems.ru ([212.23.72.203])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1OGRTY-00005y-R0
	for linux-mtd@lists.infradead.org; Mon, 24 May 2010 06:49:26 +0000
From: Alexander Pazdnikov <pazdnikov@prosoft.ural.ru>
To: <linux-mtd@lists.infradead.org>
Subject: Re: ubifs became broken on contigous power-fails
Date: Mon, 24 May 2010 12:49:28 +0600
References: <E1OBqfw-0002Rs-00.pazdnikov-list-ru@f27.mail.ru>
	<1274614112.22999.17.camel@localhost>
	<1274617419.22999.24.camel@localhost>
In-Reply-To: <1274617419.22999.24.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <201005241249.28629.pazdnikov@prosoft.ural.ru>
Reply-To: pazdnikov@prosoftsystems.ru
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem, thank you very much, now applying your patches and making new stress-tests :-)

Also last holidays have caught another issue.

We've modified our program to primary mount ubi2:dbfs in RO, then sleep 3 secs, then remount in RW.
Today have found half (5/10) of devices with the error : No space left on device
If mount by hands this stalled fs primary in RW mode, then everything goes OK.
If drop down mount "mount ubi2:dbfs in RO, then sleep 3 secs", leave only mount in RW, everything also goes OK.

[    6.576168] UBIFS: recovery needed
[    6.665035] UBIFS: recovery deferred
[    6.668941] UBIFS: mounted UBI device 2, volume 0, name "dbfs"
[    6.674801] UBIFS: mounted read-only
[    6.678707] UBIFS: file system size:   189407232 bytes (184968 KiB, 180 MiB, 1468 LEBs)
[    6.687496] UBIFS: journal size:       9418752 bytes (9198 KiB, 8 MiB, 73 LEBs)
[    6.694332] UBIFS: media format:       w4/r0 (latest is w4/r0)
[    6.700191] UBIFS: default compressor: lzo
[    6.705074] UBIFS: reserved for root:  4952683 bytes (4836 KiB)
[    9.787104] UBIFS: completing deferred recovery
Remounting ubi2:dbfs on /usr/local/ecom/db failed: No space left on device

# df
Filesystem                Size      Used Available Use% Mounted on
ubi0:rootfs              13.2M      7.2M      6.0M  55% /
tmpfs                     4.0K         0      4.0K   0% /dev
shm                       1.0M         0      1.0M   0% /dev/shm
tmpfs                     1.0M     12.0K   1012.0K   1% /tmp
tmpfs                     1.0M      4.0K   1020.0K   0% /root
ubi1:logs                11.5M      2.4M      8.4M  22% /var/log
ubi1:tmp                 13.4M     16.0K     12.7M   0% /usr/local/ecom/tmp
ubi0:local                2.1M     44.0K      1.9M   2% /var/local
ubi:config                2.0M     68.0K      1.9M   3% /usr/local/ecom/conf
ubi2:dbfs               169.2M     18.7M    145.8M  11% /usr/local/ecom/db

-- 
Best regards,
Sasha
