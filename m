Received: from [61.172.253.41] (helo=mail.shdv.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18Mlso-0003og-00
	for <linux-mtd@lists.infradead.org>; Fri, 13 Dec 2002 09:13:23 +0000
Message-ID: <170D6E898D7BD5118FFC00105A74CCB18361D7@DVSVR01>
From: Xu Kegang <xukegang@shdv.com>
To: linux-mtd@lists.infradead.org
Subject: CRC Error when reading a file?
Date: Fri, 13 Dec 2002 17:44:26 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="GB2312"
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

Hi,sir
	We met a problem about CRC error when reading a file. It seemed that
it will run smoothly in case of a smaller file ,such as 5k byte. But it will
occur when a bigger file,
such as 800KB. We have used mkfs.jffs2 (Version 1.26, 2.4.18 -rmk3 for arm)
in a  big-endian way.   
	Another question is the size of uesed percent varies when we use "df
" to list every device on system. But we can come to a stable value after
several commands "df".
How can I fix this problem.

Thanks a lot

Tos

Dec 13 2002
