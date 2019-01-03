Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gf9Yh-0006DQ-JQ
 for linux-mtd@lists.infradead.org; Thu, 03 Jan 2019 20:25:41 +0000
Received: by mail-wm1-x331.google.com with SMTP id f81so31350774wmd.4
 for <linux-mtd@lists.infradead.org>; Thu, 03 Jan 2019 12:25:38 -0800 (PST)
MIME-Version: 1.0
References: <CANNa7-XH1Qm8A5fzUM29pDsmLke4SP-+=PoJtumai8jv1nqFBg@mail.gmail.com>
In-Reply-To: <CANNa7-XH1Qm8A5fzUM29pDsmLke4SP-+=PoJtumai8jv1nqFBg@mail.gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Thu, 3 Jan 2019 21:25:25 +0100
Message-ID: <CAFLxGvw2QXVJ29mwJt-1WMkpXBrq4fAgzJPS2BQi+ErPZFL1Lg@mail.gmail.com>
Subject: Re: Having trouble with a UBI filesystem
To: Ron Bowes <ron@skullsecurity.net>
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jan 3, 2019 at 8:52 PM Ron Bowes <ron@skullsecurity.net> wrote:
> folks) and ubi-reader (from https://github.com/jrspruitt/ubi_reader).

Last time I looked at ubi_reader I was not satisfied at all.
So I'd not recommend it. But this was over a year ago.

> Can anybody help me understand what I'm looking at? And how I can
> either mount or extract this?

Find the correct flash parameters and load the image into mtdram
or nandsim to mount it.

-- 
Thanks,
//richard
