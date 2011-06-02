Received: from mail-vw0-f49.google.com ([209.85.212.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QRzY0-00083B-Nx
	for linux-mtd@lists.infradead.org; Thu, 02 Jun 2011 04:30:24 +0000
Received: by vws8 with SMTP id 8so507303vws.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 01 Jun 2011 21:30:15 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1306914686.4405.53.camel@localhost>
References: <BANLkTik+35hH5ADOGJ+qXtVJjtPd_AKz3g@mail.gmail.com>
	<BANLkTin9hvdNCMeVRSj806R19obN_91v5w@mail.gmail.com>
	<BANLkTinyQ1hoRDzJ8QKNZYP1m8X+AyPUGQ@mail.gmail.com>
	<BANLkTim+sNbXG3yk_DGZk4=+0Za+gb65BA@mail.gmail.com>
	<BANLkTimyNmXpKeCP3oHwx1SV2gdb4r7oNg@mail.gmail.com>
	<1306914686.4405.53.camel@localhost>
Date: Thu, 2 Jun 2011 00:30:15 -0400
Message-ID: <BANLkTi=ATYnYKrRvZLyFPxfbW0_RVwTROA@mail.gmail.com>
Subject: Re: ubifs_decompress: cannot decompress ...
From: "Matthew L. Creech" <mlcreech@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: Ben Gardiner <bengardiner@nanometrics.ca>,
	MTD list <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jun 1, 2011 at 3:51 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
>
> How this happens? What do you do? Does this happen after mount when you
> first read your data? Or this happens at some point while you stress
> testing your system? Or this happens after a power cut?
>

So far there's no discernable pattern.  Most of the failed units are
returns from the field, so we don't know what kind of conditions
they've been placed in.  Some are from our test department, but we
haven't found anything that might "trigger" the problem in any way.

The device works fine for some period of time (usually weeks /
months), then we get complaints about various problems.  The reported
symptoms eventually come down to one of these UBIFS errors.  Depending
on the region which happens to go bad, it can result in breakage of a
minor feature (because a file we try to read/write after mount
triggers the error), all the way up to a completely non-functional
device.  I'm not sure if we've ever seen it fail to mount altogether
(I'll check into that), but we've had several cases in which U-Boot
couldn't read the kernel image from UBIFS, so the device wouldn't boot
Linux at all.

Power cuts are probably not common, though.  We have to expect them in
the product of course, but practically speaking, our service guy
assures me that a couple of the bad units he shipped me had stable
power and were rarely/never rebooted.  But I can't rule it out with
certainty.

Aside from that, it's just normal operation.  If the usage pattern
matters, the only files ever written to in the persistent (UBIFS)
filesystem are SQLite databases.  It's generally light usage, logging
a variety of measurements once every 5 minutes.  I've tried
stress-testing by running non-stop SQLite operations, recreating the
normal usage pattern but with a _much_ higher frequency of writes than
normal.  It didn't seem to help reproduce the error - we've yet to
succeed in making this problem happen under controlled conditions.

As for this specific error (ubifs_decompress): tomorrow I'll try to
gather & post additional log data for this device.  Thanks!

-- 
Matthew L. Creech
