Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zcazv-0001Rw-7m
 for linux-mtd@lists.infradead.org; Thu, 17 Sep 2015 15:21:20 +0000
Message-ID: <1442503239.19983.18.camel@gmail.com>
Subject: Re: UBI/UBIFS: dealing with MLC's paired pages
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger
 <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Andrea Scian
 <rnd4@dave-tech.it>, Qi Wang =?UTF-8?Q?=E7=8E=8B=E8=B5=B7?= "(qiwang)"
 <qiwang@micron.com>, Iwo Mergler <Iwo.Mergler@netcommwireless.com>, "Jeff
 Lauruhn (jlauruhn)" <jlauruhn@micron.com>
Date: Thu, 17 Sep 2015 18:20:39 +0300
In-Reply-To: <20150917152240.757c9e90@bbrezillon>
References: <20150917152240.757c9e90@bbrezillon>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2015-09-17 at 15:22 +0200, Boris Brezillon wrote:
> Hello,
> 
> I'm currently working on the paired pages problem we have on MLC
> chips.
> I remember discussing it with Artem earlier this year when I was
> preparing my talk for ELC.

Hi Boris,

excellent summary, very structured. I won't generate any new idea now,
just an implementation tactics suggestion.

For an implementation, I'd started with a power cut emulator which
emulates paired pages. I'd probably do it in UBI, may be lower. I'd
also write a good UBI power-cut test application. And then I'd start
playing with various implementation approaches. I'd use the test-driven
approach.

Artem.
