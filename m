Received: from smtp.nokia.com ([131.228.20.173] helo=mgw-ext14.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HkK9j-000330-Pd
	for linux-mtd@lists.infradead.org; Sat, 05 May 2007 09:18:37 -0400
Subject: Re: [PATCH] UBI: dereference after kfree in create_vtbl
From: Artem Bityutskiy <dedekind@infradead.org>
To: Satyam Sharma <satyam.sharma@gmail.com>
In-Reply-To: <a781481a0705050526r13445d60j737a6c2015402dcc@mail.gmail.com>
References: <463A04A5.5030103@gmail.com>
	<a781481a0705041442h37453fb6k26d04eb5356e9dc0@mail.gmail.com>
	<463BC019.40305@gmail.com>
	<a781481a0705042055u5e9ba060w95da83b0fbeff76a@mail.gmail.com>
	<1178351711.3659.54.camel@sauron>
	<a781481a0705050526r13445d60j737a6c2015402dcc@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Sat, 05 May 2007 16:18:23 +0300
Message-Id: <1178371103.3659.115.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: Florin Malita <fmalita@gmail.com>, linux-mtd@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2007-05-05 at 17:56 +0530, Satyam Sharma wrote:
> > And it is fine to use list_add_tail() directly in vtbl.c. Will be fixed=
.
> Ah, good to know that, but please keep list_add_tail (or whatever is
> the implementation abstraction of the various ubi_scan_info lists)
> local to scan.c -- you could expose a version of ubi_scan_add_to_list
> that does not do kmalloc through scan.h and use that in vtbl.c. That
> way you won't lose those debug printk's when adding an eraseblock to a
> list, for example, and it's always much cleaner not exposing an
> object's implementation innards to others.

It's error path and that print is not really needed. We'll see other
complaints in that case. And this is _the only_ place outside scan.c, so
it makes sense to use list_add_tail(). We do not really need to hide
this behind some other call (ubi_scan_add_to_list())

>  Physical eraseblocks are allocated in ubi_scan_add_to_list
> (which shouldn't be doing that)
Yes, per-PEB scanning information is allocated in ubi_scan_add_to_list()
and ubi_scan_add_to_used(). I do not see why it shouldn't be doing that.

>  and ubi_scan_add_used (which is a maze)=20
It actually is rather complex because it does a rather complex thing.
But any patch/idea to make it simpler is welcome.

> and freed pretty much all over the place
It is only freed in ubi_scan_destroy_si(). Yes, there is one exception
in create_vtbl, but this is because I did not want to introduce any
special version of ubi_scan_add_used().

It does not hurt at all that we do one extra allocation, because it is
called _only_ 2 times (once for each volume table copy).

>  (because we allocate
> new seb's for ourselves to add to the lists, we need to go about
> kfree'ing all of them when destroying a ubi_scan_destroy_si too, for
> example -- perhaps this driver needs to be told about krefs).

Sorry. not sure what you mean. They are allocated in 2 places, and freed
in one, with one exception in vtbl_create() which does not matter much.

>  So it
> makes life easier if you know there's only one place when/where an
> object is born,
May be it is, but I have 2 places and do not see any problem.

>  if you know that it'll remain alive as long as you
> need it and have a reference on it, and if you destroy it a known
> single time/location too.
I have 1 destroy location. And one exception where I allocate it
temporarily and destroy in the same function. And it is done only 2
times and only if one attaches un-formatted flash.

>  I wish I could be more specific than this,
> but I've only spent a few hours with ubi :-)
Thanks for your analysis, it would be helpful if more people did this.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
