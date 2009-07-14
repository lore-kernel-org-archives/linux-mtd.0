Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MQanc-0000UE-Ul
	for linux-mtd@lists.infradead.org; Tue, 14 Jul 2009 05:43:39 +0000
Subject: Re: [PATCH] UBI: fix bug in image sequence number handling
From: Artem Bityutskiy <dedekind@infradead.org>
To: Holger Brunck <holger.brunck@keymile.com>
In-Reply-To: <1247496477.3590.40.camel@pc005093.de.keymile.net>
References: <1247496477.3590.40.camel@pc005093.de.keymile.net>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 14 Jul 2009 08:43:20 +0300
Message-Id: <1247550200.8109.9.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2009-07-13 at 16:47 +0200, Holger Brunck wrote:
> Hi all, 
> I have seen a bug on the current 2.6.28 backport for UBI. But the same
> bug seems to be present in the current ubi-2.6.git.
> 
>  
> This patch fixes a bug in the image seq. number handling in the
> scanning level. The assignment of the image_seq was incorrect.
> 
> Signed-off-by: Holger Brunck <holger.brunck@keymile.com>
> ---
>  drivers/mtd/ubi/scan.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/mtd/ubi/scan.c b/drivers/mtd/ubi/scan.c
> index 065c4ba..e337b0b 100644
> --- a/drivers/mtd/ubi/scan.c
> +++ b/drivers/mtd/ubi/scan.c
> @@ -781,7 +781,7 @@ static int process_eb(struct ubi_device *ubi, struct
> ubi_scan_info *si,
>  			return -EINVAL;
>  		}
>  
> -		image_seq = be32_to_cpu(ech->ec);
> +		image_seq = be32_to_cpu(ech->image_seq);
>  		if (!si->image_seq_set) {
>  			ubi->image_seq = image_seq;
>  			si->image_seq_set = 1;

Yes, this is me who did this in the
"UBI: nicify image sequence number handling" commit. Sorry, really
shame bug. Where is my brown paper-bag? I've pushed your patch to
all trees.

BTW, the patch was line-wrapped.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
