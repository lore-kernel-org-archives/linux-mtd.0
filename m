Received: from mail-qy0-f177.google.com ([209.85.216.177])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PFDqJ-0008AM-09
	for linux-mtd@lists.infradead.org; Sun, 07 Nov 2010 22:36:07 +0000
Received: by qyk9 with SMTP id 9so40412qyk.15
	for <linux-mtd@lists.infradead.org>;
	Sun, 07 Nov 2010 14:36:05 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <AANLkTinSj2vAJJjeSxF-rvq08OVsnw3YcpRSpuOfv9pQ@mail.gmail.com>
References: <AANLkTimwumfui-_T1ScDYwMLKbNh1ia-SDMUg56wTfN5@mail.gmail.com>
	<4CD11C03.3090207@parrot.com>
	<AANLkTimfxjrtV4eks5tK68h6TQ20soib+6gaTC+QyB4a@mail.gmail.com>
	<AANLkTinSj2vAJJjeSxF-rvq08OVsnw3YcpRSpuOfv9pQ@mail.gmail.com>
Date: Sun, 7 Nov 2010 23:36:04 +0100
Message-ID: <AANLkTikQtNwsPkJSkmpmC=kMZpmdqHDW0HROeUBNDOEi@mail.gmail.com>
Subject: Re: Suggested patch: reset errno after isatty()
From: Ketil Froyn <ketil@froyn.name>
To: Mike Frysinger <vapier.adi@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
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

On Sat, Nov 6, 2010 at 9:54 AM, Mike Frysinger <vapier.adi@gmail.com> wrote:
>
> doesnt libmtd provide read functions already ?
> -mike

I'm not familiar with libmtd, but the latest release (v1.4.1) just did
it itself with pread, and since that failed I fixed it.

The new code in the repo, which appears to use libmtd, didn't work for
me, and the fix appeared more complicated. My patch is for v1.4.1,
which should also make it easier to integrate for package maintainers,
if they wish, pending a working rewrite.

Ketil
