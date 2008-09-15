Received: from relay01.pair.com ([209.68.5.15])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KfHZc-0001CJ-B8
	for linux-mtd@lists.infradead.org; Mon, 15 Sep 2008 17:09:16 +0000
Date: Mon, 15 Sep 2008 10:09:06 -0700
Subject: JFFS2 File System Size Mismatches: Online Replication vs. Mkfs.jffs2
From: Grant Erickson <gerickson@nuovations.com>
To: "\"linux-mtd@lists.infradead.org\"" <linux-mtd@lists.infradead.org>
Message-ID: <C4F3E4C2.11ACD%gerickson@nuovations.com>
Mime-version: 1.0
Content-type: text/plain;
	charset="US-ASCII"
Content-transfer-encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have an interesting JFFS2 anomaly with regards to file system sizes that I
am hoping someone on the list has some insight on. For my system, I produce
a root file system image using mkfs.jffs2 as follows:

    mkfs.jffs2 --big-endian --no-cleanmarkers --pad 512 --pagesize 512  \
    --eraseblock 16384                                                  \
    -d /tmp/tmp.AEvYZ20385 -D root.devtable -o root.jffs2

And I end up with an image that is 14.0 MiB in size. Compression is
effective in reducing the image size down from 20.0 MiB, the image size when
'-m none' is passed to mkfs.jffs2.

Installed on the target system, 'df -h' reports:

    Filesystem                Size      Used Available Use% Mounted on
    /dev/mtdblock11          20.0M     14.0M      6.0M  70% /

However, if I then replicate, using rsync, this file system onto an
identical, yet empty partition, I end up with a file system that 'df'
reports as substantially smaller despite the fact that the file system BOM
is identical, diff says everything is the same, and a random sampling of MD5
sums shows files to be identical:

    Filesystem                Size      Used Available Use% Mounted on
    /dev/mtdblock11          20.0M     14.0M      6.0M  70% /
    /dev/mtdblock9           20.0M      9.3M     10.7M  46% /mnt/root0

The kernel is configured as:

    CONFIG_JFFS2_FS=y
    CONFIG_JFFS2_FS_DEBUG=0
    CONFIG_JFFS2_FS_WRITEBUFFER=y
    # CONFIG_JFFS2_FS_WBUF_VERIFY is not set
    # CONFIG_JFFS2_SUMMARY is not set
    # CONFIG_JFFS2_FS_XATTR is not set
    # CONFIG_JFFS2_COMPRESSION_OPTIONS is not set
    CONFIG_JFFS2_ZLIB=y
    # CONFIG_JFFS2_LZO is not set
    CONFIG_JFFS2_RTIME=y
    # CONFIG_JFFS2_RUBIN is not set

My conclusion seems to be that mkfs.jffs2 and the kernel are compressing
things differently; however, 14.0 MiB seems to be the best I can coax out of
mkfs.jffs2 with any of LZO, ZLIB or RTIME.

Any insights or places to start digging? Have I discovered JFFS2 dark
matter? ;-)

Regards,

Grant
