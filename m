Received: from mail-oi0-x230.google.com ([2607:f8b0:4003:c06::230])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d0CwC-0007hP-8K
 for linux-mtd@lists.infradead.org; Mon, 17 Apr 2017 20:07:54 +0000
Received: by mail-oi0-x230.google.com with SMTP id x184so66217869oia.1
 for <linux-mtd@lists.infradead.org>; Mon, 17 Apr 2017 13:07:31 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAAN9NvfwjBaHWBo=5P=s9+ivPy_r-peSEdHK7UwJaOz4-8R9Pw@mail.gmail.com>
References: <CAAN9NvfwjBaHWBo=5P=s9+ivPy_r-peSEdHK7UwJaOz4-8R9Pw@mail.gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Mon, 17 Apr 2017 22:07:30 +0200
Message-ID: <CAFLxGvyYKeNTgRdeBn5qsthw0LSMpxgjjM0SssX4cwCOqV11Yw@mail.gmail.com>
Subject: Re: UBIFS replay journal failure on power cuts
To: Raphael Pereira <raphaelpereira@gmail.com>
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

On Mon, Apr 17, 2017 at 1:29 AM, Raphael Pereira
<raphaelpereira@gmail.com> wrote:
> Hello,
>
> I have been using UBIFS on a device and have been getting some
> unrecoverable errors on journal replay after some power cuts.
>
> I have not stablished the specific way to reproduce the problem, but
> it is happening with some repeatability.
>
> The error seems quite like both threads:
>
> http://lists.infradead.org/pipermail/linux-mtd/2014-July/054620.html
> http://lists.infradead.org/pipermail/linux-mtd/2016-June/068339.html
>
> And before you ask, I do indeed use fastmap.

Did you backport all fastmap related fixes/improvements?
The kernel you are using is very old.

-- 
Thanks,
//richard
