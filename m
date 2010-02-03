Received: from mail.windriver.com ([147.11.1.11])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NcVK2-00023w-J5
	for linux-mtd@lists.infradead.org; Wed, 03 Feb 2010 02:50:34 +0000
Received: from ALA-MAIL03.corp.ad.wrs.com (ala-mail03 [147.11.57.144])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id o132oR5r016357
	for <linux-mtd@lists.infradead.org>;
	Tue, 2 Feb 2010 18:50:27 -0800 (PST)
From: "Stanley.Miao" <stanley.miao@windriver.com>
To: linux-mtd@lists.infradead.org
Subject: 
Date: Wed,  3 Feb 2010 10:56:31 +0800
Message-Id: <1265165796-24686-1-git-send-email-stanley.miao@windriver.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


During some BSP development process, I found some tools in mtd-utils
contain legacy interfaces and it is not suitable with the current linux
kernel. I post my patches here in case somebody else need them.
