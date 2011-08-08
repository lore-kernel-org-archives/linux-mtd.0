Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QqZ6a-0006f3-1O
	for linux-mtd@lists.infradead.org; Mon, 08 Aug 2011 23:19:33 +0000
Received: by wwf10 with SMTP id 10so2516228wwf.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 08 Aug 2011 16:19:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAMjpGUcTPR=EVOtfju5_S4Zu_h-rmqnCii4R0j7yFX8JTD81uA@mail.gmail.com>
References: <201107251148.51262.brian.foster@maxim-ic.com>
	<CAN8TOE8Uk09DPJ_OYXh4RjnKkXugEFLpZQ+hrA4Gw4oK2cQYOw@mail.gmail.com>
	<201107260921.44512.brian.foster@maxim-ic.com>
	<CAN8TOE847yECw3zeh42tf=6mC73O33Lr7Lzwpi0FrT-rB9ZYmg@mail.gmail.com>
	<CAMjpGUc1a4NR5PWt3A5Y+jv6ihsWjUgH3iVUpNc0dsvkEzx6pw@mail.gmail.com>
	<CAN8TOE--96V6ZruB8+VvAz2kqxqMq4nc4d5=6SGsUt0eu7og0g@mail.gmail.com>
	<CAMjpGUcTPR=EVOtfju5_S4Zu_h-rmqnCii4R0j7yFX8JTD81uA@mail.gmail.com>
Date: Mon, 8 Aug 2011 16:19:11 -0700
Message-ID: <CAN8TOE9p1v=mDUawRrnVAwDO4zz9LmXkqdNynLPCSCnBRMr9pw@mail.gmail.com>
Subject: Re: [BUG] mtdinfo -a: Tries to open NULL pointer for NOR with
	Eraseblock Regions
From: Brian Norris <computersforpeace@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
Content-Type: text/plain; charset=windows-1252
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

On Fri, Aug 5, 2011 at 6:18 PM, Mike Frysinger <vapier@gentoo.org> wrote:
> On Fri, Aug 5, 2011 at 17:09, Brian Norris wrote:
>> On Thu, Aug 4, 2011 at 3:41 PM, Mike Frysinger wrote:
>>> when extending mtdinfo, we decided to only support device paths which
>>> the user gave us. =A0hence the -m option going away. =A0libmtd itself h=
as
>>> /dev/mtd# hardcoded (and imo, that's the only path we should support
>>> "automatically"), so if we're going to keep the all option, we'll want
>>> to continue with that (by using the func that libmtd provides rather
>>> than mtdinfo constructing the string itself).
>>
>> Hmm, where exactly in mtd-utils/libmtd is the /dev/mtd# hardcoded?
>
> i was thinking of legacy_get_dev_info1()

I'm not sure we should be reaching back to legacy options for current
support. Besides, I see in the feature-removal messages that were
placed for the removal of the `-m' option to mtdinfo (commit
74bef2b8693c7e4f78e1ef742933b7231e49c7ad to mtd-utils):

"We cannot assume that mtd device names follow the "/dev/mtd%d" pattern"

It seems silly to reverse this just for the sake of some region_info stuff.

> alternatively, we punt --all and just make users run `mtdinfo
> /dev/mtd?`. =A0i'm fine with that too.

I also feel like `--all' is too valuable to be killed just because of
region_info.

Instead, I'm a little more inclined to go for Brian Foster's
suggestion (from another branch of this thread):

"Alternatively, --all only prints what it can get,
and --help warns there _may_ be additional data not
printed by --all (and to use =91mtdinfo /dev/mtd<N>=92)."

Only problem I see is that this provides a little bit of
inconsistency, where `mtdinfo --all' isn't quite all the info. But
with an addition help message as described by Mr. Foster, I don't
think this would be much problem.

I guess I'm leaning toward this suggestion partly because it is
effectively the same as my proposed patch and partly because the other
alternatives involve dropping support for features (either full udev
support or the `--all' option).

Brian
