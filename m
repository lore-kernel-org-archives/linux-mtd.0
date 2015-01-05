Received: from mail-vc0-x22e.google.com ([2607:f8b0:400c:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y852Y-0008C0-9d
 for linux-mtd@lists.infradead.org; Mon, 05 Jan 2015 10:37:39 +0000
Received: by mail-vc0-f174.google.com with SMTP id id10so8244563vcb.33
 for <linux-mtd@lists.infradead.org>; Mon, 05 Jan 2015 02:37:16 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAFLxGvwpyapTJKDrgtfy=qMW7u9hjXB9zRq+EkgE3zCummc7rw@mail.gmail.com>
References: <1416835236-25185-1-git-send-email-richard@nod.at>
 <CAFLxGvwpyapTJKDrgtfy=qMW7u9hjXB9zRq+EkgE3zCummc7rw@mail.gmail.com>
Date: Mon, 5 Jan 2015 11:37:16 +0100
Message-ID: <CAFLxGvyN=0JjGOEGvKgeJNFbg5L=-b971XSuMyuJVW-Tv34R2A@mail.gmail.com>
Subject: Re: Fastmap update v2 (pile 1)
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Richard Weinberger <richard@nod.at>
Content-Type: text/plain; charset=UTF-8
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Dec 10, 2014 at 9:21 AM, Richard Weinberger
<richard.weinberger@gmail.com> wrote:
> On Mon, Nov 24, 2014 at 2:20 PM, Richard Weinberger <richard@nod.at> wrote:
>> Artem,
>>
>> as requested I'm resending my fastmap work in smaller pieces.
>> This is pile 1 of 7.
>> Rebasing my patches to ubifs.git was a massive PITA because the
>> logging style changes touched a lot of code and almost every patch
>> failed to apply and needed inspection by hand.
>> The first patches are bug fixes, the latter introduce cleanups
>> and new features.
>> After all bugfixes are mainline I'll make sure that all needed
>> fixes go into -stable.
>
> Artem,
>
> how shall we proceed?
> Currently around 45 of my patches are in flight.
> Some got comments, some not. If it helps I can address these comments
> immediately
> and resend the individual patches. The vast majority of all comments
> are trivial to fix (typos, style, etc..)
> Initially I hoped that all patches will get comments such that I can
> do a v3 which can be merged
> in 3.19-rc1. :-\
>
> In my local queue even more patches wait to be submitted.

*ping*

Artem, I really want to proceed.

-- 
Thanks,
//richard
