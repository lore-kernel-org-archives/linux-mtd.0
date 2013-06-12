Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Umfrr-0006uI-Kf
 for linux-mtd@lists.infradead.org; Wed, 12 Jun 2013 07:53:20 +0000
Message-ID: <51B82A1D.30009@intel.com>
Date: Wed, 12 Jun 2013 10:58:21 +0300
From: Adrian Hunter <adrian.hunter@intel.com>
MIME-Version: 1.0
To: "Prins Anton (ST-CO/ENG1.1)" <Anton.Prins@nl.bosch.com>
Subject: Re: UBIFS failure & stable page writes
References: <85D877DD6EE67B4A9FCA9B9C3A4865670C3E8CB9B7@SI-MBX14.de.bosch.com>
 <4BE1E71893EF1E4F9E9DD99FB4EBF0032C02EA2D44@SI-MBX02.de.bosch.com>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3E8CBA85@SI-MBX14.de.bosch.com>
 <20130527121828.GA32625@quack.suse.cz>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3E8CBB8D@SI-MBX14.de.bosch.com>
 <1369709828.5446.89.camel@sauron.fi.intel.com>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3E8CBD81@SI-MBX14.de.bosch.com>
 <1369727042.5446.112.camel@sauron.fi.intel.com>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3E8CBE33@SI-MBX14.de.bosch.com>
 <1369732266.5446.117.camel@sauron.fi.intel.com>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3E91DC9C@SI-MBX14.de.bosch.com>
 <1369810158.5446.208.camel@sauron.fi.intel.com>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3E91E697@SI-MBX14.de.bosch.com>
 <1370239282.21714.21.camel@sauron.fi.intel.com>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3EA0F38E@SI-MBX14.de.bosch.com>
In-Reply-To: <85D877DD6EE67B4A9FCA9B9C3A4865670C3EA0F38E@SI-MBX14.de.bosch.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This shows that the orphan area has recorded the orphaning of inode 0 (non-existent!) and inode 1 (root inode!!!).

A sticking plaster solution is to prevent orphans-processing from deleting the root inode e.g.

