Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QsoWW-0003uv-Ac
	for linux-mtd@lists.infradead.org; Mon, 15 Aug 2011 04:11:37 +0000
Received: by bke17 with SMTP id 17so3302734bke.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 14 Aug 2011 21:11:31 -0700 (PDT)
Subject: Re: [BUG] mtdinfo -a: Tries to open NULL pointer for NOR with
	Eraseblock Regions
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
Date: Mon, 15 Aug 2011 07:11:27 +0300
In-Reply-To: <CAMjpGUcjhuc6MaH0y2vGdM5ru00BJEmVeBwMUebkbfoxDNY28g@mail.gmail.com>
References: <201107251148.51262.brian.foster@maxim-ic.com>
	<CAN8TOE8Uk09DPJ_OYXh4RjnKkXugEFLpZQ+hrA4Gw4oK2cQYOw@mail.gmail.com>
	<201107260921.44512.brian.foster@maxim-ic.com>
	<CAN8TOE847yECw3zeh42tf=6mC73O33Lr7Lzwpi0FrT-rB9ZYmg@mail.gmail.com>
	<CAMjpGUc1a4NR5PWt3A5Y+jv6ihsWjUgH3iVUpNc0dsvkEzx6pw@mail.gmail.com>
	<CAN8TOE--96V6ZruB8+VvAz2kqxqMq4nc4d5=6SGsUt0eu7og0g@mail.gmail.com>
	<CAMjpGUcTPR=EVOtfju5_S4Zu_h-rmqnCii4R0j7yFX8JTD81uA@mail.gmail.com>
	<CAN8TOE9p1v=mDUawRrnVAwDO4zz9LmXkqdNynLPCSCnBRMr9pw@mail.gmail.com>
	<CAMjpGUcjhuc6MaH0y2vGdM5ru00BJEmVeBwMUebkbfoxDNY28g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Message-ID: <1313381489.2200.19.camel@koala>
Mime-Version: 1.0
Cc: Brian Foster <brian.foster@maxim-ic.com>,
	Brian Norris <computersforpeace@gmail.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-08-09 at 13:34 -0400, Mike Frysinger wrote:
> On Mon, Aug 8, 2011 at 19:19, Brian Norris wrote:
> > "Alternatively, --all only prints what it can get,
> > and --help warns there _may_ be additional data not
> > printed by --all (and to use ‘mtdinfo /dev/mtd<N>’)."
> 
> that's really the only other option of the three.
> 1: add region_info to sysfs
> 2: add a warning --all that it could be incomplete
> 3: have --all use the legacy lookup func to get /dev/mtd#

How about: make a quick fix and release mtd-utils-1.4.6, then just kill
the -a option. I'd vote for eliminating all the code which has to
guess/assume/find the device node names - I think they always have to be
passed by the user instead. We can do the elimination the usual way -
first add the warning, then kill.

This is also a good way to go because mtd stuff does not have enough
people for excellent maintenance, and keeping it simpler should be
helpful.

Thoughts?

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
