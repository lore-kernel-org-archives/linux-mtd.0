Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R5jAr-0002wY-28
	for linux-mtd@lists.infradead.org; Mon, 19 Sep 2011 19:06:37 +0000
Received: by wyh11 with SMTP id 11so7115206wyh.22
	for <linux-mtd@lists.infradead.org>;
	Mon, 19 Sep 2011 12:06:35 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <201109160812.58260.jbe@pengutronix.de>
References: <201109151333.48684.jbe@pengutronix.de>
	<CAN8TOE9YctZ8hO7UTM9k7f8SBaWPzyBHyEgtK96Su5MRCrMjPA@mail.gmail.com>
	<201109160812.58260.jbe@pengutronix.de>
Date: Mon, 19 Sep 2011 12:06:35 -0700
Message-ID: <CAN8TOE8ujmPH9LjNyH=_C81T9FHzxjUQzV-W8kcedMY+noSrNA@mail.gmail.com>
Subject: Re: How to distinguish MLC and SLC NANDs?
From: Brian Norris <computersforpeace@gmail.com>
To: Juergen Beisert <jbe@pengutronix.de>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org, Atlant Schmidt <aschmidt@dekaresearch.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Sep 15, 2011 at 11:12 PM, Juergen Beisert <jbe@pengutronix.de> wrote:
> Brian Norris wrote:
>> chip->cellinfo & NAND_CI_CELLTYPE_MSK
>>
>> According to the data sheets for *most* NAND parts, this is a safe way
>> of determining SLC vs. MLC (non-zero => MLC; zero => SLC), and we use
>> it for certain detection code paths.
>
> Hmm, *most* means this information is not reliable?

*most* means a few things here:

1) this mechanism is only used for a small portion of our detection
code and doesn't have a wide variety of test coverage, I don't think.
If this code were incorrect, most users of this code would at most get
a slightly different bad block scanning pattern; this kind of issue
isn't always real easy to notice. Also, there are some Samsung MLC
that rely on this info for their code path.
2) this mask is defined in many NAND data sheets so that it is safe to
use on any chips that I have seen. Some don't specify everything but
still tend to follow this pattern.
3) NAND does not have a real standard for decoding ID bytes, although
there are a couple of patterns that have become de-facto standards
(with various exceptions, of course; none noticed on this particular
issue)

> Would it be better to give the driver a hint what kind of NAND it should expect via the platform_data?

Your prior knowledge of the NAND chip would probably be more reliable.

> I was in the hope of a perfect world and the MTD framework detects the NAND
> type reliable ;-). Now I tend more to use user's info from the platform_data.

Unfortunately, there is little perfection in NAND standards.

Brian
