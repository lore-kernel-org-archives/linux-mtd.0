Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Muiko-0005D2-3o
	for linux-mtd@lists.infradead.org; Mon, 05 Oct 2009 08:17:14 +0000
Subject: Re: [PATCH/mtd-utils] add a "ubirsvol" tool to resize UBI volume.
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Arnaud Mouiche <arnaud.mouiche@thomson.net>
In-Reply-To: <1254389507-16507-1-git-send-email-arnaud.mouiche@thomson.net>
References: <1254389507-16507-1-git-send-email-arnaud.mouiche@thomson.net>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 05 Oct 2009 11:16:27 +0300
Message-Id: <1254730587.3359.7.camel@localhost>
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

On Thu, 2009-10-01 at 11:31 +0200, Arnaud Mouiche wrote:
> This is nearly a copy/paste from ubirmvol
> 
> Signed-off-by: Arnaud Mouiche <arnaud.mouiche@thomson.net>
> ---
>  ubi-utils/Makefile       |    2 +-
>  ubi-utils/src/ubirsvol.c |  245 ++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 246 insertions(+), 1 deletions(-)
>  create mode 100644 ubi-utils/src/ubirsvol.c

Pushed to the mtd-utils repository, thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
