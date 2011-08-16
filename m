Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QtNBw-0007tW-5g
	for linux-mtd@lists.infradead.org; Tue, 16 Aug 2011 17:12:40 +0000
Received: by wwf10 with SMTP id 10so91398wwf.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 16 Aug 2011 10:12:38 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <201108160918.15975.brian.foster@maxim-ic.com>
References: <CAMjpGUdR-Z-mSN0oRgeVfWJ7jFjmvaKyKL3aMo-58-HZsmNidQ@mail.gmail.com>
	<CAN8TOE9EEtGQCHL3_2aspTstu12p5TxVB_t8ED6_UF+MUV4XXA@mail.gmail.com>
	<CAMjpGUcNqGkbTQUX9Lq+B+gSN8TUySs=p_kxZE4TQn1amwk2ow@mail.gmail.com>
	<201108160918.15975.brian.foster@maxim-ic.com>
Date: Tue, 16 Aug 2011 10:12:38 -0700
Message-ID: <CAN8TOE9yGBts+8oZ-TZoSH8wRdRmctN5c6w3JQgUdbwmpRNJGw@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] mtdinfo: consolidate help as display_help()
From: Brian Norris <computersforpeace@gmail.com>
To: Brian Foster <brian.foster@maxim-ic.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Mike Frysinger <vapier.adi@gmail.com>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Aug 16, 2011 at 12:18 AM, Brian Foster
<brian.foster@maxim-ic.com> wrote:
> On Tuesday 16 August 2011 06:00:57 Mike Frysinger wrote:
>> On Mon, Aug 15, 2011 at 13:27, Brian Norris wrote:
>> > Yes, that's what I meant...of course "strlen" is better than writing
>> > your own ARRAY_SIZE() when you already have the full C library :)
>>
>> gcc optimizes strlen("constant") into a number

I was referring to the fact that the kernel does not provide all
standard C library functions, whereas user-space does. Even so, I
overlooked the fact that the kernel has a "strlen" function
(linux/kernel.h)

> =A0And =91ARRAY_SIZE(...)=92, in this case, is simply =91sizeof(...)=92
> =A0(or, actually, =91sizeof(...)-1=92 to be equivalent to =91strlen=92).
>
> =A0Albeit I won't worry about the case of =A0strlen > 80 =A0here,
> =A0I am mildly curious what the output would be if that were
> =A0indeed true...?

Mike's example is a little different than my patch that was just
included in mtd-utils. I don't think my version would have a problem
with strlen > 80.

> =A0The other thing I won't worry about is the assumption every
> =A0output byte in PROGRAM_NAME is a printing glyph occupying
> =A0exactly one cell. =A0That is true (in this case) ....

Not sure how often anyone needs to worry about this one...really, this
particular discussion is mostly an exercise in frivolity IMO, as I
don't see us changing the PROGRAM_NAME for mtdinfo any time soon, and
even if we did, it's not that hard to edit some whitespace.

Brian
