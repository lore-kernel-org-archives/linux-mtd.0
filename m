Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PM0iB-0007sP-Vl
	for linux-mtd@lists.infradead.org; Fri, 26 Nov 2010 15:59:49 +0000
Received: by bwz5 with SMTP id 5so2040729bwz.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 26 Nov 2010 07:59:46 -0800 (PST)
Subject: Re: [PATCH 07/14] drivers/mtd/maps: Use printf extension %pR for
	struct resource
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Joe Perches <joe@perches.com>
In-Reply-To: <5f4704a88f6e5bf55f19b4e6d8c7abce6ea20f71.1289597644.git.joe@perches.com>
References: <cover.1289597644.git.joe@perches.com>
	<5f4704a88f6e5bf55f19b4e6d8c7abce6ea20f71.1289597644.git.joe@perches.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 26 Nov 2010 17:59:14 +0200
Message-ID: <1290787154.2552.25.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Jim Cromie <jim.cromie@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
	Jiri Kosina <trivial@kernel.org>, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-11-12 at 13:37 -0800, Joe Perches wrote:
> Using %pR standardizes the struct resource output.
> 
> Signed-off-by: Joe Perches <joe@perches.com>
> ---
>  drivers/mtd/maps/amd76xrom.c       |    7 ++-----
>  drivers/mtd/maps/ck804xrom.c       |    7 ++-----
>  drivers/mtd/maps/esb2rom.c         |    9 +++------
>  drivers/mtd/maps/ichxrom.c         |    9 +++------
>  drivers/mtd/maps/physmap_of.c      |    4 +---
>  drivers/mtd/maps/scx200_docflash.c |    5 ++---
>  6 files changed, 13 insertions(+), 28 deletions(-)

Pushed this patch and patch N8 to l2-mtd-2.6.git, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
