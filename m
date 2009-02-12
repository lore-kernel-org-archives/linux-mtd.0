Received: from el-out-1112.google.com ([209.85.162.178])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LXXFY-0007BC-FK
	for linux-mtd@lists.infradead.org; Thu, 12 Feb 2009 08:48:51 +0000
Received: by el-out-1112.google.com with SMTP id z25so533596ele.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 Feb 2009 00:48:47 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <4993E37E.7070702@nokia.com>
References: <4993E37E.7070702@nokia.com>
Date: Thu, 12 Feb 2009 03:48:47 -0500
Message-ID: <8bd0f97a0902120048u40eb8b91ta2d6352adc0a5a32@mail.gmail.com>
Subject: Re: [PATCH] mkfs.ubifs: eliminate compiler warnings
From: Mike Frysinger <vapier.adi@gmail.com>
To: Adrian Hunter <ext-adrian.hunter@nokia.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd Mailing List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Feb 12, 2009 at 03:53, Adrian Hunter wrote:
> --- a/mkfs.ubifs/mkfs.ubifs.c
> +++ b/mkfs.ubifs/mkfs.ubifs.c
> @@ -248,7 +248,8 @@ static int do_openat(int fd, const char *path, int flags)
>        ret = fchdir(fd);
>        if (ret != -1)
>                ret = open(path, flags);
> -       chdir(cwd);
> +       if (chdir(cwd) && !ret)
> +               ret = -1;
>        free(cwd);
>        return ret;
>  }

does gcc do the right thing and re-order this ?  or re-order it
yourself so the intent stays clear ...

>                case 'h':
>                case '?':
> -                       printf(helptext);
> +                       printf("%s", helptext);
>                        exit(0);

puts() would be less overhead ... just make sure helptext doesnt have
a trailing \n ...
-mike
