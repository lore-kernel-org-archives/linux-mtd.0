Received: from w228.z208176144.sjc-ca.dsl.cnc.net ([208.176.144.228]
	helo=ns1.pwrseries.com)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1ET6Z3-0005vm-SE
	for linux-mtd@lists.infradead.org; Fri, 21 Oct 2005 19:44:50 -0400
Received: from jmd (w238.z208176144.sjc-ca.dsl.cnc.net [208.176.144.238])
	(authenticated bits=0)
	by ns1.pwrseries.com (8.12.8/8.12.8) with ESMTP id j9LNKDj4029266
	(version=TLSv1/SSLv3 cipher=DES-CBC3-SHA bits=168 verify=NO)
	for <linux-mtd@lists.infradead.org>; Fri, 21 Oct 2005 16:20:13 -0700
From: "Joseph M Dupre (AVAB Inc.)" <dupre@avab.com>
To: linux-mtd@lists.infradead.org
Date: Fri, 21 Oct 2005 16:44:42 -0700
MIME-Version: 1.0
Message-ID: <43591AFA.21753.1B79E87@localhost>
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body
Subject: Do I need TrueFFS on INFTL Disk-On-Chip?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am a bit confused over the functions of nftl/inftl and TrueFFS in 
regards to wear-leveling on DOC devices.

The DOC 2000 devices come pre-partitioned with a FAT filesystem on a 
"disk" (BDTL) partition.  It is my understanding that what M-Systems 
calls "TrueFFS" is loaded at boot time from the "binary" (BDK) 
partition.  Is it this TrueFFS that sits between the FAT filesystem 
and the flash that does all the necessary wear-leveling?

I am assuming that if I reformat the disk (BDTL) partition to Ext2 or 
Ext3 or whatever using linux fdisk and mkfs, the TrueFFS is still 
sitting there doing the job of wear leveling on whatever filesystem I 
choose to use on the DOC.  Is this correct?

So what happens when I re-write the BDK partition with code like 
DOCboot or Grub?  Is the wear leveling mechanism gone at that point 
or is wear-leveling part of the "inftl" layer which still exists?  
Where does the "inftl" reside?  Is that part of the DOC or the 
kernel?

Please advise before I burn out my DOC! 

- Joe
