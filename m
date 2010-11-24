Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PLG6D-0008Vq-4u
	for linux-mtd@lists.infradead.org; Wed, 24 Nov 2010 14:13:30 +0000
Received: by bwz5 with SMTP id 5so8505778bwz.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 24 Nov 2010 06:13:26 -0800 (PST)
Subject: Re: Suggested patch: reset errno after isatty()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ketil Froyn <ketil@froyn.name>
In-Reply-To: <AANLkTinzqwsEFoG+Z0S0ep7JN3p4jHugkHhN-J19Y3cn@mail.gmail.com>
References: <AANLkTimwumfui-_T1ScDYwMLKbNh1ia-SDMUg56wTfN5@mail.gmail.com>
	<4CD11C03.3090207@parrot.com>
	<AANLkTimfxjrtV4eks5tK68h6TQ20soib+6gaTC+QyB4a@mail.gmail.com>
	<AANLkTinSj2vAJJjeSxF-rvq08OVsnw3YcpRSpuOfv9pQ@mail.gmail.com>
	<AANLkTikQtNwsPkJSkmpmC=kMZpmdqHDW0HROeUBNDOEi@mail.gmail.com>
	<1289646433.2218.22.camel@localhost>
	<1289649338.2218.42.camel@localhost>
	<AANLkTink+0WvCmQWwd4+Vf8TETjR5-6BsGU=a071Rk0+@mail.gmail.com>
	<AANLkTim7TT8ydMiSX8B2ehJP2kQ6jtGSnEZU98AZjWUf@mail.gmail.com>
	<AANLkTimHCBNCcc3suXv4kJ4+MXUSf5Tw2r876A7tqtoL@mail.gmail.com>
	<AANLkTinzqwsEFoG+Z0S0ep7JN3p4jHugkHhN-J19Y3cn@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 24 Nov 2010 16:12:39 +0200
Message-ID: <1290607959.2793.11.camel@localhost>
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

On Wed, 2010-11-24 at 10:59 +0100, Ketil Froyn wrote:
> On Wed, Nov 24, 2010 at 8:50 AM, Mike Frysinger <vapier.adi@gmail.com> wrote:
> > On Thu, Nov 18, 2010 at 06:13, Ketil Froyn wrote:
> >
> > so you'll want to dive into the ioctls to see what isnt working right.
> >  strace is your friend.
> 
> Thanks for the kick. I had tried that, but for some reason strace was
> dying with the error "syscall: unknown syscall trap 0xe8bd8008". A
> little more searching now led me to this patch, which fixed it for me:
> 
> http://www.fluff.org/ben/patches/strace/strace-fix-arm-bad-syscall.patch
> 
> Anyway, here's the full output:

So it dies very soon. You should easily find the line of code where this
happens with gdb. Just compile nanddump with -g -O0

But I guess we are calling some new ioctl on the system which does not
support it, and do not fall-back to the new ioctl. We tried to be
careful about this, though.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
