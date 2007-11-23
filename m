Received: from imo-m13.mx.aol.com ([64.12.136.172] helo=imo-m13.mail.aol.com)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1IvadE-0005U3-AT
	for linux-mtd@lists.infradead.org; Fri, 23 Nov 2007 10:39:59 -0500
Received: from payagond@aol.com
	by imo-m13.mx.aol.com (mail_out_v38_r9.3.) id 3.cf5.18591857 (48338)
	for <linux-mtd@lists.infradead.org>;
	Fri, 23 Nov 2007 10:39:34 -0500 (EST)
To: linux-mtd@lists.infradead.org
Content-Transfer-Encoding: 7bit
Subject: MLC Support in JFFS2
Date: Fri, 23 Nov 2007 10:39:34 -0500
MIME-Version: 1.0
From: payagond@aol.com
Content-Type: text/plain; charset="us-ascii"; format=flowed
Message-Id: <8C9FBFE2E96BED9-F28-7AAE@webmail-dd08.sysops.aol.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



Hello,



Which is the better way for MLC support in JFFS2?

Is it removing the CLEANMARKER or

reserving the first page of every block for it



If I am using the 2nd option ie., reserving a page in every block -

What else I have to take care of, other than jeb->freesize and 
jeb->used_size?



regards

payagond


________________________________________________________________________
Email and AIM finally together. You've gotta check out free AOL Mail! - 
http://mail.aol.com
