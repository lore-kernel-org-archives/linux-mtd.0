Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qp1zp-0003QN-6u
	for linux-mtd@lists.infradead.org; Thu, 04 Aug 2011 17:46:14 +0000
Received: by wyg19 with SMTP id 19so1375324wyg.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 04 Aug 2011 10:46:10 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <201107260921.44512.brian.foster@maxim-ic.com>
References: <201107251148.51262.brian.foster@maxim-ic.com>
	<CAN8TOE8Uk09DPJ_OYXh4RjnKkXugEFLpZQ+hrA4Gw4oK2cQYOw@mail.gmail.com>
	<201107260921.44512.brian.foster@maxim-ic.com>
Date: Thu, 4 Aug 2011 10:46:10 -0700
Message-ID: <CAN8TOE847yECw3zeh42tf=6mC73O33Lr7Lzwpi0FrT-rB9ZYmg@mail.gmail.com>
Subject: Re: [BUG] mtdinfo -a: Tries to open NULL pointer for NOR with
	Eraseblock Regions
From: Brian Norris <computersforpeace@gmail.com>
To: Brian Foster <brian.foster@maxim-ic.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Mike Frysinger <vapier@gentoo.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jul 26, 2011 at 12:21 AM, Brian Foster
<brian.foster@maxim-ic.com> wrote:
> =A0The list was easy to find; what I could not find was
> =A0any indication of how/where bugs should be reported.

Hmm, it seems like maybe the closest info is hidden away at:
http://www.linux-mtd.infradead.org/doc/ubifs.html#L_how_send_bugreport
But much of this refers to UBIFS-specific stuff. Perhaps the site
should be updated.

>> It seems that the basic issue we need to solve is how to find the
>> correct file devfs/udev path =A0[...]
>
> =A0As an FYI, in our current embedded systems (plural),
> =A0a static /dev is used (no udev, mdev, &tc). =A0Hence,
> =A0udev (and I assume also, devfs) path may not work
> =A0in such an environment?

Now that I think about it, this doesn't seem like a very reliable
solution. Too much user-space variability.

>> Also, is "region_info" a potential candidate for exporting via sysfs?
>> That would make this support easier to include in libmtd.
>
> =A0I don't know if it is exportable or not, but I concur
> =A0this seems like a possible/plausible solution.

Even if we do this (which seems like a lot of info), it would only
apply to the newest kernels, where mtd-utils are *supposed* to be
backwards-compatible if possible, where they can fall back to old
methods if needed...

Anyway, since I don't have these types of flash readily available, I
don't even use these options :) And apparently, one of the biggest
contributors for mtd-utils, Mike Frysinger, doesn't use region_info
either...

Since there's been no response from anyone else for a while, I'm
sending a workaround patch for now that will kill the error and
disable region_info in `mtdinfo -a'.

Brian
