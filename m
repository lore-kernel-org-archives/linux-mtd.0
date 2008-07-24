Received: from mx04.mailboxcop.com ([206.125.223.74])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KLpQX-0007Ut-01
	for linux-mtd@lists.infradead.org; Thu, 24 Jul 2008 01:15:29 +0000
Received: from secure3.apollohosting.com (secure3.apollohosting.com
	[206.125.215.253])
	by mx04.mailboxcop.com (8.13.8/8.13.8) with ESMTP id m6O1FRre021786
	for <linux-mtd@lists.infradead.org>; Wed, 23 Jul 2008 20:15:27 -0500
Message-ID: <20080723201527.c93gjrlujjjswwc0@webmail.mistralsolutions.com>
Date: Wed, 23 Jul 2008 20:15:27 -0500
From: suresh@mistralsolutions.com
To: linux-mtd@lists.infradead.org
Subject: JFFS2 GC Bug?
MIME-Version: 1.0
Content-Type: text/plain;
	charset=ISO-8859-1;
	DelSp="Yes";
	format="flowed"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Can files go missing if there is a powerfail when the garbage  
collection is running (and doing updation to the file system) on a  
JFFS2 filesystem.

Was this a bug in older kernels?

Thanks in advance,
Suresh