diff --git a/fs/ubifs/orphan.c b/fs/ubifs/orphan.c
index ba32da3..9400b5b 100644
--- a/fs/ubifs/orphan.c
+++ b/fs/ubifs/orphan.c
@@ -613,6 +613,11 @@ static int do_kill_orphans(struct ubifs_info *c, struct ubifs_scan_leb *sleb,
                n = (le32_to_cpu(orph->ch.len) - UBIFS_ORPH_NODE_SZ) >> 3;
                for (i = 0; i < n; i++) {
                        inum = le64_to_cpu(orph->inos[i]);
+                       if (inum < UBIFS_FIRST_INO) {
+                               ubifs_err("*not* deleting orphaned inode %lu",
+                                         (unsigned long)inum);
+                               continue;
+                       }
                        dbg_rcvry("deleting orphaned inode %lu",
                                  (unsigned long)inum);
                        err = ubifs_tnc_remove_ino(c, inum);


On 11/06/13 15:16, Prins Anton (ST-CO/ENG1.1) wrote:
> Hi Artem,
> 
> We got logging inside the recovery procedure to print the 'orphan LEB' information.
> I wonder if the LEB9 moves yes/no? So is it safe to use 'dd' with an offset of 9*LEB?
> (Difficulty is we have no file system, so this was the first option...)
> 
> You see flood of message's; but I suppose the first part is the information required!
> If not I have to make some solution to go for 'dd'.
> 
> Thanks in advance,
> 
> Anton
> 
> 
> 
> leb9dump-filtered.log
> 
> 
> UBIFS: parse sync
> UBIFS: recovery needed
> ubi_leb_read datafs 9
> 00000000: 31 18 10 06 1a c9 4a be 09 ca 5d 00 00 00 00 00 28 00 00 00 0b 00 00 00 60 05 00 00 00 00 00 80  1.....J...].....(.......`.......
> 00000020: ea 88 0c 00 00 00 00 00 31 18 10 06 74 7c 20 ed 00 00 00 00 00 00 00 00 1c 00 00 00 05 00 00 00  ........1...t| .................
> 00000040: bc 0f 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................................
> 00000060: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................................


struct ubifs_ch {
	__le32 magic;		06101831	06101831
	__le32 crc;		be4ac91a	ed207c74
	__le64 sqnum;		5dca09		0
	__le32 len;		28		1c
	__u8 node_type;		b=orph		5=pad
	__u8 group_type;	0		0
	__u8 padding[2];	0		0
} __packed;

struct ubifs_orph_node {
	struct ubifs_ch ch;
	__le64 cmt_no;		60 05 00 00 00 00 00 80
	__le64 inos[];		0c88ea
				
} __packed;

struct ubifs_pad_node {
	struct ubifs_ch ch;
	__le32 pad_len;		0fbc
} __packed;


<snip>

> 00001000: 31 18 10 06 33 f1 d9 f4 0c 80 6e 00 00 00 00 00 28 00 00 00 0b 00 00 00 73 05 00 00 00 00 00 80  1...3.....n.....(.......s.......
> 00001020: 9f ea 0e 00 00 00 00 00 31 18 10 06 74 7c 20 ed 00 00 00 00 00 00 00 00 1c 00 00 00 05 00 00 00  ........1...t| .................
> 00001040: bc 0f 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................................
> 00001060: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................................

	__le32 len;		28
	__le64 cmt_no;		73 05 00 00 00 00 00 80
	__le64 inos[];		0eea9f

<snip>

> 00002000: 31 18 10 06 c0 79 a0 c5 35 65 6f 00 00 00 00 00 28 00 00 00 0b 00 00 00 74 05 00 00 00 00 00 80  1....y..5eo.....(.......t.......
> 00002020: 4c 0b 0f 00 00 00 00 00 31 18 10 06 74 7c 20 ed 00 00 00 00 00 00 00 00 1c 00 00 00 05 00 00 00  L.......1...t| .................
> 00002040: bc 0f 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................................
> 00002060: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................................

	__le32 len;		28
	__le64 cmt_no;		74 05 00 00 00 00 00 80
	__le64 inos[];		0f0b4c

<snip>

> 00003000: 31 18 10 06 f8 40 ed 34 89 2f 71 00 00 00 00 00 28 00 00 00 0b 00 00 00 76 05 00 00 00 00 00 80  1....@.4./q.....(.......v.......
> 00003020: 00 00 00 00 00 00 00 00 31 18 10 06 74 7c 20 ed 00 00 00 00 00 00 00 00 1c 00 00 00 05 00 00 00  ........1...t| .................
> 00003040: bc 0f 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................................
> 00003060: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................................

	__le32 len;		28
	__le64 cmt_no;		76 05 00 00 00 00 00 80
	__le64 inos[];		0				<----- !!!!!

<snip>

> 00004000: 31 18 10 06 43 37 1d 7e 00 73 77 00 00 00 00 00 28 00 00 00 0b 00 00 00 7d 05 00 00 00 00 00 80  1...C7.~.sw.....(.......}.......
> 00004020: 01 00 00 00 00 00 00 00 31 18 10 06 74 7c 20 ed 00 00 00 00 00 00 00 00 1c 00 00 00 05 00 00 00  ........1...t| .................
> 00004040: bc 0f 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................................
> 00004060: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................................

	__le32 len;		28
	__le64 cmt_no;		7d 05 00 00 00 00 00 80
	__le64 inos[];		1				<----- !!!!!

<snip>

> 00005000: 31 18 10 06 86 67 56 c0 53 c8 7d 00 00 00 00 00 28 00 00 00 0b 00 00 00 84 05 00 00 00 00 00 80  1....gV.S.}.....(...............
> 00005020: 8a 18 11 00 00 00 00 00 31 18 10 06 74 7c 20 ed 00 00 00 00 00 00 00 00 1c 00 00 00 05 00 00 00  ........1...t| .................
> 00005040: bc 0f 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................................
> 00005060: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................................

	__le32 len;		28
	__le64 cmt_no;		84 05 00 00 00 00 00 80
	__le64 inos[];		11188a

<snip>

> 00006000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  ................................

<snip>

> UBIFS: recovery completed
> UBIFS: mounted UBI device 1, volume 1, name "datafs"
> UBIFS: file system size:   640475136 bytes (625464 KiB, 610 MiB, 1241 LEBs)
> UBIFS: journal size:       10452992 bytes (10208 KiB, 9 MiB, 21 LEBs)
> UBIFS: media format:       w4/r0 (latest is w4/r0)
> UBIFS: default compressor: lzo
> UBIFS: reserved for root:  0 bytes (0 KiB)
> UBIFS error (pid 1): ubifs_iget: failed to read inode 1, error -2
> ubifs_fill_super couldn't read UBIFS_ROOT_INO
> 
