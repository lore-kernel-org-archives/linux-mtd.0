Received: from mail-oi0-x229.google.com ([2607:f8b0:4003:c06::229])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cm6FW-0006OT-3u
 for linux-mtd@lists.infradead.org; Thu, 09 Mar 2017 22:09:32 +0000
Received: by mail-oi0-x229.google.com with SMTP id 2so43193929oif.0
 for <linux-mtd@lists.infradead.org>; Thu, 09 Mar 2017 14:09:08 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <58BEB65B.3050003@idquantique.com>
References: <58BEB65B.3050003@idquantique.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Thu, 9 Mar 2017 23:09:06 +0100
Message-ID: <CAFLxGvy=PHU1Yc74TgQ-S9+Q_jRnYEUVywzYqbhdmQRGHk_vJA@mail.gmail.com>
Subject: Re: Timeout in denali.c on Micron nandflash (Altera SoC)
To: Thorsten Christiansson <thorsten.christiansson@idquantique.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "laurent.monat@idquantique.com" <laurent.monat@idquantique.com>,
 David Oberhollenzer <goliath@sigma-star.at>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thorsten,

On Tue, Mar 7, 2017 at 2:32 PM, Thorsten Christiansson
<thorsten.christiansson@idquantique.com> wrote:
> Hi all,
>
> I'm using Linux on an Altera SoC (Arria V), on which I'm using UBIFS on a
> nandflash from Micron (MT29F8G08ADADAH4).  I have a 400Mb r/w partition on
> which I have a sqlite3-based database. We're running an application that
> reads/writes fairly small blocks. After running for about a week at moderate
> load, I get an error message, and the filesystem becomes read-only.
>
> The message I get is a timeout, originating in the denali.c driver.
> [11744.733748] timeout occurred, status = 0x0, mask = 0x4
> [11745.733685] timeout occurred, status = 0x0, mask = 0x120
>
> I can also reproduce the error much faster (in ~1h) using the GNU 'stress'
> command, writing/reading small files continuously.
>
> I'm using Linux 4.4, with some patches from Altera. I have compared the
> denali.c that I'm using with the current HEAD on github, and the differences
> appear to be only cosmetic.
>
> I have asked Altera for help, but their only response so far has been that
> they can reproduce the issue on their latest SoCs (it apparently appears on
> both Arria10 and CycloneV) with the same flash. (We have also tested with a
> Macronix MX66U51235FMI-10G, with the same results.)
>
> At first we used the FASTMAP feature of the UBIFS, but then we ran into this
> issue after only a couple of hours running at moderate load. When we
> disabled
> that, we thought the problem was gone, but it appears that it was only
> hiding,
> and now comes out to bite us after about a week.
>
>
> My questions are the following:
> - Are there any known issues with the denali driver that could cause this?

Well, 4.4. is not very fresh. Maybe it saw fixes in recent version.

> - Could it be an issue in the MTD/UBI/UBIFS layers?

Since the denali driver prints the timeouts I'd say the root of the
problem is there.

> - Are there any other parameters that can be tuned in order to alleviate the
>   problem?
>
> and of course
> - Have I missed something obvious? I'm pulling my hair here...

Can you please give MTD tests a try?

-- 
Thanks,
//richard
