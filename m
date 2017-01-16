Received: from mail-oi0-x229.google.com ([2607:f8b0:4003:c06::229])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cT26H-0008LT-4R
 for linux-mtd@lists.infradead.org; Mon, 16 Jan 2017 07:53:10 +0000
Received: by mail-oi0-x229.google.com with SMTP id w204so95729563oiw.0
 for <linux-mtd@lists.infradead.org>; Sun, 15 Jan 2017 23:52:48 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAMBC=j5fyW1BMAeDGzJp480fikZVVj2npk=WO5jmRTa+_ixEkw@mail.gmail.com>
References: <CAMBC=j5fyW1BMAeDGzJp480fikZVVj2npk=WO5jmRTa+_ixEkw@mail.gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Mon, 16 Jan 2017 08:52:47 +0100
Message-ID: <CAFLxGvzROo7Y0CNE3Qyi4jj-J526XYebgO_G8TLS9+oCJ+fBPQ@mail.gmail.com>
Subject: Re: UBIFS errors are randomly seen after reboots
To: chaitanya vinnakota <chaitanya.sai.v@gmail.com>
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

Chaitanya,

On Mon, Jan 16, 2017 at 6:28 AM, chaitanya vinnakota
<chaitanya.sai.v@gmail.com> wrote:
> Hi All,
>
> We are observing  UBIFS and ECC errors randomly even after safe
> reboots . We are using a 256M  spansion nand flash and the kernel
> version is 3.2.54. These errors disappear upon next reboots and appear
> again randomly.

Your log does not show ECC errors.

> [   10.428162] UBIFS error (pid 1): ubifs_check_node: bad CRC:
> calculated 0xa86e925a, read 0xd9a150bb

Hmm, a bad CRC without ECC error? Odd.

> Is the issue with UBIFS or with the nand driver ?

I'd check the driver first. Does it pass mtd and ubi tests?

-- 
Thanks,
//richard
