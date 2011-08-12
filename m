Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qrujw-0004JG-W4
	for linux-mtd@lists.infradead.org; Fri, 12 Aug 2011 16:37:45 +0000
Received: by wwf10 with SMTP id 10so2226065wwf.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 12 Aug 2011 09:37:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <201108120906.20453.brian.foster@maxim-ic.com>
References: <CAMjpGUdR-Z-mSN0oRgeVfWJ7jFjmvaKyKL3aMo-58-HZsmNidQ@mail.gmail.com>
	<1313079580-22144-1-git-send-email-computersforpeace@gmail.com>
	<201108120906.20453.brian.foster@maxim-ic.com>
Date: Fri, 12 Aug 2011 09:37:40 -0700
Message-ID: <CAN8TOE8QUdskvjJGStE9O3Tj2_aNBBthEb-EFV8DpYHK20YrWw@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] mtdinfo: consolidate help as display_help()
From: Brian Norris <computersforpeace@gmail.com>
To: Brian Foster <brian.foster@maxim-ic.com>
Content-Type: text/plain; charset=ISO-8859-1
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

On Fri, Aug 12, 2011 at 12:06 AM, Brian Foster
<brian.foster@maxim-ic.com> wrote:
>> + =A0 =A0 =A0 =A0 =A0 =A0 "Examples:\n"
>> + =A0 =A0 =A0 =A0 =A0 =A0 " =A0%1$s /dev/mtd0 =A0 =A0 =A0 =A0 =A0 =A0 pr=
int information MTD device /dev/mtd0\n"
>> + =A0 =A0 =A0 =A0 =A0 =A0 " =A0%1$s /dev/mtd0 -u =A0 =A0 =A0 =A0 =A0prin=
t information MTD device /dev/mtd0\n"
>> + =A0 =A0 =A0 =A0 =A0 =A0 "\t\t\t\tand include UBI layout information\n"
>
> =A0Any reason this line, and only this line,
> =A0uses tabs (\t) for formatting whilst every
> =A0other line uses spaces? =A0(FWIW, I prefer
> =A0spaces, but more importantly think there
> =A0should be some consistency.)

Yes, sort of. It's used to be because we "don't know" the length of
the "%1$s" strings (i.e., the PROGRAM_NAME macro, which here is just
"mtdinfo"). I suppose we could either hardcode the spaces in or try to
do some sort of "ARRAY_SIZE" trickery (as found in the Linux kernel)
to find the length of PROGRAM_NAME. I'll see how the second option
works (for a potential v4 patch?) unless someone objects.

> =A0Yes, this is pedantic trivia! =A0;-)

Still a valid question...in fact, this was something I had meant to
reconsider before sending this patch, but I forgot :)

Brian
