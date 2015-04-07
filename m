Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YfXa8-0006GH-F7
 for linux-mtd@lists.infradead.org; Tue, 07 Apr 2015 17:46:38 +0000
From: "Jeff Lauruhn (jlauruhn)" <jlauruhn@micron.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Andrea Scian
 <rnd4@dave-tech.it>
Subject: RE: [MLC NAND]: data pattern sensivity
Date: Tue, 7 Apr 2015 17:45:59 +0000
Message-ID: <0D23F1ECC880A74392D56535BCADD7356B6D16E1@NTXBOIMBX03.micron.com>
References: <551E615D.3090804@dave-tech.it>
 <0D23F1ECC880A74392D56535BCADD7356B6D0F17@NTXBOIMBX03.micron.com>
 <5523B1EE.1050906@dave-tech.it>	<20150407131928.350ee827@bbrezillon>
 <5523D9D5.1020109@dave-tech.it> <20150407170833.4726f3b9@bbrezillon>
In-Reply-To: <20150407170833.4726f3b9@bbrezillon>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: mtd_mailinglist <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I read back through the posts and I think we are talking about 2 separate t=
hings, random read time and randomization.=20

Rand Read (tR) assumes you are doing a single read of a page (worst case), =
but most data is stored in blocks sequentially, so data output can be impro=
ve significantly by read by taking advantage of commands like READ PAGE CAC=
HE SEQUENTIAL which copies the next sequential page from the NAND Flash arr=
ay to the data register.

Randomization is a relatively new feature, I'm no expert, but it's in gener=
al we know there are some distributions that are worse than others, and by =
randomizing the data we can avoid worst case and improve endurance.


Jeff Lauruhn
NAND Application Engineer
Embedded Business Unit
Micron Technology, Inc


-----Original Message-----
From: Boris Brezillon [mailto:boris.brezillon@free-electrons.com]=20
Sent: Tuesday, April 07, 2015 8:09 AM
To: Andrea Scian
Cc: Jeff Lauruhn (jlauruhn); mtd_mailinglist
Subject: Re: [MLC NAND]: data pattern sensivity

On Tue, 07 Apr 2015 15:21:25 +0200
Andrea Scian <rnd4@dave-tech.it> wrote:

> Thanks for linking this again.
> I think that Jeff can help us in understanding this further.
> The documents is pretty old (2009) and is about TLC only.
> Does it mean that MLC are less (or not at all) affected by this issue?

Some MLC chips require a randomization step: take a look at this datasheet =
[1], page 21:
"Users are required to employ randomizer function in the NAND controller to=
 meet target endurance of the device."

[1]http://www.100y.com.tw/pdf_file/37-SAMSUNG-K9GBG08U0A-SCB0.pdf


--
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
