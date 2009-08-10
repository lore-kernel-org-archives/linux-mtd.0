Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MaP6V-0001Dv-9S
	for linux-mtd@lists.infradead.org; Mon, 10 Aug 2009 07:15:39 +0000
Subject: Re: [patch 7/8] mtd: fix read buffer overflow
From: Artem Bityutskiy <dedekind1@gmail.com>
To: akpm@linux-foundation.org
In-Reply-To: <200908062305.n76N5bPB004977@imap1.linux-foundation.org>
References: <200908062305.n76N5bPB004977@imap1.linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 10 Aug 2009 10:13:02 +0300
Message-Id: <1249888382.19638.4.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: roel.kluin@gmail.com, dwmw2@infradead.org, linux-mtd@lists.infradead.org
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
> From: Roel Kluin <roel.kluin@gmail.com>
> 
> Check whether index is within bounds before testing the element.
> 
> with `for (i = 0; bbt[i] && i < ebcnt; ++i)'
> we test bbt[ebcnt] in the last iteration
> 
> with `for (i = 0; bbt[ebcnt - i - 1] && i < ebcnt; ++i)'
> we test bbt[-1] in the last iteration
> 
> Signed-off-by: Roel Kluin <roel.kluin@gmail.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>

This one is in my l2-mtd-2.6.git as well now.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
