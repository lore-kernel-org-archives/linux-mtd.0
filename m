Received: from mx.novero.com ([212.23.138.198])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b84QI-0007ez-Lx
 for linux-mtd@lists.infradead.org; Wed, 01 Jun 2016 11:34:55 +0000
Received: from novexc01.internal.novero.com ([10.121.42.25]:51225)
 by mx.novero.com with esmtps (TLSv1:AES256-SHA:256)
 (Exim 4.82_1-5b7a7c0-XX) (envelope-from <Sven.Eisenberg@novero.com>)
 id 1b84Pp-0004i6-2K
 for linux-mtd@lists.infradead.org; Wed, 01 Jun 2016 13:34:25 +0200
To: <linux-mtd@lists.infradead.org>
From: Sven Eisenberg <sven.eisenberg@novero.com>
Subject: Data not freed after remove?
Message-ID: <574EC86D.8030002@novero.com>
Date: Wed, 1 Jun 2016 13:35:09 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi MTD list

I've seen a problem on our embedded device with UBI/UBIFS. Kernel
2.6.31+UBI/UBIFS at level ~3.10.y.

In short summary what i see is:

1. Deleting a folder with a big file (680MB) in a partition of 892MB size.
2. Perform a sync.
3. Read available free space with statvfs, fails. It reports the same
value as before deletion.
4. remount partition as ro, fails. But no message in dmesg.

Is there any reason/bug known that would cause this behavior?
I know this can happen, when there i an open filedescriptor to the file.
So i verified and this is not the case for me.

Thanks in advance, Sven Eisenberg




-- 

*Sven Eisenberg*

 

novero GmbH | Meesmannstr. 103 | 44807 Bochum | Germany | Amtsgericht
Bochum | HRB 16050 | Umsatzsteueridentifikationsnummer: DE 814973142 |
Geschäftsführer: Steven E. Brown, Michael Heinz Michels, Jacobus
Gerhardus du Plessis

 

A Laird business www.lairdtech.com <http://www.lairdtech.com>
