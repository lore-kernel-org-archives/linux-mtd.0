Received: from nf-out-0910.google.com ([64.233.182.191])
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GMOY7-0002PL-B5
	for linux-mtd@lists.infradead.org; Sun, 10 Sep 2006 13:36:36 +0100
Received: by nf-out-0910.google.com with SMTP id l37so1126554nfc
	for <linux-mtd@lists.infradead.org>;
	Sun, 10 Sep 2006 05:35:34 -0700 (PDT)
Message-ID: <625fc13d0609100535v13e88e15k5886b43fda286f6a@mail.gmail.com>
Date: Sun, 10 Sep 2006 07:35:34 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Subject: Re: State of UBI
In-Reply-To: <1157885559.2977.136.camel@pmac.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <625fc13d0609091922m42a1caeagfa4e87bc18f2a8d6@mail.gmail.com>
	<4503D10E.000001.07116@webmail12.yandex.ru>
	<1157885559.2977.136.camel@pmac.infradead.org>
Cc: dedekind@yandex.ru, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 9/10/06, David Woodhouse <dwmw2@infradead.org> wrote:
> On Sun, 2006-09-10 at 12:47 +0400, dedekind wrote:
> > Well, what you've listed is not what UBI itself needs:
> > 1. "double page writes on NAND" - it needs MTD changes and zero UBI changes.
> > 2. JFFS2 integration also requires zero changes in UBI (as long as it is
> > sane).
>
> I need to properly review UBI but I've been fairly busy on OLPC hardware
> bringup so I haven't found the time yet.
>
> Preliminary impressions are that I'm concerned by the amount of code --
> it's _huge_. And I'm concerned by the fact that it doesn't just provide
> MTD devices. I had envisaged that it would be fairly much akin to
> another partitioning layer, perhaps requiring a few extra methods to be
> added to the mtd_info. But it's a new type of device all of its own, and
> requires far more to be changed in MTD users (like JFFS2, FTL, etc.)
> than I had imagined.

Gluebi was intended to provide this translation from UBI device to MTD
device.  I don't think that is a bad approach myself.  Either way
though, JFFS2 needs to be taught not to do wear-leveling or erasing on
a UBI device.

I'll see if I can scrounge up the latest gluebi patches on Monday.  I
doubt they'll appear on this list otherwise.

josh
