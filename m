Subject: Re: State of UBI
From: David Woodhouse <dwmw2@infradead.org>
To: dedekind@yandex.ru
In-Reply-To: <4503D10E.000001.07116@webmail12.yandex.ru>
References: <625fc13d0609091922m42a1caeagfa4e87bc18f2a8d6@mail.gmail.com>
	<4503D10E.000001.07116@webmail12.yandex.ru>
Content-Type: text/plain
Date: Sun, 10 Sep 2006 11:52:39 +0100
Message-Id: <1157885559.2977.136.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: jwboyer@gmail.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2006-09-10 at 12:47 +0400, dedekind wrote:
> Well, what you've listed is not what UBI itself needs:
> 1. "double page writes on NAND" - it needs MTD changes and zero UBI changes.
> 2. JFFS2 integration also requires zero changes in UBI (as long as it is
> sane).

I need to properly review UBI but I've been fairly busy on OLPC hardware
bringup so I haven't found the time yet.

Preliminary impressions are that I'm concerned by the amount of code --
it's _huge_. And I'm concerned by the fact that it doesn't just provide
MTD devices. I had envisaged that it would be fairly much akin to
another partitioning layer, perhaps requiring a few extra methods to be
added to the mtd_info. But it's a new type of device all of its own, and
requires far more to be changed in MTD users (like JFFS2, FTL, etc.)
than I had imagined.

And should the 'static partition' stuff be a layer on _top_ of UBI
rather than an inseparable part of it?

-- 
dwmw2
