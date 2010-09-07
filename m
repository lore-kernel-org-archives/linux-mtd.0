Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Ostzk-0007aL-Dc
	for linux-mtd@lists.infradead.org; Tue, 07 Sep 2010 08:57:37 +0000
Received: by fxm12 with SMTP id 12so3664708fxm.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 07 Sep 2010 01:57:35 -0700 (PDT)
Subject: Re: [PATCH v2] cmd line partitions: use 64 bit variables to detect
	partitions/offsets larger than 4G.
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Saeed Bishara <saeed@marvell.com>
In-Reply-To: <1283692114-1744-1-git-send-email-saeed@marvell.com>
References: <1283685790-8619-1-git-send-email-saeed@marvell.com>
	<1283692114-1744-1-git-send-email-saeed@marvell.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 07 Sep 2010 11:56:05 +0300
Message-ID: <1283849765.2979.22.camel@localhost>
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

On Sun, 2010-09-05 at 16:08 +0300, Saeed Bishara wrote:
> diff --git a/drivers/mtd/cmdlinepart.c b/drivers/mtd/cmdlinepart.c
> index 1479da6..80036d1 100644
> --- a/drivers/mtd/cmdlinepart.c
> +++ b/drivers/mtd/cmdlinepart.c
> @@ -41,8 +41,8 @@

Please, send with Signed-off-by.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
