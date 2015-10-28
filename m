Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZrPWP-0005rI-8J
 for linux-mtd@lists.infradead.org; Wed, 28 Oct 2015 12:08:05 +0000
Message-ID: <1446034017.12536.60.camel@gmail.com>
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
Date: Wed, 28 Oct 2015 14:06:57 +0200
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
> 1/ do not skip any pages until we are asked to secure the data, and
>    then skip as much pages as needed to ensure nobody can ever
> corrupt
>    the data. With this approach you can loose a non negligible amount
>    of space. For example, with this paired pages scheme [1], if you
>    only write page on page 2 and want to secure your data, you'll
> have
>    to skip pages 3 to 8.

This sounds like a the right way to go to me.
