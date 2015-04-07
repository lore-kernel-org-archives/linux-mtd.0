Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YfV7Y-00061o-1J
 for linux-mtd@lists.infradead.org; Tue, 07 Apr 2015 15:08:58 +0000
Date: Tue, 7 Apr 2015 17:08:33 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Andrea Scian <rnd4@dave-tech.it>
Subject: Re: [MLC NAND]: data pattern sensivity
Message-ID: <20150407170833.4726f3b9@bbrezillon>
In-Reply-To: <5523D9D5.1020109@dave-tech.it>
References: <551E615D.3090804@dave-tech.it>
 <0D23F1ECC880A74392D56535BCADD7356B6D0F17@NTXBOIMBX03.micron.com>
 <5523B1EE.1050906@dave-tech.it>
 <20150407131928.350ee827@bbrezillon>
 <5523D9D5.1020109@dave-tech.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: "Jeff Lauruhn \(jlauruhn\)" <jlauruhn@micron.com>,
 mtd_mailinglist <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 07 Apr 2015 15:21:25 +0200
Andrea Scian <rnd4@dave-tech.it> wrote:

> Thanks for linking this again.
> I think that Jeff can help us in understanding this further.
> The documents is pretty old (2009) and is about TLC only.
> Does it mean that MLC are less (or not at all) affected by this issue?

Some MLC chips require a randomization step: take a look at this
datasheet [1], page 21:
"Users are required to employ randomizer function in the NAND
controller to meet target endurance of the device."

[1]http://www.100y.com.tw/pdf_file/37-SAMSUNG-K9GBG08U0A-SCB0.pdf


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
