Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CCH7V-0005a6-CA
	for linux-mtd@lists.infradead.org; Tue, 28 Sep 2004 08:30:17 -0400
Received: from [192.168.37.21] (sauron.oktetlabs.ru [192.168.37.21])
	by shelob.oktetlabs.ru (Postfix) with ESMTP id 60494229B6
	for <linux-mtd@lists.infradead.org>;
	Tue, 28 Sep 2004 16:29:10 +0400 (MSD)
Message-ID: <41595913.4040007@yandex.ru>
Date: Tue, 28 Sep 2004 16:29:07 +0400
From: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: JFFS2 an nodes checking
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello. I have a question that a wanted to ask just after I've known 
JFFS2. For some reasons I didn't ask it yet.


When JFFS2 is being mounted, all the node header CRC checksums (hdr_crc 
and node_crc) are checked. The data CRC checksums (data_crc) aren't checked.

The data CRCs are checked by either Garbage Collector or on iget() 
request when the inode cache is being built.

To check the regular file inode's CRC the whole it's content must be 
read. This may be time-expensive in case of big file. Especially if the 
NAND flash device is used.

Why when user opens a big file he need to wait while all it's contents 
will be read? Moreover, the CRCs are checked anyway on any read request 
(of course, for nodes which are involved to this request). Is this delay 
really needed? Why not to just leave the inode in the 
INO_STATE_UNCHECKED state - the Garbage Collector will check it some 
time? ....

It seems OK for me when the Garbage Collector checks CRCs in background, 
but the delay on the iget() request doesn't seem to be necessary.

Did I miss something?

Thanks in advance.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
