Received: from mail-vc0-x231.google.com ([2607:f8b0:400c:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xanwq-0004OR-7F
 for linux-mtd@lists.infradead.org; Sun, 05 Oct 2014 15:42:12 +0000
Received: by mail-vc0-f177.google.com with SMTP id hq11so2269657vcb.36
 for <linux-mtd@lists.infradead.org>; Sun, 05 Oct 2014 08:41:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <e8d296e4-0194-4e0f-8f4d-1defe17bdd65@email.android.com>
References: <e8d296e4-0194-4e0f-8f4d-1defe17bdd65@email.android.com>
Date: Sun, 5 Oct 2014 17:41:50 +0200
Message-ID: <CAFLxGvxm7RU-_5r658pA2C5EJ6NGGX2sfErNB9Hosq98QP8G2A@mail.gmail.com>
Subject: Re: Block numbers of BEB
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Woody Wu <narkewoody@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Oct 5, 2014 at 8:04 AM, Woody Wu <narkewoody@gmail.com> wrote:
> Hi,
>
> I can see how many bad erase blocks it had developed from the /proc directory, but where can I get know what block numbers these bad blocks on?
>
> Any hint from you will be appreciated.

In case you're using UBI please see /sys/class/ubi/ubi0/

-- 
Thanks,
//richard
