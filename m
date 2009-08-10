Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MaPGx-0007cO-5w
	for linux-mtd@lists.infradead.org; Mon, 10 Aug 2009 07:26:27 +0000
Subject: Re: [patch 1/8] jffs2: move jffs2_gcd_mtd threads to the new
	kthread API
From: Artem Bityutskiy <dedekind1@gmail.com>
To: akpm@linux-foundation.org
In-Reply-To: <200908062305.n76N5V2Y004841@imap1.linux-foundation.org>
References: <200908062305.n76N5V2Y004841@imap1.linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 10 Aug 2009 10:24:01 +0300
Message-Id: <1249889041.19638.10.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: gerard.lledo@gmail.com, dwmw2@infradead.org, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-08-06 at 16:05 -0700, akpm@linux-foundation.org wrote:
> From: Gerard Lledo <gerard.lledo@gmail.com>
> 
> Move the jffs2 garbage collecting thread to the new kthread API.
> 
> Signed-off-by: Gerard Lledo <gerard.lledo@gmail.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>

This one is in my l2-mtd-2.6.git now.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
