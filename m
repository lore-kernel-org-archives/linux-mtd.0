Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PHDx9-0002G6-5v
	for linux-mtd@lists.infradead.org; Sat, 13 Nov 2010 11:07:27 +0000
Received: by bwz5 with SMTP id 5so3948345bwz.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 13 Nov 2010 03:07:25 -0800 (PST)
Subject: Re: Suggested patch: reset errno after isatty()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ketil Froyn <ketil@froyn.name>
In-Reply-To: <AANLkTikQtNwsPkJSkmpmC=kMZpmdqHDW0HROeUBNDOEi@mail.gmail.com>
References: <AANLkTimwumfui-_T1ScDYwMLKbNh1ia-SDMUg56wTfN5@mail.gmail.com>
	<4CD11C03.3090207@parrot.com>
	<AANLkTimfxjrtV4eks5tK68h6TQ20soib+6gaTC+QyB4a@mail.gmail.com>
	<AANLkTinSj2vAJJjeSxF-rvq08OVsnw3YcpRSpuOfv9pQ@mail.gmail.com>
	<AANLkTikQtNwsPkJSkmpmC=kMZpmdqHDW0HROeUBNDOEi@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 13 Nov 2010 13:07:13 +0200
Message-ID: <1289646433.2218.22.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Matthieu CASTET <matthieu.castet@parrot.com>,
	Mike Frysinger <vapier.adi@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2010-11-07 at 23:36 +0100, Ketil Froyn wrote:
> On Sat, Nov 6, 2010 at 9:54 AM, Mike Frysinger <vapier.adi@gmail.com> wrote:
> >
> > doesnt libmtd provide read functions already ?
> > -mike
> 
> I'm not familiar with libmtd, but the latest release (v1.4.1) just did
> it itself with pread, and since that failed I fixed it.
> 
> The new code in the repo, which appears to use libmtd, didn't work for
> me, and the fix appeared more complicated. My patch is for v1.4.1,
> which should also make it easier to integrate for package maintainers,
> if they wish, pending a working rewrite.

Ketil, you have a point, 

however, Mike is right, fixes should be back-ports, or if you fix a
problem in the older release, you should fix it in the master branch as
well, or show that it does not exist in the master branch. This is the
only way it is possible to keep development under control.

We really need to be sure that whatever is fixed in older releases is
also fixed in the newer. Yes, this is more work for you but hey, I'm
also doing this stuff in my spare time.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
