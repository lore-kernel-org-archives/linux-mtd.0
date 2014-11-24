Received: from mail-wi0-x235.google.com ([2a00:1450:400c:c05::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xsqja-0004uG-Ve
 for linux-mtd@lists.infradead.org; Mon, 24 Nov 2014 10:19:07 +0000
Received: by mail-wi0-f181.google.com with SMTP id r20so5213720wiv.2
 for <linux-mtd@lists.infradead.org>; Mon, 24 Nov 2014 02:18:44 -0800 (PST)
Message-ID: <54730602.7040207@gmail.com>
Date: Mon, 24 Nov 2014 11:18:42 +0100
From: Angelo Dureghello <angelo70@gmail.com>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: UBI 1MiB size partition
References: <5472F403.50702@gmail.com>
 <CAFLxGvzqmPwEgyD3kcEhmeGp_+kYKiKqvGMQW=+1PxzJ5+YwmA@mail.gmail.com>
In-Reply-To: <CAFLxGvzqmPwEgyD3kcEhmeGp_+kYKiKqvGMQW=+1PxzJ5+YwmA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Richard Weinberger <richard.weinberger@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard,
>
> The number depends on CONFIG_MTD_UBI_BEB_LIMIT.
> What is your use case for UBI on such a small MTD partition?

My company uses UBI as rootfs, and jffs2 for a small partition to keep
some system configurations.I would like to use UBI here as well.

CONFIG_MTD_UBI_BEB_LIMIT is system wide i guess. So changing it, it
impacts also the main rootfs.ubi, right ?

>
Thanks,
angelo
