Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QZstA-0007cg-B8
	for linux-mtd@lists.infradead.org; Thu, 23 Jun 2011 23:00:46 +0000
Received: by wyf23 with SMTP id 23so2012292wyf.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 23 Jun 2011 16:00:38 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <BANLkTimTu1ORjEvtJ7XSCCqwzDbid957Aw@mail.gmail.com>
References: <BANLkTi=-25MExYfuB-ANK4ceh3gWy+BqCg@mail.gmail.com>
	<1308761363-16512-1-git-send-email-computersforpeace@gmail.com>
	<1308841377.23597.10.camel@sauron>
	<1308841503.23597.12.camel@sauron>
	<BANLkTimTu1ORjEvtJ7XSCCqwzDbid957Aw@mail.gmail.com>
Date: Thu, 23 Jun 2011 16:00:37 -0700
Message-ID: <BANLkTi=cUqQcQzeinQaqh_VBFtfnfkVinw@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] prepare new nanddump options, defaults
From: Brian Norris <computersforpeace@gmail.com>
To: Mike Frysinger <vapier.adi@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jun 23, 2011 at 8:52 AM, Mike Frysinger <vapier.adi@gmail.com> wrot=
e:
> On Thu, Jun 23, 2011 at 11:04, Artem Bityutskiy wrote:
>> And speaking about released, should we do a new one?

Yes, I think so. Then I can eliminate all those warnings and finish my chan=
ges!

>> If you see that
>> some utils should have a version increased - feel free to do so.

I think the nanddump, mtdinfo, and flash_{lock, unlock} tools have had
plenty of updates to warrant a bump...but flash_{lock, unlock} doesn't
have a version number (neither do many of the utils). I'll send a
patch for bumping soon...then should the release tag come afterward?

>> But
>> even better we could make the version numbers to be the same as release
>> number, then this process would be more automated and version would make
>> some sense...
>
> the version isnt encoded anywhere. =A0so if you started using something
> like the kernel where the VERSION was in the Makefile, we could use
> that to create a header file which all the utils would include.
> -mike
>

I like Mike's idea on the VERSION thing. Unfortunately, few utils
display any version number at all, and of the ones that do, we have a
random "2.1.0" from flash_erase. We wouldn't want to have a decreased
version number...so do we jump to mtd-utils v2.1 and make everything
the same version? Or even v3.0, just for fun?

If we're going for 2.1 (or some other similarly large jump), maybe we
should do the following:
1) increment some individual version numbers (nanddump and mtdinfo only?)
2) make a mtd-utils release 1.4.6
3) take care of all the "feature-removal-schedule" stuff...
4) put the VERSION in the Makefile (still version 1.4.6), have it
generate a header
5) include that header in common.h
6) add a stub version function in common.h that would utilize this
basic info to supply a "--version" option to all utilities that don't
have one (at least, as far as reasonable...)
7) release another mtd-utils, jumping to v2.x (only needing to edit
Makefile for version increments!)

How does this sound?

Brian
