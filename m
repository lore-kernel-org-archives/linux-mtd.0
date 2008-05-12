Received: from web8607.mail.in.yahoo.com ([202.43.219.82])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JvXTh-0001f3-8J
	for linux-mtd@lists.infradead.org; Mon, 12 May 2008 12:50:06 +0000
Date: Mon, 12 May 2008 13:49:57 +0100 (BST)
From: veena s <veena_3_2003@yahoo.co.in>
Subject: Reg:FAT support for NAND
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <816646.88229.qm@web8607.mail.in.yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi ,


I want to Use FAT Filesystem for NAND in the Linux
Kernel ver-2.6.10.
We have tried by enabling NFTL layer . But we are
facing the following  problem to mount  with FAT.....
 
1 ) nftl_format : utility is used to format the device
requires the erase size to be 8k bytes, but our device
has erase size of 128kbytes.so nftl_format is not able
to recognise the erase size.
 
2 ) We have created the device nodes as /dev/nftla and
tried to mount FAT over it using the following
command.
 
mount -tvfat /dev/nftla /mnt/nand
but above command is failing.
 
So please suggest whether the above steps are
correct.?
and help us how to use FAT over NAND.
 
Thanks
 



      Planet Earth is in the hot seat. Know more - http://in.search.yahoo.com/search?&fr=na_onnetwork_mail_taglines&ei=UTF-8&rd=r1&p=global+warming
