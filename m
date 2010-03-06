Received: from gw1.transmode.se ([213.115.205.20])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Nnvr6-0003xK-D3
	for linux-mtd@lists.infradead.org; Sat, 06 Mar 2010 15:23:56 +0000
In-Reply-To: <56a87efc1003051322td74992cide1ca01776c24646@mail.gmail.com>
References: <56a87efc1003041025n7d7f8d7ud740b259308fea7@mail.gmail.com>	<D47DD163F8914C69B534C8AA8FF3258F@WINXP>
	<56a87efc1003041233o8c10a1fif541dc9efee6462c@mail.gmail.com>	<56a87efc1003041401t4382d2i504b309a6c98d3d7@mail.gmail.com>
	<62cbdcd91003050156g404106a5pfdf10bb29d9ce837@mail.gmail.com>	<56a87efc1003050936j57e8d879q70855a5724fa3be9@mail.gmail.com>
	<56a87efc1003051322td74992cide1ca01776c24646@mail.gmail.com>
Subject: Re: JFFS2 errors on ppc-4xx with CFI NOR flash
To: Ryan Thompson <i@ry.ca>
Message-ID: <OF4610A640.936AF9C9-ONC12576DE.0053D1BE-C12576DE.005469DA@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Sat, 6 Mar 2010 16:22:01 +0100
MIME-Version: 1.0
Content-type: text/plain; charset=ISO-8859-15
Content-transfer-encoding: quoted-printable
Cc: massimo cirillo <maxcir@gmail.com>, linux-mtd@lists.infradead.org,
	Massimo.CIRILLO@numonyx.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


>
> I also created the attached gnuplot graph showing the time taken to
> write 128KiB files versus the filesystem utilization. Note that the
> underlying partition size is 32128KiB.
>
> In case attachments don't work on linux-mtd, the graph is also hosted=

> at http://ry.ca/clients/jffs2-128KiB.png

I am guessing the flash is busy erasing blocks so writes have to wait.
What if you pause your test when it starts to get slow for a few mins
and continue?

it is strange though that erase suspend isn't working for you. I have
no such problems and I use numonyx too, but not this exact part(don't h=
ave
part info available ATM)

>
> - R
>
> On Fri, Mar 5, 2010 at 11:36 AM, Ryan Thompson <i@ry.ca> wrote:
> > On Fri, Mar 5, 2010 at 3:56 AM, massimo cirillo <maxcir@gmail.com> =
wrote:
> >> I suppose you don't have CONFIG_MTD_XIP enabled.
> >> So in order to completely disable the suspend,
> >> please in chip_ready() function just after "case FL_ERASING:"
> >> (line 775) put the line "goto sleep;" and repeat your test.
> >> Let me know.
> >
> > By skipping the FL_ERASING case as you suggested, my test now
> > completes successfully without any INFO-or-higher kernel messages.
> >
> > However, it still takes a very long time. The initial files are
> > written out quickly (subjectively, performance seems similar to raw=

> > mtd speed). However, after 50% or so, performance begins to degrade=

> > dramatically. At 65%, a 256KiB file takes 11 sec to write. At 75%, =
20
> > sec. 90%, 38 sec. 95%, 77 sec. 99%, 121 sec. The entire test took 2=
8.4
> > minutes to go from 3%-100% on the ~32MiB partition.
> >
> > Performance seems somewhat consistent with my previous result:
> >
> >> 2010/3/4 Ryan Thompson <i@ry.ca>:
> >>> The errors continued until the filesystem actually reported 100% =
full
> >>> and my script terminated. The entire 3%-100% operation took about=
 21
> >>> minutes for <32MiB, and was definitely much slower towards the en=
d
> >>> with all the errors.
> >
> > I've done a flash_eraseall -j followed by a reboot before each run.=

> >
> > I also benchmarked the mtdblock performance without JFFS2 (also
> > getting input from urandom):
> >
> > # time dd if=3D/dev/urandom of=3D/dev/mtdblock16
> > dd: writing '/dev/mtdblock16': No space left on device
> > 64257+0 records in
> > 64256+0 records out
> > Command exited with non-zero status 1
> > real =A0 =A05m 30.17s
> > user =A0 =A00m 0.08s
> > sys =A0 =A0 1m 2.66s
> > # perl -le 'printf("bytes written =3D 0x%08x\n", 64256 * 512);'
> > bytes written =3D 0x01f60000
> > # grep modules /proc/mtd
> > mtd16: 01f60000 00020000 "modules"
> >
> > - R
> >
> [attachment "jffs2-128KiB.png" deleted by Joakim Tjernlund/Transmode]=

> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/=
