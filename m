Received: from mail-wi0-f177.google.com ([209.85.212.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T4Rhh-0007XX-7n
 for linux-mtd@lists.infradead.org; Thu, 23 Aug 2012 07:19:46 +0000
Received: by wibhn17 with SMTP id hn17so367339wib.0
 for <linux-mtd@lists.infradead.org>; Thu, 23 Aug 2012 00:19:43 -0700 (PDT)
Date: Thu, 23 Aug 2012 10:19:35 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
Subject: Re: [PATCH] UBI : erase free PEB with bitflip in EC header
Message-ID: <20120823101935.29904a1b@pixies.home.jungo.com>
In-Reply-To: <1345644226-32555-1-git-send-email-matthieu.castet@parrot.com>
References: <1345644226-32555-1-git-send-email-matthieu.castet@parrot.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Matthieu,

On Wed, 22 Aug 2012 16:03:46 +0200 Matthieu CASTET <matthieu.castet@parrot.com> wrote:
> diff --git a/drivers/mtd/ubi/attach.c b/drivers/mtd/ubi/attach.c
> index bd27cbb..68d4d1f 100644
> --- a/drivers/mtd/ubi/attach.c
> +++ b/drivers/mtd/ubi/attach.c
> @@ -975,7 +975,7 @@ static int scan_peb(struct ubi_device *ubi, struct ubi_attach_info *ai,
>  			return err;
>  		goto adjust_mean_ec;
>  	case UBI_IO_FF:
> -		if (ec_err)
> +		if (ec_err || bitflips)

Thanks, it looks correct to me.

Note that:

-		if (ec_err)
+		if (bitflips)

will also do the job (since bitflips is also set when ec_err is set),
and maybe that was the intention, according to this comment:
		 * We have to also look at the VID header, possibly it is not
		 * corrupted. Set %bitflips flag in order to make this PEB be
		 * moved and EC be re-created.

Regards,
Shmulik
