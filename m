Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QpURu-0004Ut-3a
	for linux-mtd@lists.infradead.org; Sat, 06 Aug 2011 00:09:06 +0000
Received: by wwf10 with SMTP id 10so1019500wwf.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 05 Aug 2011 17:09:04 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAMjpGUc1a4NR5PWt3A5Y+jv6ihsWjUgH3iVUpNc0dsvkEzx6pw@mail.gmail.com>
References: <201107251148.51262.brian.foster@maxim-ic.com>
	<CAN8TOE8Uk09DPJ_OYXh4RjnKkXugEFLpZQ+hrA4Gw4oK2cQYOw@mail.gmail.com>
	<201107260921.44512.brian.foster@maxim-ic.com>
	<CAN8TOE847yECw3zeh42tf=6mC73O33Lr7Lzwpi0FrT-rB9ZYmg@mail.gmail.com>
	<CAMjpGUc1a4NR5PWt3A5Y+jv6ihsWjUgH3iVUpNc0dsvkEzx6pw@mail.gmail.com>
Date: Fri, 5 Aug 2011 17:09:04 -0700
Message-ID: <CAN8TOE--96V6ZruB8+VvAz2kqxqMq4nc4d5=6SGsUt0eu7og0g@mail.gmail.com>
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

On Thu, Aug 4, 2011 at 3:41 PM, Mike Frysinger <vapier@gentoo.org> wrote:
> On Thu, Aug 4, 2011 at 10:46, Brian Norris wrote:
>> On Tue, Jul 26, 2011 at 12:21 AM, Brian Foster wrote:
>>>> It seems that the basic issue we need to solve is how to find the
>>>> correct file devfs/udev path =A0[...]
>>>
>>> =A0As an FYI, in our current embedded systems (plural),
>>> =A0a static /dev is used (no udev, mdev, &tc). =A0Hence,
>>> =A0udev (and I assume also, devfs) path may not work
>>> =A0in such an environment?
>>
>> Now that I think about it, this doesn't seem like a very reliable
>> solution. Too much user-space variability.
>
> when extending mtdinfo, we decided to only support device paths which
> the user gave us. =A0hence the -m option going away. =A0libmtd itself has
> /dev/mtd# hardcoded (and imo, that's the only path we should support
> "automatically"), so if we're going to keep the all option, we'll want
> to continue with that (by using the func that libmtd provides rather
> than mtdinfo constructing the string itself).

Hmm, where exactly in mtd-utils/libmtd is the /dev/mtd# hardcoded?
Sorry, but I'm not finding it...

>>>> Also, is "region_info" a potential candidate for exporting via sysfs?
>>>> That would make this support easier to include in libmtd.
>>>
>>> =A0I don't know if it is exportable or not, but I concur
>>> =A0this seems like a possible/plausible solution.
>>
>> Even if we do this (which seems like a lot of info), it would only
>> apply to the newest kernels, where mtd-utils are *supposed* to be
>> backwards-compatible if possible, where they can fall back to old
>> methods if needed...
>
> i posted this question recently, and iirc the answer was that it isnt
> currently exported via sysfs, but shouldnt be hard to extend. =A0just
> have to find someone who wants to do it ;).

"someone who wants to do it" - that's the key for everything, isn't it?

>> Anyway, since I don't have these types of flash readily available, I
>> don't even use these options :) And apparently, one of the biggest
>> contributors for mtd-utils, Mike Frysinger, doesn't use region_info
>> either...
>
> i dont think any of the flashes (parallel nor, spi nor, nand, etc...)
> included region_info. =A0that's why the func print_region_info() sets up
> a dummy region_info struct that describes the entire flash before
> calling print_region_map().

I don't know much about this, but what's the feature for if no one uses it?

Brian
