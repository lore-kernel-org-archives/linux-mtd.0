Received: from vsnlchnsym01.vsnlxchange.com ([59.163.96.2])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JTypJ-0003bU-Qg
	for linux-mtd@lists.infradead.org; Tue, 26 Feb 2008 12:22:30 +0000
Received: from vsnlchnsym01.vsnlxchange.com (unknown [127.0.0.1])
	by vsnlchnsym01.vsnlxchange.com (Symantec Mail Security) with ESMTP id
	5FDD352018C for <linux-mtd@lists.infradead.org>;
	Tue, 26 Feb 2008 17:52:22 +0530 (IST)
From: "Gangadhar Kodishala" <gangadhark@tataelxsi.co.in>
To: <linux-mtd@lists.infradead.org>
Subject: NAND jffs2 partition problem
Date: Tue, 26 Feb 2008 17:54:52 +0530
Message-ID: <OEEHIIIJHDGOBJFAANGNKEEGCBAA.gangadhark@tataelxsi.co.in>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
content-transfer-encoding: 7bit
Reply-To: gangadhark@tataelxsi.co.in
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

My NAND jffs2 partition is of size 6MB and I use only 5MB of it for root
filesystem image.
I am trying to use the extra 1MB space for the user-specific data like the
version information.

My bootloader checks this version information for selecting the latest
version of root filesystem.

But when I boot with the JFFS2 file system mounted with this partition, the
extra 1 MB space is
written with 0xFF. So the next time when my bootloader checks for the
version information I get
all 0xff.

How do I make use of this extra space for storing my user-specific data ?

Regards,
Gangadhar


The information contained in this electronic message and any attachments to this message are intended for the exclusive use of the addressee(s) and may contain proprietary, confidential or privileged information. If you are not the intended recipient, you should not disseminate, distribute or copy this e-mail. Please notify the sender immediately and destroy all copies of this message and any attachments contained in it.

Contact your Administrator for further information.
