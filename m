Received: from mail-ey0-f177.google.com ([209.85.215.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rlpk5-00021g-8M
 for linux-mtd@lists.infradead.org; Fri, 13 Jan 2012 22:37:02 +0000
Received: by eaaa13 with SMTP id a13so393941eaa.36
 for <linux-mtd@lists.infradead.org>; Fri, 13 Jan 2012 14:36:59 -0800 (PST)
Subject: Re: [PATCH v3 0/6] NAND BBM + BBT updates
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Date: Sat, 14 Jan 2012 00:36:55 +0200
In-Reply-To: <4F0EA32E.20500@linutronix.de>
References: <1326140612-26323-1-git-send-email-computersforpeace@gmail.com>
 <4F0C086A.5070608@linutronix.de> <1326320928.2338.37.camel@koala>
 <4F0EA32E.20500@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1326494218.2258.36.camel@koala>
Mime-Version: 1.0
Cc: Dan Carpenter <error27@gmail.com>, Barry Song <21cnbao@gmail.com>,
 Nicolas Ferre <nicolas.ferre@atmel.com>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Adrian Hunter <adrian.hunter@intel.com>, Gabor Juhos <juhosg@openwrt.org>,
 linux-mtd@lists.infradead.org, Jonas Gorski <jonas.gorski@gmail.com>,
 Jamie Iles <jamie@jamieiles.com>, Ivan Djelic <ivan.djelic@parrot.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 David Woodhouse <David.Woodhouse@intel.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Kevin Cernekee <cernekee@gmail.com>, Kulikov Vasiliy <segooon@gmail.com>,
 Jim Quinlan <jim2101024@gmail.com>, Andres Salomon <dilinger@queued.net>,
 Axel Lin <axel.lin@gmail.com>, Anatolij Gustschin <agust@denx.de>,
 Mike Frysinger <vapier@gentoo.org>, Arnd Bergmann <arnd@arndb.de>,
 Lei Wen <leiwen@marvell.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Artem Bityutskiy <artem.bityutskiy@intel.com>,
 Florian Fainelli <florian@openwrt.org>, Peter Wippich <pewi@gw-instruments.de>,
 Matthieu CASTET <matthieu.castet@parrot.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 Wolfram Sang <w.sang@pengutronix.de>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>, Joe Perches <joe@perches.com>,
 Guillaume LECERF <glecerf@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Roman Tereshonkov <roman.tereshonkov@nokia.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2012-01-12 at 10:09 +0100, Sebastian Andrzej Siewior wrote:
> On 01/11/2012 11:28 PM, Artem Bityutskiy wrote:
> > On Tue, 2012-01-10 at 10:44 +0100, Sebastian Andrzej Siewior wrote:
> >> and I am still not convinced that it is a good idea to provide one
> >> information in two places. It seems to be redundant. If there are other
> >> people supporting this, I am not in your way.
> >
> > NANDs become less and less reliable - they suffer from all kinds of read
> > and write disturb issues, unstable bits, etc. Do you trust MTD's
> > on-flash BBT which was created for the old reliable flashes? I don't
> > really trust it. I have a feeling that it is very real to have the BBT
> > corrupted because of read/write disturb - we read it rarely.
> >
> > In my view, OOB BB markers is the primary, reliable, and simple
> > mechanism. And BBT is just an additional optimization to speed up system
> > startup.
> 
> so the OOB array is by design more reliable than the data area?

I think so, because it is distributed, and it is historically the way
blocks had been marked as bad, and I thing vendors make sure this
mechanism works.

>  So the
> "less reliable" part of NAND does not apply to OOB, right?

My idea is that when all the bad block information is in one place, and
this place becomes corrupted for whatever reasons - we are in a big
trouble.

And then I make an argument that modern NANDs tend to be unreliable and
start bit-flipping when you do I/O on adjacent eraseblocks. And because
the BBT is very static and MTD does not refresh it very often, it may
become corrupted.

But again, I did not make experiments.

Also, I think Brians arguments about bootloaders supporting OOB bad
block markers well and BBM not very well is rather strong.

>  Because I
> was thinking about putting in UBI and deal with it there sice it should
> not lose data.

:-) BTW, with current unresolved unstable bits problem I do not
recommend to use UBI/UBIFS if you need high power cut tolerance.

Anyway, would you recap why you are opposed to Brian's idea?

> > I guess we also need to read oob before writing it when we are marking a
> > block as bad - just in case it is already marked as bad in OOB.
> 
> why should it been marked bad and we as the system aka do one that made
> the order do not know about it?

Sorry, did not understand the question. As I explained, I _think_ the SW
I am aware of will be fine. Let's take the ubiformat tool.

1. ubiformat erases PEB 7
2. ubiformat gets I/O errors.
3. ubiformat decides to mark the PEB 7 as bad
4. We get a power cut after we have put the BB marker to the OOB, but
before we have updated the BBT.
5. We reboot, we run ubiformat again.
6. MTD reports that PEB 7 is good.
7. ubiformat erases PEB 7
8. ubiformat gets I/O error, and marks PEB as bad.

Similar in UBI.

1. UBI writes to PEB 9 and gets an I/O error.
2. UBI recovers data from PEB 9 to PEB 137
3. UBI marks PEB 9 as bad and we have a power cut
4. After the reboot UBI sees PEB 9 as good, but it will recognize it as
old, because there is a newer version in PEB 137.
5. UBI erases PEB 9. This may fail, or may succeed. Assume the latter.
6. Later UBI writes data to PEB 9, gets I/O error, and marks it as bad.

>  It would make sense to verify OOB vs
> BBT during boot-up. So we read BBT and would then sync the content with
> OOB async so we don't block the boot process.

Well, yes, we can have lazy checking, I guess, I am just not sure it is
necessary to complicate things.

> > Comments? If this does not make sense - I have a good excuse - it is
> > late and I am very sleepy :-)
> 
> Do we lose the BBT table completely or just a few entries? If it is
> just a matter of an entry or two what is the worst thing that can
> happen? We run into the bad block again and mark it (again).

I do not remember, but just glanced to the code and I see that BBT is
not protected by CRC at all. So we only rely on ECC protection, which is
not good enough to detect many-bit corruptions. But in most cases it
will detect the corruption, so we loose whole NAND page of bad block
data. But there is the second copy, and to lose the data completely we
need to have the same NAND page corrupted in the second copy. But
current code is not very smart in recovering, it will require the second
copy to be completely ucorrupted to recover the first copy.

Artem.
