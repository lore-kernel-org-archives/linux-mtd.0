Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N8rgp-0002eS-JL
	for linux-mtd@lists.infradead.org; Fri, 13 Nov 2009 08:39:36 +0000
Subject: Re: [PATCH] jffs2: Fix error return in jffs2_do_read_inode_internal()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Roel Kluin <roel.kluin@gmail.com>
In-Reply-To: <4AFC415C.6040305@gmail.com>
References: <4AFC415C.6040305@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 13 Nov 2009 10:39:14 +0200
Message-Id: <1258101554.21596.1192.camel@localhost>
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

On Thu, 2009-11-12 at 18:09 +0100, Roel Kluin wrote:
> The returned error should stay negative
> 
> Signed-off-by: Roel Kluin <roel.kluin@gmail.com>
> ---
>  fs/jffs2/readinode.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Taken to my l2-mtd-2.6 tree, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
