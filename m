Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e0SIn-00062i-4s
 for linux-mtd@lists.infradead.org; Fri, 06 Oct 2017 13:04:50 +0000
Received: by mail-wm0-x241.google.com with SMTP id u138so7799387wmu.4
 for <linux-mtd@lists.infradead.org>; Fri, 06 Oct 2017 06:04:08 -0700 (PDT)
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <20171006123203.GM21978@ZenIV.linux.org.uk>
References: <20170923201314.GA14742@amd> <9307201.RrdVcHfbLZ@blindfold>
 <20171006115514.GF9497@amd> <5423699.qLmXvRyVVn@blindfold>
 <1507291276.29211.350.camel@infradead.org> <20171006121359.GA14435@amd>
 <20171006123203.GM21978@ZenIV.linux.org.uk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 6 Oct 2017 15:04:06 +0200
Message-ID: <CAMuHMdU2mFkQHwTZ9AWihoQXryU2ZjsvwyOkth-cf_M7HeppWQ@mail.gmail.com>
Subject: Re: [PATCH] Fix C++ kernel in include/linux/mtd/mtd.h
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Pavel Machek <pavel@ucw.cz>, David Woodhouse <dwmw2@infradead.org>,
 Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Brian Norris <computersforpeace@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jiri Kosina <trivial@kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 6, 2017 at 2:32 PM, Al Viro <viro@zeniv.linux.org.uk> wrote:
> On Fri, Oct 06, 2017 at 02:13:59PM +0200, Pavel Machek wrote:
>> On Fri 2017-10-06 13:01:16, David Woodhouse wrote:
>> > On Fri, 2017-10-06 at 14:00 +0200, Richard Weinberger wrote:
>> > > Am Freitag, 6. Oktober 2017, 13:55:14 CEST schrieb Pavel Machek:
>> > > > > Let's carry it via MTD.
>> > > > > BTW: Shouldn't it be s/kernel/comment/ in the subject line?
>> > > > Yes, it should. Can it be fixed while applying?
>> > > Sure. :)
>> >
>> > You can change 'C++' to 'C99' too, while you're at it :)
>>
>> No. They are C++ comments... as in... dangerous infection that came
>> from C++. Yes, C99 is infected, too, but still C++ is original source
>> of infection :-).
>
> No, it is not.  See https://www.bell-labs.com/usr/dmr/www/bcpl.html and
> scans refered therein; let's keep snobbery historically accurate...
>
> IOW, it's not C++ invention - it's BCPL one.

Ah, longing for the return of BPTRs and BSTRs ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
