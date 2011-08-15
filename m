Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qt0wX-0005qm-HM
	for linux-mtd@lists.infradead.org; Mon, 15 Aug 2011 17:27:18 +0000
Received: by wwf10 with SMTP id 10so3678524wwf.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 15 Aug 2011 10:27:14 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAMjpGUdr2+_3U4TbN9L2MLWarzya3qHkTghqvbY8Yp+JPQN1Dg@mail.gmail.com>
References: <CAMjpGUdR-Z-mSN0oRgeVfWJ7jFjmvaKyKL3aMo-58-HZsmNidQ@mail.gmail.com>
	<1313079580-22144-1-git-send-email-computersforpeace@gmail.com>
	<201108120906.20453.brian.foster@maxim-ic.com>
	<CAN8TOE8QUdskvjJGStE9O3Tj2_aNBBthEb-EFV8DpYHK20YrWw@mail.gmail.com>
	<CAMjpGUdr2+_3U4TbN9L2MLWarzya3qHkTghqvbY8Yp+JPQN1Dg@mail.gmail.com>
Date: Mon, 15 Aug 2011 10:27:13 -0700
Message-ID: <CAN8TOE9EEtGQCHL3_2aspTstu12p5TxVB_t8ED6_UF+MUV4XXA@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] mtdinfo: consolidate help as display_help()
From: Brian Norris <computersforpeace@gmail.com>
To: Mike Frysinger <vapier.adi@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
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

On Sat, Aug 13, 2011 at 11:10 AM, Mike Frysinger <vapier.adi@gmail.com> wrote:
> On Fri, Aug 12, 2011 at 12:37, Brian Norris wrote:
...
>> "mtdinfo"). I suppose we could either hardcode the spaces in or try to
>> do some sort of "ARRAY_SIZE" trickery (as found in the Linux kernel)
>
> you could probably use %*s and then pass in "" as well as <some max
> spacing number - strlen(PROGRAM_NAME)>.
>
> printf("%*s\n", 80 - strlen(PROGRAM_NAME), "");

Yes, that's what I meant...of course "strlen" is better than writing
your own ARRAY_SIZE() when you already have the full C library :)

But I'm not sure about the subtraction part. Perhaps just use the
length as extra indentation...I'll send a patch to make it clear!

Brian

"Someday, you might find yourself accidentally using printk() instead
of printf() in your user-space code. When that day comes, you can say
you are a true kernel hacker."
        --Robert Love, Linux Kernel Development
