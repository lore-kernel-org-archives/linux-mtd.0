Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SX9T9-0006Ad-QE
 for linux-mtd@lists.infradead.org; Wed, 23 May 2012 11:11:08 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [RFC v7] UBI: Fastmap support (aka checkpointing)
Date: Wed, 23 May 2012 13:06:30 +0200
Message-Id: <1337771191-95358-1-git-send-email-richard@nod.at>
Cc: Heinz.Egger@linutronix.de, tglx@linutronix.de, tim.bird@am.sony.com,
 linux-kernel@vger.kernel.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

v1: https://lwn.net/Articles/481612/
v2: https://lwn.net/Articles/496586/
v3: Didn't release it to linux-mtd
v4: http://article.gmane.org/gmane.linux.kernel/1297626
v5: http://article.gmane.org/gmane.linux.kernel/1298488
v6: https://lwn.net/Articles/498041/

Changes since v1:
       - renamed it to UBIVIS (at least in Kconfig)
       - UBIVIS parameters are now configurable via Kconfig
       - several bugs have been fixed (design and implementation bugs)
       - added lots of comments to make the review process easier
       - made checkpatch.pl happy

Changes since v2:
       - minor bugs have been fixed
       - renamed it to UBI fastmap (as Artem requested)

Changes since v3:
       - changed the on-flash layout (added padding fields, turned the
         EBA storage into an array)
       - fixed some corner cases (the protection queue needed some extra work)
       - removed the data type hint logic
       - rebased to Artems mtd tree

Changes since v4:
       - fixed static volume handling (used_ebs and last_data_bytes contained
         bad values in some cases)

Changes since v5:
       - merged it into a single patch
       - rebased to Artems mtd tree (addressed all renames)
       - fixed issues pointed out by Artem
       - redefined fastmap parameters

Changes since v6:
       - massive return code cleanup
       - made ubi_wl_put_fm_peb more robust
       - fastmap stores now bad_peb_count
       - some minor fixes (typos, renames)
       - fastmap makes now use of ubi_io_is_bad() and checks image_seq
         (mostly like scan_peb() does)
       - if update_fastmap() fails we switch to read-only mode
       - the CRC covers now the whole fastmap (super block + data)

The fastmap super block has to be located within the first 64 PEBs.
A fastmap can use up to 32 PEBs.
The fastmap pool (the number of to be scanned PEBs while attaching)
is now derived from the flash size.
The current formular is Np = max(min(5% of total PEBs, 256), 8)
Comments/better ideas?

git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubi2.git ubi2/v7

[PATCH] [RFC] UBI: Implement Fastmap support

Thanks,
//richard
