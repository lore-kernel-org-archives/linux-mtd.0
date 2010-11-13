Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PHE8w-0003AV-VP
	for linux-mtd@lists.infradead.org; Sat, 13 Nov 2010 11:19:43 +0000
Received: by bwz5 with SMTP id 5so3954601bwz.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 13 Nov 2010 03:19:37 -0800 (PST)
Subject: Re: [PATCH 16/49] drivers/mtd: Use vzalloc
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Joe Perches <joe@perches.com>
In-Reply-To: <61af073f284d2169834120889a641cd11c370643.1288925424.git.joe@perches.com>
References: <alpine.DEB.2.00.1011031108260.11625@router.home>
	<61af073f284d2169834120889a641cd11c370643.1288925424.git.joe@perches.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 13 Nov 2010 13:19:25 +0200
Message-ID: <1289647165.2218.29.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, Jiri Kosina <trivial@kernel.org>,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-11-04 at 20:07 -0700, Joe Perches wrote:
> Signed-off-by: Joe Perches <joe@perches.com>
> ---
>  drivers/mtd/nand/nandsim.c |    3 +--
>  drivers/mtd/ubi/vtbl.c     |    6 ++----
>  2 files changed, 3 insertions(+), 6 deletions(-)

Pushed to l2-mtd-2.6.git, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
