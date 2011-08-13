Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QsIft-0003ks-CL
	for linux-mtd@lists.infradead.org; Sat, 13 Aug 2011 18:11:10 +0000
Received: by bke17 with SMTP id 17so2732061bke.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 13 Aug 2011 11:11:06 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAN8TOE8QUdskvjJGStE9O3Tj2_aNBBthEb-EFV8DpYHK20YrWw@mail.gmail.com>
References: <CAMjpGUdR-Z-mSN0oRgeVfWJ7jFjmvaKyKL3aMo-58-HZsmNidQ@mail.gmail.com>
	<1313079580-22144-1-git-send-email-computersforpeace@gmail.com>
	<201108120906.20453.brian.foster@maxim-ic.com>
	<CAN8TOE8QUdskvjJGStE9O3Tj2_aNBBthEb-EFV8DpYHK20YrWw@mail.gmail.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Sat, 13 Aug 2011 14:10:46 -0400
Message-ID: <CAMjpGUdr2+_3U4TbN9L2MLWarzya3qHkTghqvbY8Yp+JPQN1Dg@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] mtdinfo: consolidate help as display_help()
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Brian Foster <brian.foster@maxim-ic.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 12, 2011 at 12:37, Brian Norris wrote:
> On Fri, Aug 12, 2011 at 12:06 AM, Brian Foster wrote:
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "Examples:\n"
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 " =C2=A0%1$s /dev/mtd0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print information MTD device /dev/mt=
d0\n"
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 " =C2=A0%1$s /dev/mtd0 -u =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0print information MTD device /dev/mtd0\n"
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "\t\t\t\tand include UBI la=
yout information\n"
>>
>> =C2=A0Any reason this line, and only this line,
>> =C2=A0uses tabs (\t) for formatting whilst every
>> =C2=A0other line uses spaces? =C2=A0(FWIW, I prefer
>> =C2=A0spaces, but more importantly think there
>> =C2=A0should be some consistency.)
>
> Yes, sort of. It's used to be because we "don't know" the length of
> the "%1$s" strings (i.e., the PROGRAM_NAME macro, which here is just
> "mtdinfo"). I suppose we could either hardcode the spaces in or try to
> do some sort of "ARRAY_SIZE" trickery (as found in the Linux kernel)
> to find the length of PROGRAM_NAME. I'll see how the second option
> works (for a potential v4 patch?) unless someone objects.

you could probably use %*s and then pass in "" as well as <some max
spacing number - strlen(PROGRAM_NAME)>.

printf("%*s\n", 80 - strlen(PROGRAM_NAME), "");
-mike
