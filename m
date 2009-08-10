Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MaPDe-0006cU-FA
	for linux-mtd@lists.infradead.org; Mon, 10 Aug 2009 07:23:02 +0000
Subject: Re: [patch 3/8] drivers/mtd/mtdcore.c: make symbols static
From: Artem Bityutskiy <dedekind1@gmail.com>
To: akpm@linux-foundation.org
In-Reply-To: <200908062305.n76N5XFO004949@imap1.linux-foundation.org>
References: <200908062305.n76N5XFO004949@imap1.linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 10 Aug 2009 10:20:31 +0300
Message-Id: <1249888831.19638.8.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: hsweeten@visionengravers.com, hartleys@visionengravers.com,
	dwmw2@infradead.org, linux-mtd@lists.infradead.org
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
> From: H Hartley Sweeten <hartleys@visionengravers.com>
> 
> Make mtd_group and mtd_groups static since they are only used in this
> file.
> 
> Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>

This one is in my l2-mtd-2.6.git now.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
