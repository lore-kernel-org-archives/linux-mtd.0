Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L2LcC-0004bw-9F
	for linux-mtd@lists.infradead.org; Tue, 18 Nov 2008 08:07:16 +0000
Subject: Re: MTD/flash perfomance statistics
From: Artem Bityutskiy <dedekind@infradead.org>
To: Bruce_Leonard@selinc.com
In-Reply-To: <OFE19505F1.464981E8-ON88257504.0081B596-88257504.00822E2D@selinc.com>
References: <OFE19505F1.464981E8-ON88257504.0081B596-88257504.00822E2D@selinc.com>
Content-Type: text/plain; charset=utf-8
Date: Tue, 18 Nov 2008 10:05:09 +0200
Message-Id: <1226995509.16925.115.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2008-11-17 at 15:42 -0800, Bruce_Leonard@selinc.com wrote:
> "They appear to be going the wrong way.  We're looking for runtime=20
> diagnostic-y type of things (i.e. Number of writes to the flash, number o=
f=20
> bad blocks, statistics from the wear leveler to see how the wear leveling=
=20
> is going, etc.)  Things that don't take a lot of CPU time to do, like=20
> counters, that we can use to give us information on what a customer's box=
=20
> may or may not be doing in the field.  A ready example that comes to mind=
=20
> is ethernet statistics, bytes/packets sent/recieved, error counts, etc. O=
r=20
> if you want a storage analog, things like you would see in=20
> /sys/block/hda/stat but adapted to make sense in Flash storage."

I see. No, we do not really provide this statistics, just because no one
needed this. Please, give me the list of what exactly you would like to
know, and I will try to implement this for you.

> BTW, we're happily up and running UBIFS on a 2GiB flash part with no=20
> errors.  Mount times are pretty resonable.  I don't have current times=20
> because I've been about three kernel versions ahead of everyone else so=20
> the stuff they've all been using until recently didn't have some of the=20
> speed improvments.  If I get the time (and remember to do it ;)  ) I'll=20
> try to float some numbers out there.

Cool, of course numbers and hardware information (CPU, flash type, I/O
speed) is appreciated.

> Thanks for all the help over the last several months getting my stuff=20
> going.  It's been great working with you.

No problem.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
