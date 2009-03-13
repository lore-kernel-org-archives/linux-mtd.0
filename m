Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Li9rH-0005JR-CG
	for linux-mtd@lists.infradead.org; Fri, 13 Mar 2009 16:03:48 +0000
Subject: old and new ubi utilities
From: Artem Bityutskiy <dedekind@infradead.org>
To: arnez@de.ibm.com, haver@vnet.ibm.com
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 13 Mar 2009 17:57:02 +0200
Message-Id: <1236959822.24755.14.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Thomas Gleixner <tglx@linutronix.de>,
	linux-mtd <linux-mtd@lists.infradead.org>, Sidney Amani <seed95@gmail.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Frank, Andreas,

long time ago for various reasons (many of which I do not remember) I
decided not to use the ubi utilities implemented by you, but to re-write
them and create new ubi utilities.

When I implemented the new ubi utilities, I moved the old ones to
	mtd-utils/ubi-utils/old-utils/
This caused criticism and I had to return the old utilities back, and
put my new utilities to
	mtd-utils/ubi-utils/new-utils.

It seems that nowadays the old ubi utilities are unused and
unmaintained. And I've got a question from Sidney if it would be
possible to change the MTD repository layout and move the new utilities
to
	mtd-utils/ubi-utils
and old utilities to
	mtd-utils/ubi-utils/old-utils
just like I have originally done.

So, will you mind if I do this, taking into account that the old
utilities are not widely used and not maintained?

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
