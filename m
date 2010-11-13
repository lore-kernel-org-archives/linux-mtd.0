Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PHE94-0003AV-Mh
	for linux-mtd@lists.infradead.org; Sat, 13 Nov 2010 11:19:50 +0000
Received: by mail-bw0-f49.google.com with SMTP id 5so3954601bwz.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 13 Nov 2010 03:19:46 -0800 (PST)
Subject: Re: [PATCH 38/49] fs/jffs2: Use vzalloc
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Joe Perches <joe@perches.com>
In-Reply-To: <1c6caf522ea9088919a89c8c23c54436c7020cdb.1288925425.git.joe@perches.com>
References: <alpine.DEB.2.00.1011031108260.11625@router.home>
	<1c6caf522ea9088919a89c8c23c54436c7020cdb.1288925425.git.joe@perches.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 13 Nov 2010 13:19:34 +0200
Message-ID: <1289647174.2218.30.camel@localhost>
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

On Thu, 2010-11-04 at 20:08 -0700, Joe Perches wrote:
> Signed-off-by: Joe Perches <joe@perches.com>
> ---
>  fs/jffs2/build.c |    5 ++---
>  1 files changed, 2 insertions(+), 3 deletions(-)

Pushed to l2-mtd-2.6.git, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
