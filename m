Received: from cdptpa-omtalb.mail.rr.com ([75.180.132.121])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Jt2ji-0003RI-D7
	for linux-mtd@lists.infradead.org; Mon, 05 May 2008 15:36:18 +0000
Received: from techwriter ([76.169.225.3]) by cdptpa-omta05.mail.rr.com
	with SMTP
	id <20080505153617.GCYZ720.cdptpa-omta05.mail.rr.com@techwriter>
	for <linux-mtd@lists.infradead.org>; Mon, 5 May 2008 15:36:17 +0000
Message-ID: <004701c8aec5$c1aed530$6401a8c0@techwriter>
From: "Yigal Sadgat" <YSadgat1@gcte.com>
To: <linux-mtd@lists.infradead.org>
Subject: Compact Flash Questions
Date: Mon, 5 May 2008 08:36:15 -0700
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="iso-8859-1";
	reply-type=original
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Is this the right place to discuss CF low-level questions like Kernel 
drivers?

I wrote the Kernel to support CF drives in IDE mode several years ago but 
now there are strange things coming back from the field that compel me to go 
back and evaluate many design decisions. For instance, can you really ignore 
bit(2) (CORR) in the Status register offset 7 that tells you that the CF has 
detected and corrected a soft error?, etc.

Thanks,
Y. Sadgat
GCT 
