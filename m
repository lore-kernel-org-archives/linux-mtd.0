Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SII1s-0001ga-PC
 for linux-mtd@lists.infradead.org; Thu, 12 Apr 2012 11:17:33 +0000
Received: by bkcjk13 with SMTP id jk13so1943341bkc.36
 for <linux-mtd@lists.infradead.org>; Thu, 12 Apr 2012 04:17:31 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.00.1204111735530.12033@eristoteles.iwoars.net>
References: <alpine.DEB.2.00.1203291653210.912@eristoteles.iwoars.net>
 <4F748CD6.4080704@parrot.com>
 <alpine.DEB.2.00.1203301413080.10066@eristoteles.iwoars.net>
 <1333110503.5440.24.camel@sauron.fi.intel.com>
 <alpine.DEB.2.00.1203301433270.10066@eristoteles.iwoars.net>
 <1333111321.5440.29.camel@sauron.fi.intel.com>
 <alpine.DEB.2.00.1203301709080.10066@eristoteles.iwoars.net>
 <1334147205.13842.8.camel@sauron.fi.intel.com>
 <alpine.DEB.2.00.1204111514120.10181@eristoteles.iwoars.net>
 <alpine.DEB.2.00.1204111735530.12033@eristoteles.iwoars.net>
Date: Thu, 12 Apr 2012 14:17:30 +0300
Message-ID: <CAF4G-tKbm-f84+8-zcAO60jvqhrv-jG90P=2o+J6PByvfQY7Rw@mail.gmail.com>
Subject: Re: [PATCH] UBIFS: use ubi's new ubi_leb_change sync parameter
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Joel Reardon <joel@clambassador.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Joel,

let's not CC fsdevel anymore so far - we generate too much traffic there.

On Wed, Apr 11, 2012 at 6:38 PM, Joel Reardon <joel@clambassador.com> wrote=
:
> This patch fixes UBIFS to use the new sync parameter for ubi's ubi_leb_ch=
ange
> function. In the previous post, one of the calls had sync =3D 1, this is
> fixed. This, along with the ubi patch that introduces the new
> parameter, was tested using integck for both sync=3D0 and sync=3D1 in the
> tnc_commit's call to leb_change and the underlying free'd PEB was
> inspected through debug statements to ensure that it was later reallocate=
d
> for new data.

I was thinking about this again and I do not really like the patch
anymore because it
does not solve the problem.

Indeed, we have the wear-levelling subsystem which may decide at any point =
that
the contents of one of the PEBs containing keys has to be moved to a
different PEB.
It will move it and then schedule the old PEB for erasure. Your
solution does not guarantee
that this old PEB is now erased. And thus, you do not achieve what you
want to achieve.

First of all, notice, that you can work on this aspect independently
of the UBIFS part.

I guess you actually have 2 choices.

1. Flush entire erasblocks queue.
2. Implement a funtion which will flush the queue only for a specific LEB.

The first approach may be very slow, especially on NOR. Also, I've
just noticed that
ubi_sync() does not actually do this - it only calls 'mtd_sync()'. You
need to introduce a
parameter to mtd_sync() which will tell whether to only sync the MTD
device or also
flush the entire queue. This is trivial. To flush the queue, you need
to call 'ubi_wl_flush()'.

The second approach is also not too difficult to do, I think.

Basically, you add a 'int lnum' parameter to 'mtd_sync()'. Then you
add this parameter
to 'ubi_wl_flush()', and may be to 'do_work()' as well.

Then you need to make sure you have 'lnum' available in the elements
of the 'ubi->works'
list. This basically means you need to have an 'int lnum' field in
'struct ubi_work'. Probably
this means that 'schedule_work()' should also accept an 'int lnum'
argument. Does not
sound too difficult.

Then you will be able to achieve what you want by calling
'ubi_leb_change()' first, and
then 'ubi_sync(lnum)'.

Also note, after mount you also have to call 'ubi_sync(lnum)' for all
LEBs containing
the keys. This is because you may have an unclean reboot just before
you have erased
the old PEB.

So, I am sorry, but I am removing so far this patch from my tree.

What do you think?

--=20
Best Regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
