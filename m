Received: from mail-lf0-x22a.google.com ([2a00:1450:4010:c07::22a])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dz4ar-00058x-9D
 for linux-mtd@lists.infradead.org; Mon, 02 Oct 2017 17:33:27 +0000
Received: by mail-lf0-x22a.google.com with SMTP id q132so6873675lfe.5
 for <linux-mtd@lists.infradead.org>; Mon, 02 Oct 2017 10:33:04 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <7850553.GNXqutYARo@blindfold>
References: <CAAEsGz+1T6eAHW_adm-RKHoaK6gv=ZtRdcMTum6+s1TXR0PzEQ@mail.gmail.com>
 <CAFLxGvyT_meoP8rRc-gJi-Yk3VoxeJrF4L=gyo93iK9EAR=HFg@mail.gmail.com>
 <CAAEsGzKs1kM4TJVKrrsS_GjxQ3kMQa0zwmX2_z3qRpCdS-Xhag@mail.gmail.com>
 <7850553.GNXqutYARo@blindfold>
From: Doug Crawford <dcraw101@gmail.com>
Date: Mon, 2 Oct 2017 10:33:01 -0700
Message-ID: <CAAEsGzKDarv476=FW5dkKOt9-AD82miHdn1Ku59WAvdF-+qxzQ@mail.gmail.com>
Subject: Re: ubifs robustness with early power cut warning
To: Richard Weinberger <richard@sigma-star.at>
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

the freeze/thaw sounds like what I need.  I guess using the fsfreeze
tool from util-linux would work?  Is all of that implemented in the
VFS layer?  I see some recent patches for adding UBIFS specific
freeze/thaw functionality?

On Mon, Oct 2, 2017 at 9:45 AM, Richard Weinberger
<richard@sigma-star.at> wrote:
> Am Montag, 2. Oktober 2017, 18:14:28 CEST schrieb Doug Crawford:
>> I think my use case might be a little different. This 500 millisecond
>> early power down warning is intended to be recoverable if the power is
>> restored in that period.  The effect I am looking for is that any new
>> fsync or sync commands made during this 500 ms window will pause or
>> block, but if the power is restored then the sync will be successful.
>
> Hmm, if I understand your correctly, all you need is freeze/thaw support in
> UBIFS.
> Upon power-loss you freeze the filesystem and if power recovers you can thaw
> it.
>
> Does this information help? :-)
>
> Thanks,
> //richard
>
> --
> sigma star gmbh - Eduard-Bodem-Gasse 6 - 6020 Innsbruck - Austria
> ATU66964118 - FN 374287y
