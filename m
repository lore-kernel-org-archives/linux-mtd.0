Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZcqV3-0006d4-Kb
 for linux-mtd@lists.infradead.org; Fri, 18 Sep 2015 07:54:30 +0000
Message-ID: <1442562845.19983.43.camel@gmail.com>
Subject: Re: UBI/UBIFS: dealing with MLC's paired pages
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Andrea Scian <rnd4@dave-tech.it>, Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Qi Wang
 =?UTF-8?Q?=E7=8E=8B=E8=B5=B7?= "\"(qiwang)\"" <qiwang@micron.com>, Iwo
 Mergler <Iwo.Mergler@netcommwireless.com>, "Jeff Lauruhn (jlauruhn)"
 <jlauruhn@micron.com>
Date: Fri, 18 Sep 2015 10:54:05 +0300
In-Reply-To: <55FBBA6E.9070203@dave-tech.it>
References: <20150917152240.757c9e90@bbrezillon>
 <1442503239.19983.18.camel@gmail.com> <20150917174642.0c983136@bbrezillon>
 <55FAEEB1.50401@nod.at> <55FBBA6E.9070203@dave-tech.it>
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

Hi Andrea,

On Fri, 2015-09-18 at 09:17 +0200, Andrea Scian wrote:
> I perfectly understand the reason why using nandsim (and powercut 
> simulator in general) but, AFAIK, the powercut problem is hard to 
> "simulate" because the main issue is when the device see a loss of
> power 
> in the middle of an operation (page write or block erase)

This is right, and no doubts real power cuts testing is the most
important thing.

However, at the beginning, it is very hard to develop if you do not
have a quick way to verify your ideas. Simulation is exactly for this -
to make the first reliable draft. Once that work, you go to the second
stage - real HW testing.

Real HW testing requires a real power cycle, no guarantees power cut
happens at the right moment, so you may spend hours emulating just one
paired-page case. Compare this to just running a script, and it
emulates you 100 paired-page cases during 10 minutes. And you can
emulate it easily at the interesting places, not just during the main
data writes.

So, to recap, I suggest emulation to make the first draft, and then
start heavy real testing to shape the final solution.

Artem.
