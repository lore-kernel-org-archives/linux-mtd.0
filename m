Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bjWTy-0005zl-JV
 for linux-mtd@lists.infradead.org; Mon, 12 Sep 2016 19:01:32 +0000
Date: Mon, 12 Sep 2016 21:01:08 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Scott Wood <oss@buserror.net>
Cc: Matt Weber <matthew.weber@rockwellcollins.com>, Ronak Desai
 <ronak.desai@rockwellcollins.com>, linux-mtd@lists.infradead.org,
 prabhakar.kushwaha@nxp.com, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>, Marc Gonzalez
 <marc_gonzalez@sigmadesigns.com>
Subject: Re: [PATCH] fsl_ifc_nand: Added random output enable cmd
Message-ID: <20160912210108.1358fde0@bbrezillon>
In-Reply-To: <1473445841.30217.175.camel@buserror.net>
References: <1473189197-45191-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20160906215003.1b6eb095@bbrezillon>
 <1473228233.30217.32.camel@buserror.net>
 <20160907092257.77915c23@bbrezillon>
 <1473290339.30217.78.camel@buserror.net>
 <20160908075708.4014aef3@bbrezillon>
 <1473390010.30217.137.camel@buserror.net>
 <20160909094037.263f362d@bbrezillon>
 <1473445841.30217.175.camel@buserror.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 09 Sep 2016 13:30:41 -0500
Scott Wood <oss@buserror.net> wrote:

> On Fri, 2016-09-09 at 09:40 +0200, Boris Brezillon wrote:
> > > >  =20
>=20
>=20
> > On Thu, 08 Sep 2016 22:00:10 -0500
> > Scott Wood <oss@buserror.net> wrote:
> >  =20
> > >=20
> > > On Thu, 2016-09-08 at 07:57 +0200, Boris Brezillon wrote: =20
> > > >=20
> > > > On Wed, 07 Sep 2016 18:18:59 -0500
> > > > Scott Wood <oss@buserror.net> wrote:
> > > >  =20
> > > > >=20
> > > > > A generic "send_op" might
> > > > > work, though I'm curious about the details of how nand_op gets
> > > > > encoded,
> > > > > and am
> > > > > worried that it might still result in NAND drivers interpreting
> > > > > specific
> > > > > commands rather than passing things through in a generic way (and=
 then
> > > > > things
> > > > > can break if common code sends something new).=C2=A0=C2=A0 =20
> > > > If drivers end up doing that, this means we failed providing an
> > > > interface that is suitable for everyone.
> > > > But, from what I've seen in other drivers, it's usually just about
> > > > setting the first and second cmd cyles, specifying the address cycl=
es
> > > > (and the number of cycles) and then the amount of data to transfer +
> > > > the direction.=C2=A0=C2=A0 =20
> > > Timing is one area that could be problematic. =C2=A0This patch is an =
example of
> > > a
> > > situation where different timing was used for a particular command. =
=C2=A0It
> > > seems
> > > that RNDOUT doesn't use the R/B pin -- how would a generic send_op
> > > implementation know whether it can use R/B to determine when to start=
 the
> > > I/O
> > > transfer? =20
> > Well, the plan was to specify in the nand operation whether it should
> > wait for the chip to be ready or not. =20
>=20
> OK. =C2=A0Is there a more detailed description of send_op ready yet?

I started something more than a year ago [1], but did not find the time
to finish the implementation. The plan was to rework the entire NAND
framework, not only the way we send NAND operations/commands, so this
branch contains much more than just the ->send_op() concept. But you
can see the nand_operation struct here [2].

Now, I realize that this attempt to rework the whole framework at once
was not doable, but I can probably provide a PoC introducing the
->send_op() method and nand_operation struct, and implement
->send_op() in the sunxi driver.

This being said, my main concern is the introduction of yet another way
to do things. The NAND framework is already quite complex, and if we
introduce this ->send_op() method, I'd like it to completely replace
the ->cmdfunc() instead of keeping both around until all
implementations decide to switch to the new approach.

Note that a default ->send_op() based around ->cmd_ctrl()
and ->{read/write}_buf() can easily be implemented.

[1]https://github.com/bbrezillon/linux-sunxi/tree/nand-core-rework-v2
[2]https://github.com/bbrezillon/linux-sunxi/blob/nand-core-rework-v2/inclu=
de/linux/mtd/nand2.h#L41
