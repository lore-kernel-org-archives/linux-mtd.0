Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LKUwg-0002Wi-2j
	for linux-mtd@lists.infradead.org; Wed, 07 Jan 2009 09:43:29 +0000
Subject: UBIFS 2.6.23 and older
From: Artem Bityutskiy <dedekind@infradead.org>
To: linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 07 Jan 2009 11:43:59 +0200
Message-Id: <1231321439.6608.74.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Philip Rakity <prakity@yahoo.com>, cphealy@gmail.com,
	Cal Page <pagcal@runbox.com>, Bruce_Leonard <Bruce_Leonard@selinc.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear UBIFS users,

I'm going to stop maintaining UBIFS back-ports for kernel versions
2.6.23, 2.6.22, and 2.6.21. It is just too much burden for me. However,
I will still maintain UBIFS back-ports for kernel versions 2.6.24,
2.6.25, 2.6.26, 2.6.27, and soon 2.6.28.

Does anyone wish to take maintenance of these trees? You will need to
port patches from the mainline linux-next branch of the ubifs-2.6.git
tree and ubi-2.6.git trees from time to time. If there are no
volunteers, I'll kill those trees at some point.

I CC people which might potentially be interested/affected.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
