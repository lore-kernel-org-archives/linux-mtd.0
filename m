Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bRmin-00009A-0m
 for linux-mtd@lists.infradead.org; Mon, 25 Jul 2016 20:43:30 +0000
Subject: Re: [PATCH] ubifs: update comment for ubifs_errc
To: Daniel Golle <daniel@makrotopia.org>, linux-mtd@lists.infradead.org
References: <578E1D02.3000109@nod.at> <20160725114446.GA8083@makrotopia.org>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <579679D8.2050103@nod.at>
Date: Mon, 25 Jul 2016 22:43:04 +0200
MIME-Version: 1.0
In-Reply-To: <20160725114446.GA8083@makrotopia.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Daniel,

Am 25.07.2016 um 13:44 schrieb Daniel Golle:
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  fs/ubifs/ubifs.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
> index ddf9f6b9..4617d45 100644
> --- a/fs/ubifs/ubifs.h
> +++ b/fs/ubifs/ubifs.h
> @@ -1783,8 +1783,8 @@ void ubifs_err(const struct ubifs_info *c, const char *fmt, ...);
>  __printf(2, 3)
>  void ubifs_warn(const struct ubifs_info *c, const char *fmt, ...);
>  /*
> - * A variant of 'ubifs_err()' which takes the UBIFS file-sytem description
> - * object as an argument.
> + * A conditional variant of 'ubifs_err()' which doesn't output anything
> + * if probing (ie. MS_SILENT set).

Looks good. :-)

Thanks for improving this,
//richard
