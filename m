Received: from mail-io0-x229.google.com ([2607:f8b0:4001:c06::229])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d2Nj9-0005z4-V7
 for linux-mtd@lists.infradead.org; Sun, 23 Apr 2017 20:03:25 +0000
Received: by mail-io0-x229.google.com with SMTP id r16so158925206ioi.2
 for <linux-mtd@lists.infradead.org>; Sun, 23 Apr 2017 13:03:02 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAM===sQfUTUSBbby2goJDNj7MJShbtoFain-U0+AeKiH330BwQ@mail.gmail.com>
References: <CAM===sQfUTUSBbby2goJDNj7MJShbtoFain-U0+AeKiH330BwQ@mail.gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sun, 23 Apr 2017 22:03:01 +0200
Message-ID: <CAFLxGvwCU6eMv6ajkFM4ok1vMdc9p0c4gnR1cDio5tkmRe2JjA@mail.gmail.com>
Subject: Re: UBIFS support of NFS
To: Leon Pollak <leon.pollak@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Apr 23, 2017 at 3:44 PM, Leon Pollak <leon.pollak@gmail.com> wrote:
> Hello, all.
>
> The UBIFS FAQ states that UBIFS does not support NFS exporting and
> refers to the mail exchange from 2008 which discusses this.
>
> Is it (UBIFS does not support NFS export) true today, in 2017?

More or less. I've working on it:
https://lkml.org/lkml/2016/12/1/711

Hint: Testers are welcome.

Maybe it will be part of v4.13.

-- 
Thanks,
//richard
