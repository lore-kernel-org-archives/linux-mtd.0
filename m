Received: from nm17-vm0.bullet.mail.sp2.yahoo.com ([98.139.91.212])
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SfEVQ-0006mh-Qi
 for linux-mtd@lists.infradead.org; Thu, 14 Jun 2012 18:10:54 +0000
Message-ID: <1339697449.33591.YahooMailClassic@web110603.mail.gq1.yahoo.com>
Date: Thu, 14 Jun 2012 11:10:49 -0700 (PDT)
From: Aaron Rocha <hxdg21@yahoo.com>
Subject: Detecting file-system corruption
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi there,

I am running:

Linux 2.6.33.2 on a AMCC PowerPC 440EP.

I am looking for a solution that would allow me to detect file-system 
corruption in JFFS2. I plan to react to file-system corruption by 
failing back to a previously stored JFFS2 image. From what I have 
gathered JFFS2 does store CRCs for all the nodes and data associated 
with them. Although it looks like I would not be able to force a full 
CRC check when mouting the file system, I could probably force that by 
making sure that I access every dir and file stored in it after the 
file system is mounted (e.g., bash for loop). Can you think of a better 
way to force a full CRC check?

I tried to perform a quick test by chaging a byte in the data area of a 
node associated with a small text file. The test was successfull. After 
loading the JFFS2 image on my target, when I tried to access the file, I 
got the following warnings:

JFFS2 warning: (1260) jffs2_get_inode_nodes: Eep. No valid nodes for ino #9.
JFFS2 warning: (1260) jffs2_do_read_inode_internal: no data nodes found for 
ino #9

However, when I tried something similar with a larger file (i.e., an ELF 
binary), it looks like JFFS2 is recovering (or at least attempting to) from my 
attempt to corrupt the image. In the case of the good image, I get a 'Reading 
0-4096 from node at 0x00058bf8' in dmesg. After chaging a byte in the data 
area of node 0x58bf8, I get a 'Filling frag hole from 0-4096 (frag 0x0 
0x1000)' message instead. I can also tell that a lot of other nodes are 
accessed at the bottom of the log. I imagine the extra nodes contain redundant 
data that allows JFFS2 to recover. 

All I want to do is to force a full CRC check and get some feedback that 
corruption was detected. Is there something I can do in order to accomplish 
this goal?

Thanks in advance
