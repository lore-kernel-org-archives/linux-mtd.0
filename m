Received: from smtp-3.hut.fi ([130.233.228.93] ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 177Y0j-0000AK-00
	for <linux-mtd@lists.infradead.org>; Tue, 14 May 2002 09:50:21 +0100
Received: from kosh.hut.fi (kosh.hut.fi [130.233.228.10])
	by smtp-3.hut.fi (8.12.3/8.12.3) with ESMTP id g4E8oKcM027483
	for <linux-mtd@lists.infradead.org>; Tue, 14 May 2002 11:50:20 +0300
Received: (from jlavi@localhost)
	by kosh.hut.fi (8.9.3/8.9.3) id LAA14376
	for linux-mtd@lists.infradead.org; Tue, 14 May 2002 11:50:20 +0300 (EET DST)
Resent-Message-Id: <200205140850.LAA14376@kosh.hut.fi>
Date: Tue, 14 May 2002 11:48:57 +0300
From: Jarkko Lavinen <jlavi@iki.fi>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: JFFS2 empty file overhead questions
Message-ID: <20020514114857.A27507@kosh.hut.fi>
References: <20020508113056.A2123@kosh.hut.fi> <5014.1020847608@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5014.1020847608@redhat.com>; from dwmw2@infradead.org on Wed, May 08, 2002 at 09:46:48AM +0100
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

> >  After 25519 files I couldn't track space usage with "df" anymore
> > because it started to give out of memory message. After 26647 my test
> > program couldn't run anymore because of out of memory. 

> cat /proc/slabinfo /proc/meminfo /proc/sys/fs/inode-nr

After 25000 files created slabinfo and meminfo are following. Sys/fs/i-node-nr
was not available. This test was still with the old JFFS2 code from February. 
I am now rerunning some of my tests with fresh code from CVS jffs2-2_4-branch.

slabinfo - version: 1.1
kmem_cache            62     68    112    2    2    1
tcp_tw_bucket          0      0     96    0    0    1
tcp_bind_bucket        0      0     32    0    0    1
tcp_open_request       0      0     64    0    0    1
inet_peer_cache        0      0     64    0    0    1
ip_fib_hash            0      0     32    0    0    1
ip_dst_cache           0      0    160    0    0    1
arp_cache              0      0    128    0    0    1
blkdev_requests       64     80     96    2    2    1
jffs2_inode_cache  25002  25012     20  148  148    1
jffs2_node_frag        0      0     20    0    0    1
jffs2_raw_node_ref  50063  50096     16  248  248    1
jffs2_tmp_dnode        0      0     12    0    0    1
jffs2_raw_inode        0      0     68    0    0    1
jffs2_raw_dirent       0     92     40    0    1    1
jffs2_full_dnode       1    202     16    1    1    1
dnotify cache          0      0     20    0    0    1
file lock cache        0      0     92    0    0    1
fasync cache           0      0     16    0    0    1
uid_cache              0      0     32    0    0    1
skbuff_head_cache      0      0    160    0    0    1
sock                   2      9    832    1    1    2
sigqueue               0     29    132    0    1    1
cdev_cache             1     59     64    1    1    1
bdev_cache             2     59     64    1    1    1
mnt_cache              9     59     64    1    1    1
inode_cache           31     49    512    7    7    1
dentry_cache          29     60    128    2    2    1
filp                  16     30    128    1    1    1
names_cache            0      1   4096    0    1    1
buffer_head          264    440     96   11   11    1
mm_struct              5     30    128    1    1    1
vm_area_struct        48     80     96    2    2    1
fs_cache               4     59     64    1    1    1
files_cache            4      9    416    1    1    1
signal_act             7      9   1312    3    3    1
pte-cache             15     16   2048    8    8    1
size-131072(DMA)       0      0 131072    0    0   32
size-131072            0      0 131072    0    0   32
size-65536(DMA)        0      0  65536    0    0   16
size-65536             0      0  65536    0    0   16
size-32768(DMA)        0      0  32768    0    0    8
size-32768             0      0  32768    0    0    8
size-16384(DMA)        0      0  16384    0    0    4
size-16384             0      0  16384    0    0    4
size-8192(DMA)         0      0   8192    0    0    2
size-8192              0      0   8192    0    0    2
size-4096(DMA)         0      0   4096    0    0    1
size-4096              2      2   4096    2    2    1
size-2048(DMA)         0      0   2048    0    0    1
size-2048              1      2   2048    1    1    1
size-1024(DMA)         0      0   1024    0    0    1
size-1024              1      4   1024    1    1    1
size-512(DMA)          0      0    512    0    0    1
size-512               9     16    512    2    2    1
size-256(DMA)          0      0    256    0    0    1
size-256               3     15    256    1    1    1
size-128(DMA)          0      0    128    0    0    1
size-128              52     60    128    2    2    1
size-64(DMA)           0      0     64    0    0    1
size-64            25009  25016     64  424  424    1
size-32(DMA)           0      0     32    0    0    1
size-32               32    113     32    1    1    1

        total:    used:    free:  shared: buffers:  cached:
Mem:   7012352  6922240    90112        0    24576  2490368
Swap:        0        0        0
MemTotal:         6848 kB
MemFree:            88 kB
MemShared:           0 kB
Buffers:            24 kB
Cached:           2432 kB
SwapCached:          0 kB
Active:           2264 kB
Inactive:          680 kB
HighTotal:           0 kB
HighFree:            0 kB
LowTotal:         6848 kB
LowFree:            88 kB
SwapTotal:           0 kB
SwapFree:            0 kB

Jarkko Lavinen
