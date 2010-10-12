Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P5bjN-00015R-79
	for linux-mtd@lists.infradead.org; Tue, 12 Oct 2010 10:05:13 +0000
Received: by ewy7 with SMTP id 7so808756ewy.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 12 Oct 2010 03:05:11 -0700 (PDT)
Subject: Re: [PATCH] nanddump: fix initialization of bad blocks oob data buffer
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Baruch Siach <baruch@tkos.co.il>
In-Reply-To: <0870ac8ab250ec91dceb2cc461fe82c0d7995bc8.1286788714.git.baruch@tkos.co.il>
References: <0870ac8ab250ec91dceb2cc461fe82c0d7995bc8.1286788714.git.baruch@tkos.co.il>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 12 Oct 2010 13:02:22 +0300
Message-ID: <1286877742.2164.40.camel@localhost>
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

On Mon, 2010-10-11 at 11:19 +0200, Baruch Siach wrote:
> When dumping oob data of a bad block, initialize oobbuf with 0xff, instead of
> readbuf.  This avoids bogus oob data on output.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  nanddump.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/nanddump.c b/nanddump.c
> index 3589931..0fdf736 100644
> --- a/nanddump.c
> +++ b/nanddump.c
> @@ -452,7 +452,7 @@ int main(int argc, char * const argv[])
>  			continue;
>  
>  		if (badblock) {
> -			memset (readbuf, 0xff, meminfo.oobsize);
> +			memset (oobbuf, 0xff, meminfo.oobsize);
Removed junk white-space
>  		} else {
>  			/* Read OOB data and exit on failure */
>  			oob.start = ofs;

and push to mtd-utils.git, thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
