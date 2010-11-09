Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PFkhq-0004vD-Nh
	for linux-mtd@lists.infradead.org; Tue, 09 Nov 2010 09:41:36 +0000
Received: by wwe15 with SMTP id 15so7809800wwe.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 09 Nov 2010 01:41:31 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <AANLkTikQtNwsPkJSkmpmC=kMZpmdqHDW0HROeUBNDOEi@mail.gmail.com>
References: <AANLkTimwumfui-_T1ScDYwMLKbNh1ia-SDMUg56wTfN5@mail.gmail.com>
	<4CD11C03.3090207@parrot.com>
	<AANLkTimfxjrtV4eks5tK68h6TQ20soib+6gaTC+QyB4a@mail.gmail.com>
	<AANLkTinSj2vAJJjeSxF-rvq08OVsnw3YcpRSpuOfv9pQ@mail.gmail.com>
	<AANLkTikQtNwsPkJSkmpmC=kMZpmdqHDW0HROeUBNDOEi@mail.gmail.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Tue, 9 Nov 2010 04:40:04 -0500
Message-ID: <AANLkTikW9=FUvM9CeqABUdB098PMeC9s3+94V2Ae=LiL@mail.gmail.com>
Subject: Re: Suggested patch: reset errno after isatty()
To: Ketil Froyn <ketil@froyn.name>
Content-Type: text/plain; charset=UTF-8
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Matthieu CASTET <matthieu.castet@parrot.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Nov 7, 2010 at 17:36, Ketil Froyn wrote:
> On Sat, Nov 6, 2010 at 9:54 AM, Mike Frysinger wrote:
>> doesnt libmtd provide read functions already ?
>
> I'm not familiar with libmtd, but the latest release (v1.4.1) just did
> it itself with pread, and since that failed I fixed it.
>
> The new code in the repo, which appears to use libmtd, didn't work for
> me, and the fix appeared more complicated. My patch is for v1.4.1,
> which should also make it easier to integrate for package maintainers,
> if they wish, pending a working rewrite.

the focus is on the master branch.  stable fixes should largely be
back ports, not a complete fork.
-mike
