Received: from mail-yw0-x242.google.com ([2607:f8b0:4002:c05::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c6K3k-00014V-KT
 for linux-mtd@lists.infradead.org; Mon, 14 Nov 2016 16:24:42 +0000
Received: by mail-yw0-x242.google.com with SMTP id s68so7491612ywg.0
 for <linux-mtd@lists.infradead.org>; Mon, 14 Nov 2016 08:24:19 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20161016182441.49adc653@bbrezillon>
References: <cover.1474450295.git.dwalter@sigma-star.at>
 <20161016182441.49adc653@bbrezillon>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Mon, 14 Nov 2016 17:24:18 +0100
Message-ID: <CAFLxGvyDfJ9HRcMhOxYyjAZUgsQrKcYW5c8EjYUX9j+CDkQJ=A@mail.gmail.com>
Subject: Re: [PATCH v2 00/46] Nandsim facelift (part I of II)
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Daniel Walter <dwalter@sigma-star.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Boris,

sorry for the late answer. I was not on CC, therefore this mail was
unnoticed by me. :-(

On Sun, Oct 16, 2016 at 6:24 PM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> Daniel, Richard,
>
> On Wed, 21 Sep 2016 11:43:29 +0200
> Daniel Walter <dwalter@sigma-star.at> wrote:
>
>> Changes since V1:
>>   Incooperate feedback for nand_cleanup()
>>   Improve commit messages

[..-]

> I really like the new approach for 2 reasons:
> 1/ it allows creating several NAND devs, and you can do that after the
>    module has been loaded.
> 2/ it fixes the partial NAND detection support by allowing one to
>    describe its NAND in term of page size, eraseblock size, oob
>    size, ...
>
> But I'm wondering if we should not create a new driver instead of
> trying to fix the old one (I must admit I haven't been through the 46
> patches of this series, but last time we discussed it on IRC, Richard
> said it actually was a complete rewrite of the nandsim driver).
>
> Moreover, if we specify the flash layout manually, maybe we could make
> it an mtdsim driver instead of restricting the emulation to NAND
> devices.
>
> What do you think?

I think we don't need a completely new driver. This series just adds
functionality to nandsim without much cost, in fact we reuse also some
bits from nandsim.
If we add a new nandsim alike driver we basically give up the current nandsim
and it will die a painful death. This series tries to avoid that.
What we can do is splitting nandsim into three files (common, old and new).

P.s: Yes, I'm aware of the fact that then I'll have to maintain the beast. ;-\

-- 
Thanks,
//richard
