Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NeVI6-0007jm-QH
	for linux-mtd@lists.infradead.org; Mon, 08 Feb 2010 15:12:51 +0000
Subject: Re: [PATCH] mtd: Change positive error return into negative in
	mtd_do_writeoob()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Roel Kluin <roel.kluin@gmail.com>
In-Reply-To: <4B62ABC8.7080607@gmail.com>
References: <4B62ABC8.7080607@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 08 Feb 2010 17:11:35 +0200
Message-ID: <1265641895.2006.75.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
	David Woodhouse <dwmw2@infradead.org>, LKML <linux-kernel@vger.kernel.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-01-29 at 10:35 +0100, Roel Kluin wrote:
> The error return should be negative
> 
> Signed-off-by: Roel Kluin <roel.kluin@gmail.com>
> ---
>  drivers/mtd/mtdchar.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Pushed to l2-mtd-2.6.git/master

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
