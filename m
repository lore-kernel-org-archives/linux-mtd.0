Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZttJw-0002lI-7p
 for linux-mtd@lists.infradead.org; Wed, 04 Nov 2015 08:21:29 +0000
Message-ID: <1446625250.20949.26.camel@gmail.com>
Subject: Re: master node can not be recovered
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Richard Weinberger <richard@nod.at>, Bean Huo
 =?UTF-8?Q?=E9=9C=8D=E6=96=8C=E6=96=8C?= "(beanhuo)"
 <beanhuo@micron.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Date: Wed, 04 Nov 2015 10:20:50 +0200
In-Reply-To: <5639BBDE.5000604@nod.at>
References: <A765B125120D1346A63912DDE6D8B6310BF4FB2A@NTXXIAMBX02.xacn.micron.com>
 <5637934D.5000503@nod.at> <1446541937.6126.125.camel@gmail.com>
 <A765B125120D1346A63912DDE6D8B6310BF4FE9E@NTXXIAMBX02.xacn.micron.com>
 <5639BBDE.5000604@nod.at>
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

On Wed, 2015-11-04 at 09:03 +0100, Richard Weinberger wrote:
> But if two or more pages are corrupted UBIFS will give up as this
> most not happen
> from UBIFS's point of view.

Right, and I hear that a lot of bug reports and frustration comes from
this. This worked with SLCs we were using when implementing UBIFS
(particularly, Samsung OneNAND was used, it was very high-quality
NAND). Nowadays, this needs to be changed.

UBIFS logic is this. If there is a corruption, then it must be in the
last used NAND page. Pages after this NAND page must contain empty
space.

A small complication, which is not important now, is that UBIFS may
operate with multiple NAND pages, this depends on what the driver tells
is the min. IO size.

No the logic behind this was that we always write data from the
beginning of the LEB, and continue to its end. In case of a power cut,
we can only get corruption in the last NAND page (or more strictly,
min. I/O unit) where we were writing to. The next NAND page and all the
NAND pages after it should be empty. The previous NAND page and all the
NAND pages before it should contain valid data (CRC OK).

Pretty simple. Worked well.

So what has to be changed in this logic? Obviously, the definition of
empty space should be changed, it seems, because obviously not every
driver wants/can ECC-protect the empty space.

What else?
