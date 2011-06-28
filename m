Received: from mail-pw0-f49.google.com ([209.85.160.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QbSul-0002J8-Q9
	for linux-mtd@lists.infradead.org; Tue, 28 Jun 2011 07:40:56 +0000
Received: by pwi3 with SMTP id 3so3955275pwi.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 28 Jun 2011 00:40:53 -0700 (PDT)
Subject: Re: [PATCH 2/2] mtd/ofpart: add ofoldpart alias
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Date: Tue, 28 Jun 2011 10:41:41 +0300
In-Reply-To: <1309178086-10604-1-git-send-email-dbaryshkov@gmail.com>
References: <1309154611.23597.18.camel@sauron>
	<1309178086-10604-1-git-send-email-dbaryshkov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1309246907.23597.34.camel@sauron>
Mime-Version: 1.0
Cc: Randy Dunlap <randy.dunlap@oracle.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org,
	Grant Likely <grant.likely@secretlab.ca>,
	linux-next@vger.kernel.org, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-06-27 at 16:34 +0400, Dmitry Eremin-Solenikov wrote:
> ofpart.ko also provides ofoldpart MTD parser. Add respective
> MODULE_ALIAS("ofoldpart"); declaration.
> 
> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> ---
>  drivers/mtd/ofpart.c |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/mtd/ofpart.c b/drivers/mtd/ofpart.c
> index aa33b8a..77f0640 100644
> --- a/drivers/mtd/ofpart.c
> +++ b/drivers/mtd/ofpart.c
> @@ -176,3 +176,6 @@ module_init(ofpart_parser_init);
>  MODULE_LICENSE("GPL");
>  MODULE_DESCRIPTION("Parser for MTD partitioning information in device tree");
>  MODULE_AUTHOR("Vitaly Wool, David Gibson");
> +/* Required so that this module will be picked up ofoldpart
> + * MTD partition information parser */
> +MODULE_ALIAS("ofoldpart");

Well, the codyng style documents how multi-line comments should look
like... And this comment is less readable than your previous
explanation... But I've fixed this myself and pushed to my tree, thanks!

-- 
Best Regards,
Artem Bityutskiy
