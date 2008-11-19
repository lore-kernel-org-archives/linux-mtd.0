Received: from ti-out-0910.google.com ([209.85.142.190])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L2mur-0005Xr-5H
	for linux-mtd@lists.infradead.org; Wed, 19 Nov 2008 13:16:21 +0000
Received: by ti-out-0910.google.com with SMTP id a21so2271159tia.2
	for <linux-mtd@lists.infradead.org>;
	Wed, 19 Nov 2008 05:16:18 -0800 (PST)
From: Qinghuang Feng <qhfeng.kernel@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 0/4] MTD: mark {__init|__exit} for {init|exit} functions
Date: Wed, 19 Nov 2008 21:16:09 +0800
Message-ID: <492411a1.04506e0a.02d2.0c20@mx.google.com>
Cc: Mike, linux-kernel@vger.kernel.org, David, linux-mtd@lists.infradead.org,
	Mike Lavender <mike@steroidmicros.com>, Rapoport <mike@compulab.co.il>,
	Hinds <dahinds@users.sourceforge.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

None of these (init|exit) functions is called from
other functions which is outside the kernel module
mechanism or kernel itself, so mark them as
{__init|__exit}.
