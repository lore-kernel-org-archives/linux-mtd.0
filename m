Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UhA3L-0002Yo-7t
 for linux-mtd@lists.infradead.org; Tue, 28 May 2013 02:54:24 +0000
Message-ID: <1369709828.5446.89.camel@sauron.fi.intel.com>
Subject: Re: UBIFS failure & stable page writes
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Prins Anton (ST-CO/ENG1.1)" <Anton.Prins@nl.bosch.com>
Date: Tue, 28 May 2013 05:57:08 +0300
In-Reply-To: <85D877DD6EE67B4A9FCA9B9C3A4865670C3E8CBB8D@SI-MBX14.de.bosch.com>
References: <85D877DD6EE67B4A9FCA9B9C3A4865670C3E8CB9B7@SI-MBX14.de.bosch.com>
 <4BE1E71893EF1E4F9E9DD99FB4EBF0032C02EA2D44@SI-MBX02.de.bosch.com>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3E8CBA85@SI-MBX14.de.bosch.com>
 <20130527121828.GA32625@quack.suse.cz>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3E8CBB8D@SI-MBX14.de.bosch.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Jan Kara <jack@suse.cz>, Adrian Hunter <adrian.hunter@intel.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2013-05-27 at 15:13 +0200, Prins Anton (ST-CO/ENG1.1) wrote:
> Hi Artem and/or Adrian,
> 
> As you see we ran into some issue looking at UBIFS.
> (We use a custom build Linux-2.6.37.6 kernel/distro)

Oh, quite old. There might have been some fixes.

> Here you see a part of our log-output
> UBIFS DBG (pid 767): ubifs_bg_thread: background thread "ubifs_bgt1_1" started, PID 767
> UBIFS: recovery needed
> UBIFS: recovery completed
> UBIFS: mounted UBI device 1, volume 1, name "datafs"
> UBIFS: file system size:   640475136 bytes (625464 KiB, 610 MiB, 1241 LEBs)
> UBIFS: journal size:       10452992 bytes (10208 KiB, 9 MiB, 21 LEBs)
> UBIFS: media format:       w4/r0 (latest is w4/r0)
> UBIFS: default compressor: lzo
> UBIFS: reserved for root:  0 bytes (0 KiB)
> UBIFS DBG (pid 1): mount_ubifs: compiled on:         May 27 2013 at 13:08:24
> UBIFS DBG (pid 1): mount_ubifs: min. I/O unit size:  4096 bytes
> UBIFS DBG (pid 1): mount_ubifs: max. write size:     4096 bytes
> UBIFS DBG (pid 1): mount_ubifs: LEB size:            516096 bytes (504 KiB)
> UBIFS DBG (pid 1): mount_ubifs: data journal heads:  1
> UBIFS DBG (pid 1): mount_ubifs: UUID:                1D1AD726-53AB-4623-8D86-B7773B5EFA83
> UBIFS DBG (pid 1): mount_ubifs: big_lpt              0
> UBIFS DBG (pid 1): mount_ubifs: log LEBs:            4 (3 - 6)
> UBIFS DBG (pid 1): mount_ubifs: LPT area LEBs:       2 (7 - 8)
> UBIFS DBG (pid 1): mount_ubifs: orphan area LEBs:    1 (9 - 9)
> UBIFS DBG (pid 1): mount_ubifs: main area LEBs:      1241 (10 - 1250)
> UBIFS DBG (pid 1): mount_ubifs: index LEBs:          31
> UBIFS DBG (pid 1): mount_ubifs: total index bytes:   702944 (686 KiB, 0 MiB)
> UBIFS DBG (pid 1): mount_ubifs: key hash type:       0
> UBIFS DBG (pid 1): mount_ubifs: tree fanout:         8
> UBIFS DBG (pid 1): mount_ubifs: reserved GC LEB:     166
> UBIFS DBG (pid 1): mount_ubifs: first main LEB:      10
> UBIFS DBG (pid 1): mount_ubifs: max. znode size      240
> UBIFS DBG (pid 1): mount_ubifs: max. index node size 192
> UBIFS DBG (pid 1): mount_ubifs: node sizes:          data 48, inode 160, dentry 56
> UBIFS DBG (pid 1): mount_ubifs: node sizes:          trun 56, sb 4096, master 512
> UBIFS DBG (pid 1): mount_ubifs: node sizes:          ref 64, cmt. start 32, orph 32
> UBIFS DBG (pid 1): mount_ubifs: max. node sizes:     data 4144, inode 4256 dentry 312, idx 188
> UBIFS DBG (pid 1): mount_ubifs: dead watermark:      4096
> UBIFS DBG (pid 1): mount_ubifs: dark watermark:      8192
> UBIFS DBG (pid 1): mount_ubifs: LEB overhead:        2240
> UBIFS DBG (pid 1): mount_ubifs: max. dark space:     10166272 (9928 KiB, 9 MiB)
> UBIFS DBG (pid 1): mount_ubifs: maximum bud bytes:   8388608 (8192 KiB, 8 MiB)
> UBIFS DBG (pid 1): mount_ubifs: BG commit bud bytes: 6815744 (6656 KiB, 6 MiB)
> UBIFS DBG (pid 1): mount_ubifs: current bud bytes    405504 (396 KiB, 0 MiB)
> UBIFS DBG (pid 1): mount_ubifs: max. seq. number:    8295846
> UBIFS DBG (pid 1): mount_ubifs: commit number:       1434
> UBIFS error (pid 1): ubifs_iget: failed to read inode 1, error -2
> UBIFS DBG (pid 767): ubifs_bg_thread: background thread "ubifs_bgt1_1" stops
> 
> Looking into the code I see the failed to read inode 1, error -2 is cause by:
> "ubifs_lookup_level0 -> -ENOENT" located in tnc.c
> 
> Looking inside the ubifs_lookup_level0 function it flows out of the function through:
>         if (exact || !is_hash_key(c, key) || *n != -1) {
>                 dbg_tnc("found %d, lvl %d, n %d", exact, znode->level, *n);
>                 return exact;
>         }
> 
> Where: 
> 	exact = 0

'exact = 0' means we did not find exactly the key

> 	*n = -1

'n = -1' means that if the key existed in this B-tree node, it would
have been  placed before all the other keys there. IOW, the key is
smaller than all the keys in the B-tree node we found.

> 	So: "!is_hash_key(c, key)" must be true.

The key does not have a hash, which means this is not a directory entry
key. Direntry keys contain hash of the direntry name, so they may
collide.

Basically, the key you are looking up is not found.

> 'exact' is in the calling functioned interpret as found (where !found generates the error); this seems a littlebit curious to me.
> But on first sight its complex code and maybe you can give some glue?

Yes, the code is not very easy, because this is basically the core code
dealing with the main FS datastructure - the central B-tree. There are
many complexities to solve.

> I suppose a piece of 'tree node cache' has been build-up during recovery... could the problem be there?

TNC is a cache of the on-flash index tree, so it is "built-up" every
time it is traversed, which usually happens when something is being read
(e.g., files).

I think we did have bugs in recovery process which made nodes
"disappear". But I do not remember anymore the details. Usually
important fixes were CC-ed to -stable.

-- 
Best Regards,
Artem Bityutskiy
