Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bNMus-0000BX-Ca
 for linux-mtd@lists.infradead.org; Wed, 13 Jul 2016 16:21:42 +0000
Message-ID: <1468426862.18533.55.camel@gmail.com>
Subject: Re: UBIFS orphans and ro-mounts
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Richard Weinberger <richard@sigma-star.at>, Boris Brezillon
 <boris.brezillon@free-electrons.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Wed, 13 Jul 2016 19:21:02 +0300
In-Reply-To: <57863A51.6030205@sigma-star.at>
References: <57863442.1000303@sigma-star.at>
 <1468414098.18533.34.camel@gmail.com> <57863A51.6030205@sigma-star.at>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2016-07-13 at 14:55 +0200, Richard Weinberger wrote:
> A new mount option is an option, true.
> That said, the real solution is that u-boot (and other bootloaders)
> should not mount UBIFS and use static volumes.
> But currently the opposite is happening on most systems I get my
> hands on. :(

May be orphans could be handled in background? 
