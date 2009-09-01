Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MiPLP-0003te-1D
	for linux-mtd@lists.infradead.org; Tue, 01 Sep 2009 09:08:07 +0000
Subject: Re: [PATCH] inappropriate pending block in foldchain
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mohanlal Jangir <mohanlaljangir@gmail.com>
In-Reply-To: <58484c0e0908290317m62485b2bu6ca69db7de8111a5@mail.gmail.com>
References: <58484c0e0908290317m62485b2bu6ca69db7de8111a5@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 01 Sep 2009 12:07:16 +0300
Message-Id: <1251796036.3514.29.camel@localhost>
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

On Sat, 2009-08-29 at 19:17 +0900, Mohanlal Jangir wrote:
> In function  INFTL_findwriteunit, inappropriate pending block
> parameter is passed which prevents 0xFFFF block copy during foldchain.
> This patch fixes the problem.
> 
> -Mohan
> 
> diff -Nur a/linux-2.6.30.5/drivers/mtd/inftlcore.c
> b/linux-2.6.30.5/drivers/mtd/inftlcore.c
> --- a/linux-2.6.30.5/drivers/mtd/inftlcore.c 2009-08-17 06:19:38.000000000 +0900
> +++ b/linux-2.6.30.5/drivers/mtd/inftlcore.c 2009-08-29 19:04:21.953125000 +0900
> @@ -549,7 +549,7 @@
>      * waiting to be picked up. We're going to have to fold
>      * a chain to make room.
>      */
> -   thisEUN = INFTL_makefreeblock(inftl, 0xffff);
> +   thisEUN = INFTL_makefreeblock(inftl, block);

I cannot apply your patch. Please, send the patch to yourself first,
make sure you can save it and apply using 'git am', and when it works,
send it to the mailing list.

Hint: we use "git format-patch" to create patches.

Thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
