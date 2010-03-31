Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NwyTh-0005b5-2q
	for linux-mtd@lists.infradead.org; Wed, 31 Mar 2010 14:01:06 +0000
Subject: Re: [PATCH] [MTD] nandtest.c: fix --keep argument
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Radoslav Kolev <radoslav.kolev@rnd.bg>
In-Reply-To: <1267106290.8549.91.camel@rado-desktop>
References: <1267106290.8549.91.camel@rado-desktop>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 31 Mar 2010 16:58:28 +0300
Message-ID: <1270043908.15073.32.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-02-25 at 15:58 +0200, Radoslav Kolev wrote:
> [PATCH] [MTD] nandtest.c: fix --keep argument
> 
> When called with the --keep argument nandtest is supposed to restore the
> original content after testing, but currently it doesn't. The patch
> below fixes the problem.
> 
> Signed-off-by: Radoslav Kolev <radoslav.kolev@rnd.bg>

Pushed to mtd-utils.git, thank you!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
