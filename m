Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qt6Lw-0002XU-Vn
	for linux-mtd@lists.infradead.org; Mon, 15 Aug 2011 23:13:53 +0000
Received: by wwf10 with SMTP id 10so3860229wwf.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 15 Aug 2011 16:13:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1313381489.2200.19.camel@koala>
References: <201107251148.51262.brian.foster@maxim-ic.com>
	<CAN8TOE8Uk09DPJ_OYXh4RjnKkXugEFLpZQ+hrA4Gw4oK2cQYOw@mail.gmail.com>
	<201107260921.44512.brian.foster@maxim-ic.com>
	<CAN8TOE847yECw3zeh42tf=6mC73O33Lr7Lzwpi0FrT-rB9ZYmg@mail.gmail.com>
	<CAMjpGUc1a4NR5PWt3A5Y+jv6ihsWjUgH3iVUpNc0dsvkEzx6pw@mail.gmail.com>
	<CAN8TOE--96V6ZruB8+VvAz2kqxqMq4nc4d5=6SGsUt0eu7og0g@mail.gmail.com>
	<CAMjpGUcTPR=EVOtfju5_S4Zu_h-rmqnCii4R0j7yFX8JTD81uA@mail.gmail.com>
	<CAN8TOE9p1v=mDUawRrnVAwDO4zz9LmXkqdNynLPCSCnBRMr9pw@mail.gmail.com>
	<CAMjpGUcjhuc6MaH0y2vGdM5ru00BJEmVeBwMUebkbfoxDNY28g@mail.gmail.com>
	<1313381489.2200.19.camel@koala>
Date: Mon, 15 Aug 2011 16:13:50 -0700
Message-ID: <CAN8TOE9NyKqOkfYC6h_44Wf+xs7ZtTjGS+YkLAhLV60FnKB2hQ@mail.gmail.com>
Subject: Re: [BUG] mtdinfo -a: Tries to open NULL pointer for NOR with
	Eraseblock Regions
From: Brian Norris <computersforpeace@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: Brian Foster <brian.foster@maxim-ic.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Mike Frysinger <vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

On Sun, Aug 14, 2011 at 9:11 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> How about: make a quick fix and release mtd-utils-1.4.6, then just kill
> the -a option. I'd vote for eliminating all the code which has to
> guess/assume/find the device node names - I think they always have to be
> passed by the user instead. We can do the elimination the usual way -
> first add the warning, then kill.

Well, I have a little reservation on killing `-a', since it's useful.
In light of this, you just pushed some of my bug reporting
documentation to the website that includes references to `mtdinfo -a',
since it contains a lot more info than `cat /proc/mtd'. But we can
just modify the website again, if necessary.

> This is also a good way to go because mtd stuff does not have enough
> people for excellent maintenance, and keeping it simpler should be
> helpful.

I agree that simpler is better (usually). So if we decide that will be
simplest, then that's fine.

Is there a problem with my choice of option 2 from Mike's list?

> > 2: add a warning --all that it could be incomplete

See my patch that implements it:
http://lists.infradead.org/pipermail/linux-mtd/2011-August/037393.html

This way, we do not rely on guessing any paths; we simply use the
sysfs information that is exposed, among other purposes, for cases
cases like this, right? And then (as I stated on another message in
this thread) we could even support the "region info" on newer kernels,
if somebody ever does the work to export them. I think this solution
involves no extra work right now, does not remove valuable features,
does not make dirty assumptions about node names, and can take
advantage of new sysfs features in the future. The main downside I see
is the potential (documented) difference in information printed by
`mtdinfo --all' vs. `mtdinfo /dev/mtdX'.

Brian
