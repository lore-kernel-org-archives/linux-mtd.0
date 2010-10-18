Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P7n34-0002bX-6H
	for linux-mtd@lists.infradead.org; Mon, 18 Oct 2010 10:34:35 +0000
Received: by fxm15 with SMTP id 15so469391fxm.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 18 Oct 2010 03:34:32 -0700 (PDT)
Subject: Re: [PATCH] nanddump: warn when the start address is not page aligned
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Baruch Siach <baruch@tkos.co.il>
In-Reply-To: <1909cbad57553279212f156a0c7cb20178981909.1287386497.git.baruch@tkos.co.il>
References: <1287256127.1781.32.camel@brekeke>
	<1909cbad57553279212f156a0c7cb20178981909.1287386497.git.baruch@tkos.co.il>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 18 Oct 2010 13:31:29 +0300
Message-ID: <1287397889.1972.46.camel@localhost>
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

On Mon, 2010-10-18 at 09:23 +0200, Baruch Siach wrote:
> nanddump should be consistent with nandwrite, which does not accept non page
> aligned start addresses. Thus, non page aligned dumps are useless.
> 
> To ease migration only warn for now. Add the plan of making this an error to
> feature-removal-schedule.txt.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  feature-removal-schedule.txt |   12 +++++++++++-
>  nanddump.c                   |    7 +++++++
>  2 files changed, 18 insertions(+), 1 deletions(-)
> 
> diff --git a/feature-removal-schedule.txt b/feature-removal-schedule.txt
> index 21bc8d4..f4ed2a3 100644
> --- a/feature-removal-schedule.txt
> +++ b/feature-removal-schedule.txt
> @@ -27,5 +27,15 @@ So the plan is (to be done by Artem Bityutskiy):
>  3.1 adding a warning to make users stop using them
>  3.2 removing both options.
>  ---------------------------
> -2.
> +2. nanddump: fail when the -s parameter is not page aligned
> +
> +nanddump should be consistent with nandwrite, and refuse accepting non page 
> +aligned start addresses. These dumps are most likely useless, since nandwrite 
> +won't write then at this location. Currently only a warning is issued to keep 
> +backward compatibility during a transition period. This should become an error 
> +after 1.5.0.

I tweaked this and removed 1.5.0 - it is better to not specify exact
version. Also, fixed the following trailing white-spaces issue for the
feature-removal-schedule.txt part:

Applying: nanddump: warn when the start address is not page aligned
/home/dedekind/git/mtd-utils/.git/rebase-apply/patch:17: trailing whitespace.
nanddump should be consistent with nandwrite, and refuse accepting non page 
/home/dedekind/git/mtd-utils/.git/rebase-apply/patch:18: trailing whitespace.
aligned start addresses. These dumps are most likely useless, since nandwrite 
/home/dedekind/git/mtd-utils/.git/rebase-apply/patch:19: trailing whitespace.
won't write then at this location. Currently only a warning is issued to keep 
/home/dedekind/git/mtd-utils/.git/rebase-apply/patch:20: trailing whitespace.
backward compatibility during a transition period. This should become an error 
warning: 4 lines add whitespace errors.

And pushed, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
