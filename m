Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CEPtL-0004EH-63
	for linux-mtd@lists.infradead.org; Mon, 04 Oct 2004 06:16:31 -0400
Message-ID: <416122A1.4060302@oktetlabs.ru>
Date: Mon, 04 Oct 2004 14:14:57 +0400
From: Artem Bityuckiy <dedekind@oktetlabs.ru>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: dwmw2@infradead.org
Subject: inode checkpoints
Reply-To: dedekind@oktetlabs.ru
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello. We are working on the possibility to increase JFFS2 on NAND 
flashes and want to decrease the iget() call delay. We are going to 
introduce "inode checkpoints" which are special type of nodes. 
Checkpoints are created for the regular file inodes and directory inodes.

Here is the idea description.

-----------------------------------------------------------------------

Currently when JFFS2 builds the inode cache for a regular file (iget() 
call), it performs the following tasks (among others):

1 reads headers of all the file nodes;
2 reads all the file nodes data and checks CRC (if the data CRC wasn~Rt 
yet checked because this activity is only performed once for each file 
until unmount).

If the JFFS2 is used with the NAND flash type, the access to all the 
node headers which are distributed over different NAND flash pages might 
be very expensive (especially if the file is relatively big). It is more 
effective to have all these headers together in one inode checkpoint 
node and to read them all from few pages.

The second task is mainly needed to handle bad nodes and to perform roll 
backs. The roll back means, that if there are bad nodes, JFFS2 discards 
them and uses older ones. Thus, in case of unclean reboots, file data 
which have already been successfully written can not be corrupted by the 
subsequent broken writes. This mechanism doesn't guaranty the roll back 
in case of flash media corruption, just unclean reboots are handled.

Thus, it is important to check file data only once, and if it is OK, it 
isn't necessary to check it anymore. But currently, after every reboot 
all the files are rechecked. But with checkpoints, JFSS2 doesn't need to 
re-check nodes which are referred by the checkpoint, since they have 
already been checked when the checkpoint node was created. Thus, with 
checkpoints, fewer data have to be read and checked. This also decreases 
the iget() call delay.

When JFFS2 builds the inode cache for the directory inodes, it currently 
reads all the direntries, which are located in this directory. This also 
means that in case of directories with lots of direntries, JFFS2 reads 
lots of small direntry nodes from different NAND pages. Having the 
checkpoint for the directory, JFFS2 might read that information from 
much fewer pages.

The drawback of checkpoints is that the additional flash space is used. 
To save more space checkpoints are compressed.

-----------------------------------------------------------------------

Wha do JFFS2 folks think about the idea?

-- 
Best regards, Artem B. Bityuckiy
Oktet Labs (St. Petersburg), Software Engineer.
+78124286709 (office) +79112449030 (mobile)
E-mail: dedekind@oktetlabs.ru, web: http://www.oktetlabs.ru
