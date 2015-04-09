Received: from mx.dave-tech.it ([2.229.21.40])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YgIvU-0004Dp-Tg
 for linux-mtd@lists.infradead.org; Thu, 09 Apr 2015 20:19:51 +0000
Message-ID: <5526DEC7.8020802@dave-tech.it>
Date: Thu, 09 Apr 2015 22:19:19 +0200
From: Andrea Scian <rnd4@dave-tech.it>
MIME-Version: 1.0
To: "Jeff Lauruhn (jlauruhn)" <jlauruhn@micron.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [MLC NAND]: data pattern sensivity
References: <551E615D.3090804@dave-tech.it>	<0D23F1ECC880A74392D56535BCADD7356B6D0F17@NTXBOIMBX03.micron.com>	<5523B1EE.1050906@dave-tech.it>	<20150407131928.350ee827@bbrezillon>	<5523D9D5.1020109@dave-tech.it>
 <20150407170833.4726f3b9@bbrezillon>
 <0D23F1ECC880A74392D56535BCADD7356B6D16E1@NTXBOIMBX03.micron.com>
In-Reply-To: <0D23F1ECC880A74392D56535BCADD7356B6D16E1@NTXBOIMBX03.micron.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Cc: mtd_mailinglist <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Il 07/04/2015 19:45, Jeff Lauruhn (jlauruhn) ha scritto:
> I read back through the posts and I think we are talking about 2 separate things, random read time and randomization.
>
> Rand Read (tR) assumes you are doing a single read of a page (worst case), but most data is stored in blocks sequentially, so data output can be improve significantly by read by taking advantage of commands like READ PAGE CACHE SEQUENTIAL which copies the next sequential page from the NAND Flash array to the data register.
>
> Randomization is a relatively new feature, I'm no expert, but it's in general we know there are some distributions that are worse than others, and by randomizing the data we can avoid worst case and improve endurance.

Definitely here I'm speaking about the latter.
By looking inside the datasheet (hynix, micron and so on) I have I've 
found no MLC part that explicitly required such a implementation, apart 
the one pointed out by Boris.

Kind Regards,

-- 

Andrea SCIAN

DAVE Embedded Systems


> -----Original Message-----
> From: Boris Brezillon [mailto:boris.brezillon@free-electrons.com]
> Sent: Tuesday, April 07, 2015 8:09 AM
> To: Andrea Scian
> Cc: Jeff Lauruhn (jlauruhn); mtd_mailinglist
> Subject: Re: [MLC NAND]: data pattern sensivity
>
> On Tue, 07 Apr 2015 15:21:25 +0200
> Andrea Scian <rnd4@dave-tech.it> wrote:
>
>> Thanks for linking this again.
>> I think that Jeff can help us in understanding this further.
>> The documents is pretty old (2009) and is about TLC only.
>> Does it mean that MLC are less (or not at all) affected by this issue?
>
> Some MLC chips require a randomization step: take a look at this datasheet [1], page 21:
> "Users are required to employ randomizer function in the NAND controller to meet target endurance of the device."
>
> [1]http://www.100y.com.tw/pdf_file/37-SAMSUNG-K9GBG08U0A-SCB0.pdf
>
>
> --
> Boris Brezillon, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
>


-- 

Andrea SCIAN

DAVE Embedded Systems
