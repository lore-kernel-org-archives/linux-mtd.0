Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1ObWkM-0005L2-VB
	for linux-mtd@lists.infradead.org; Wed, 21 Jul 2010 10:41:55 +0000
Subject: Re: [patch 2/4] drivers/mtd/tests/mtd_pagetest.c: return -1 if
	verify failed
From: Artem Bityutskiy <dedekind1@gmail.com>
To: akpm@linux-foundation.org
In-Reply-To: <201007202224.o6KMO0ck021384@imap1.linux-foundation.org>
References: <201007202224.o6KMO0ck021384@imap1.linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 21 Jul 2010 13:35:07 +0300
Message-ID: <1279708507.2306.7.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: roel.kluin@gmail.com, dwmw2@infradead.org, linux-mtd@lists.infradead.org,
	cbou@mail.ru
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-07-20 at 15:24 -0700, akpm@linux-foundation.org wrote:
> From: Roel Kluin <roel.kluin@gmail.com>
> 
> It should return -1 if the verify failed.
> 
> Signed-off-by: Roel Kluin <roel.kluin@gmail.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Anton Vorontsov <cbou@mail.ru>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>

This patch, but in an improved form, is also in my l2-mtd-2.6.git /
master tree.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
