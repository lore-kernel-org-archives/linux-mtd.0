Received: from relay3.mail.twtelecom.net ([216.136.95.10])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1CooT4-0000Gn-5s
	for linux-mtd@lists.infradead.org; Wed, 12 Jan 2005 14:47:48 -0500
Received: from Spaceballs (66-194-80-47.gen.twtelecom.net [66.194.80.47])
	by relay3.mail.twtelecom.net (Postfix) with ESMTP id 900BA5EC9
	for <linux-mtd@lists.infradead.org>;
	Wed, 12 Jan 2005 13:47:40 -0600 (CST)
From: "Stuart Yoder" <stuart.yoder@conformative.com>
To: <linux-mtd@lists.infradead.org>
Date: Wed, 12 Jan 2005 13:47:27 -0600
Message-ID: <005401c4f8df$8be01350$2f010a0a@foundation.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Subject: JFFS2 mount time is really bad on 1st boot only
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


We are using JFFS2 in a  Linux 2.4.28 kernel based system (PowerPC based
hw).  We have a large (256MB) flash.

Here is the scenario for some behaviour we are seeing that we are trying
to undertand:

-create Linux root filesystem with mkfs.jffs2-- about 90MB of data.
-flash partition onto board-- ~90MB data, ~140MB free (erased)
-boot Linux
-mount of JFFS2 root partition takes on the order of 8 min
-reboot system from Linux
-mount of JFFS2 root partition takes ~30 sec

All subsequent boots take ~30 sec.

Does anybody have any idea of why the very first mount of the filesystem
takes so long?

Thanks,
Stuart Yoder
