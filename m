Received: from mail-yi0-f49.google.com ([209.85.218.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qays0-0008Ex-Su
	for linux-mtd@lists.infradead.org; Sun, 26 Jun 2011 23:36:05 +0000
Received: by yib17 with SMTP id 17so2028874yib.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 26 Jun 2011 16:35:58 -0700 (PDT)
MIME-Version: 1.0
Sender: glikely@secretlab.ca
In-Reply-To: <1309122180-12838-3-git-send-email-dbaryshkov@gmail.com>
References: <1309122180-12838-1-git-send-email-dbaryshkov@gmail.com>
	<1309122180-12838-3-git-send-email-dbaryshkov@gmail.com>
From: Grant Likely <grant.likely@secretlab.ca>
Date: Sun, 26 Jun 2011 17:35:35 -0600
Message-ID: <BANLkTi=G30BB66a6cbTWbmfd0Zokm2Kz3A@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd/ofpart: add ofoldpart alias
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Randy Dunlap <randy.dunlap@oracle.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>, dedekind1@gmail.com,
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
	linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Jun 26, 2011 at 3:03 PM, Dmitry Eremin-Solenikov
<dbaryshkov@gmail.com> wrote:
> ofpart.ko also provides ofoldpart MTD parser. Add respective
> MODULE_ALIAS("ofoldpart"); declaration.
>
> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>

Is MODULE_ALIAS actually necessary for what is essentially a library
module?  I though MODULE_ALIAS was only needed to trigger loading a
module for specific hardware.  In this case, the module should be
autoloaded when another module needs it.  I may be misinformed though,
my module-foo is a little rusty.

g.

> ---
> =A0drivers/mtd/ofpart.c | =A0 =A01 +
> =A01 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/mtd/ofpart.c b/drivers/mtd/ofpart.c
> index aa33b8a..c4b8d17 100644
> --- a/drivers/mtd/ofpart.c
> +++ b/drivers/mtd/ofpart.c
> @@ -176,3 +176,4 @@ module_init(ofpart_parser_init);
> =A0MODULE_LICENSE("GPL");
> =A0MODULE_DESCRIPTION("Parser for MTD partitioning information in device =
tree");
> =A0MODULE_AUTHOR("Vitaly Wool, David Gibson");
> +MODULE_ALIAS("ofoldpart");
> --
> 1.7.5.4
>
>



--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
