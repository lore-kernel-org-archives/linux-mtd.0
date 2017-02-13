Received: from mail-ot0-x22b.google.com ([2607:f8b0:4003:c0f::22b])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cdOU7-0007iq-Gw
 for linux-mtd@lists.infradead.org; Mon, 13 Feb 2017 21:48:38 +0000
Received: by mail-ot0-x22b.google.com with SMTP id 32so79389083oth.3
 for <linux-mtd@lists.infradead.org>; Mon, 13 Feb 2017 13:48:15 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <c282afc8-0c2d-7ca1-8359-341b674ee1ac@sigma-star.at>
References: <CAPYQ8X4Fy1JvjJMbQWCDgQdj2pBOAXZnr5rmZJegSCZyJYNMfQ@mail.gmail.com>
 <c282afc8-0c2d-7ca1-8359-341b674ee1ac@sigma-star.at>
From: Michael Hu <pxmyhdev@gmail.com>
Date: Mon, 13 Feb 2017 16:48:13 -0500
Message-ID: <CAPYQ8X5yjvWoPC+Vzy9QyLHsWcptkHjODHGvHSJj8MvX6njyhw@mail.gmail.com>
Subject: Re: trouble downloading mtd-utils git repo
To: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi David,

Thanks for your feedback!

Is it possible my IP got flagged and blocked from downloading? We
might "abused" it a little bit. Basically we are using Yocto project
(poky) to build a Linux project and we have a nightly build which
re-builds every components from scratch. The nightly access might
register us as offenders?

If that's the case, I'll try to download once from another IP and host
the content in our own server.

Thanks!

On Mon, Feb 13, 2017 at 4:35 PM, David Oberhollenzer
<david.oberhollenzer@sigma-star.at> wrote:
> On 02/13/2017 10:06 PM, Michael Hu wrote:
>> This is a dumb question but I was trying to clone mtd-utils from source
>> today by:
>>
>> git clone git://git.infradead.org/mtd-utils.git
>>
>> but the result shows connection timeout. Did I do something wrong?
> I just tried running this exact line on my system an it appears to work.
>
> Maybe there was a problem with the server or your internet connection at
> the time you tried?
>
>
> Regards,
>
> David
>
