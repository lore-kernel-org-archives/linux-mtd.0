Received: from mail.windriver.com ([147.11.1.11])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NcX1l-0005wc-H6
	for linux-mtd@lists.infradead.org; Wed, 03 Feb 2010 04:39:49 +0000
Received: from ALA-MAIL03.corp.ad.wrs.com (ala-mail03 [147.11.57.144])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id o134diGl029315
	for <linux-mtd@lists.infradead.org>;
	Tue, 2 Feb 2010 20:39:44 -0800 (PST)
From: "Stanley.Miao" <stanley.miao@windriver.com>
To: linux-mtd@lists.infradead.org
Subject: Fix mtd-utils bugs
Date: Wed,  3 Feb 2010 12:45:49 +0800
Message-Id: <1265172354-26682-1-git-send-email-stanley.miao@windriver.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

(Re-send it because the previous one don't have a subject.)

During some BSP development process, I found some tools in mtd-utils
contain legacy interfaces and it is not suitable with the current linux
kernel. I post my patches here in case somebody else need them.
