Received: from [140.117.176.20] (helo=wamis0.cse.nsysu.edu.tw)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17rKRi-0001kS-00
	for <linux-mtd@lists.infradead.org>; Tue, 17 Sep 2002 16:39:26 +0100
Received: from localhost (gamble@localhost)
	by wamis0.cse.nsysu.edu.tw (8.11.4/8.11.3) with ESMTP id g8HFdKk14608
	for <linux-mtd@lists.infradead.org>; Tue, 17 Sep 2002 23:39:21 +0800 (CST)
	(envelope-from gamble@wamis0.cse.nsysu.edu.tw)
Date: Tue, 17 Sep 2002 23:39:20 +0800 (CST)
From: =?X-UNKNOWN?Q?=AAL=AD=D7=BDn?= <gamble@wamis0.cse.nsysu.edu.tw>
To: linux-mtd@lists.infradead.org
Subject: the problem of mounting a writeable partition
Message-ID: <Pine.BSF.4.21.0209172303590.14573-100000@wamis0.cse.nsysu.edu.tw>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

dear all 
	I have problems about mounting a writeable partition.
	when I create a partition which capacity is larger than 2MB and
        mount it with JFFS2 filesystem , it works well .
        But when I create a partition which capacity is smaller than 2MB
        and mount it , I can't create any file on it.
	I try to make a  directory on it , it displays the following error
        message :
	
	mkdir: Cannot create directory `test': No space left on device
	
	Is there any limitation about the partition size.
	
	Any help would be appreciated.
