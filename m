Received: from mail-ww0-f45.google.com ([74.125.82.45])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QqsSI-0007fs-CS
	for linux-mtd@lists.infradead.org; Tue, 09 Aug 2011 19:59:15 +0000
Received: by wwi14 with SMTP id 14so312600wwi.26
	for <linux-mtd@lists.infradead.org>;
	Tue, 09 Aug 2011 12:59:09 -0700 (PDT)
MIME-Version: 1.0
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
Date: Tue, 9 Aug 2011 12:59:09 -0700
Message-ID: <CAN8TOE_V2wjCwh=vOGzecyf27h6asOub+g-t0Ep1qk4_QQpcyg@mail.gmail.com>
Subject: Re: [BUG] mtdinfo -a: Tries to open NULL pointer for NOR with
	Eraseblock Regions
From: Brian Norris <computersforpeace@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Brian Foster <brian.foster@maxim-ic.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Aug 9, 2011 at 10:34 AM, Mike Frysinger <vapier@gentoo.org> wrote:
> 1: add region_info to sysfs
> 2: add a warning --all that it could be incomplete
> 3: have --all use the legacy lookup func to get /dev/mtd#
>
> i dont have a preference between any of these 3. =A0obviously removing
> region_info support is not an option.

OK, then I'll vote for option 2 and send a modification to my last
patch (to include a help message). Then if someone ever makes the time
to do option 1, it can fit nicely into option 2, since newer kernels
would be able to give complete info and older ones would not.

Brian
