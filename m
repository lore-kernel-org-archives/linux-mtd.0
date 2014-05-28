Received: from szxga02-in.huawei.com ([119.145.14.65])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WpZSx-0002rC-NH
 for linux-mtd@lists.infradead.org; Wed, 28 May 2014 08:44:08 +0000
Message-ID: <5385A16A.4070807@huawei.com>
Date: Wed, 28 May 2014 16:42:18 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: [PATCH v2] ubifs: respect MS_SILENT mount flag
References: <1401193128.1304.132.camel@sauron.fi.intel.com>
 <20140527141030.GA3130@earthship.local>
 <1401202595.1304.165.camel@sauron.fi.intel.com>
 <5384B772.4030506@makrotopia.org> <538545B4.7070103@huawei.com>
 <1401264104.983.12.camel@sauron.fi.intel.com>
 <1401264446.983.17.camel@sauron.fi.intel.com>
 <1401264889.983.19.camel@sauron.fi.intel.com>
 <1401265736.2118.2.camel@sauron.fi.intel.com>
In-Reply-To: <1401265736.2118.2.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

> 
> Or even introduce a new version of the error macro, something like
> 'ubifs_errc(), and use that in the relevant places. Not sure what is
> going to look better, though. Here is a sketch:
> 
> 
> diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
> index e8c8cfe..60cffa7 100644
> --- a/fs/ubifs/ubifs.h
> +++ b/fs/ubifs/ubifs.h
> @@ -52,6 +52,14 @@
>         pr_warn("UBIFS warning (pid %d): %s: " fmt "\n",            \
>                 current->pid, __func__, ##__VA_ARGS__)
>  
> +/*
> + * A variant of 'ubifs_err()' which takes the UBIFS file-sytem description
> + * object as an argument.
> + */
> +#define ubifs_errc(c, fmt, ...)                                    \
> +       if (!(c)->probing)                                          \
> +               ubifs_err(fmt, ##__VA_ARGS__)
> +
>  /* UBIFS file system VFS magic number */
>  #define UBIFS_SUPER_MAGIC 0x24051905
> 

I have to say I was just writing to you about adding a new marco to instead.
Ha~

In this way we can disable unnecessary messages during mount if we use "slient"
flag. I have a simple question，Is this @probing safe during mount? Are there
some probably race conditions of it? I have no experiences of these.

I think you should find out which ubifs_err should be replace into your
"ubifs_errc" in the next step.

Thank you very much!


Hu
