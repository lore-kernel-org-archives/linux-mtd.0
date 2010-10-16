Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P7C7h-0001gB-ID
	for linux-mtd@lists.infradead.org; Sat, 16 Oct 2010 19:08:54 +0000
Received: by bwz7 with SMTP id 7so2558628bwz.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 16 Oct 2010 12:08:51 -0700 (PDT)
Subject: Re: [PATCH 1/2] nanddump: verify that start address is page aligned
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Baruch Siach <baruch@tkos.co.il>
In-Reply-To: <50168b5d486e28a9d7f7685537710e05242c4f12.1286871735.git.baruch@tkos.co.il>
References: <50168b5d486e28a9d7f7685537710e05242c4f12.1286871735.git.baruch@tkos.co.il>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 16 Oct 2010 22:08:47 +0300
Message-ID: <1287256127.1781.32.camel@brekeke>
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

On Tue, 2010-10-12 at 10:23 +0200, Baruch Siach wrote:
> Make nanddump consistent with nandwrite, which does not accept non page aligned
> start addresses. Thus, non page aligned dumps are useless.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  nanddump.c |    6 ++++++
>  1 files changed, 6 insertions(+), 0 deletions(-)
> 
> diff --git a/nanddump.c b/nanddump.c
> index 0fdf736..d6d1352 100644
> --- a/nanddump.c
> +++ b/nanddump.c
> @@ -377,6 +377,12 @@ int main(int argc, char * const argv[])
>  	}
>  
>  	/* Initialize start/end addresses and block size */
> +	if (start_addr & (meminfo.writesize - 1)) {
> +		fprintf(stderr, "The start address is not page-aligned !\n"
> +				"The pagesize of this NAND Flash is 0x%x.\n",
> +				meminfo.writesize);
> +		goto closeall;
> +	}

I'm fine with this change in general, but theoretically we may have a
user who relies on this. Could you please instead print a warning but
preserve the old behavior. Then in after the next release we can make
remove the warning and turn it into an error, just like this patch do.
This will potentially be user-friendly.

Add a new record to the feature-removal-schedule.txt file. I'll then
turn the warning into an error at some point.

Thanks!

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
