Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fGPXM-0008SN-7P
 for linux-mtd@lists.infradead.org; Wed, 09 May 2018 13:53:46 +0000
Date: Wed, 9 May 2018 15:53:19 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: IKEGAMI Tokunori <ikegami@allied-telesis.co.jp>
Cc: PACKHAM Chris <chris.packham@alliedtelesis.co.nz>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 "Boris Brezillon" <boris.brezillon@free-electrons.com>, Marek Vasut
 <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] mtd: cfi_cmdset_0002: Change write buffer to check
 correct value
Message-ID: <20180509155319.170784df@bbrezillon>
In-Reply-To: <TY1PR01MB09542BAFA49897752D5A5B30DC990@TY1PR01MB0954.jpnprd01.prod.outlook.com>
References: <20180508044142.4159-1-ikegami@allied-telesis.co.jp>
 <20180508044534.4226-1-smtpuser@allied-telesis.co.jp>
 <TY1PR01MB0954BFF431218DC5E2E8F3A2DC9A0@TY1PR01MB0954.jpnprd01.prod.outlook.com>
 <TY1PR01MB09542BAFA49897752D5A5B30DC990@TY1PR01MB0954.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Just a few more tips regarding the submission process:

- you can group several patches in a patch series when some are
  dependent on others. Just use 'git format-patch -<X>
  <last-commit>' where <X> is the number of patches you want to generate
  and <last-commit> is the last commit in the series. When you do that,
  it's generally a good practice to have a cover letter explaining what
  the patch series does. You can generate the cover letter with the
  --cover-letter option

- when you send a new version of a patch or a patch series it should be
  prefixed with "[PATCH vX ...]". This can be done by passing -v<X> (X
  being the version number) to git format-patch

- when you send the exact same version of a patch or patch series
  because the previous one has not been sent properly, you should
  prefix the patches with "[PATCH RESEND ...]". Again, can be done by
  passing --subject-prefix="PATCH RESEND" to git format-patch

- you should have a changelog describing what has changed between each
  version of the patch or patchset. The changelog can be placed in the
  cover-letter if you have one, or just after the "---" in the patch
  itself. You can also add extra information that you don't want to
  appear in the commit message just after this marker.

Regards,

Boris

On Wed, 9 May 2018 13:32:11 +0000
IKEGAMI Tokunori <ikegami@allied-telesis.co.jp> wrote:

> From: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
> 
> For the word write it is checked if the chip has the correct value.
> But it is not checked for the write buffer as only checked if ready.
> To make sure for the write buffer change to check the value.
> 
> It is enough as this patch is only checking the last written word.
> Since it is described by data sheets to check the operation status.
> 
> Signed-off-by: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
> Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Cc: Brian Norris <computersforpeace@gmail.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
> Cc: Marek Vasut <marek.vasut@gmail.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
> Cc: linux-mtd@lists.infradead.org
> ---
>  drivers/mtd/chips/cfi_cmdset_0002.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
> index 56aa6b75213d..5e9f2ca0a6c1 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> @@ -1879,7 +1879,7 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
>                 if (time_after(jiffies, timeo) && !chip_ready(map, adr))
>                         break;
> 
> -               if (chip_ready(map, adr)) {
> +               if (chip_ready(map, adr) && chip_good(map, adr, datum)) {
>                         xip_enable(map, chip, adr);
>                         goto op_done;
>                 }
> --
> 2.16.1
> 
