Received: from 67.111.72.2.ptr.us.xo.net ([67.111.72.2]
	helo=nonamew.ptu.promise.com)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KucSL-0001Dd-Vo
	for linux-mtd@lists.infradead.org; Tue, 28 Oct 2008 00:29:10 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: RE: JFFS2 losing dirs/files on NAND flash
Date: Mon, 27 Oct 2008 17:16:48 -0700
Message-ID: <85ABFDC4641C4847BA6088F2982EFD8F018A2549@nonamew.ptu.promise.com>
In-Reply-To: <deb0f030810271646h704ba06fvfb38a8597c971555@mail.gmail.com>
References: <d459bb380810270112i18eb2ae9q76481dab1abad2f2@mail.gmail.com><deb0f030810270804q234a82ffv57d715cfbaf736f8@mail.gmail.com><d459bb380810270846h3bb5cc51h27084884e2bcaa2a@mail.gmail.com><deb0f030810270946l3ea3ff12vc8d318c2184cdf7e@mail.gmail.com>
	<deb0f030810271646h704ba06fvfb38a8597c971555@mail.gmail.com>
From: "Lakshmi N. Sundararajan - PTU" <lakshmi.s@promise.com>
To: "Suresh Rajashekara" <suresh@mistralsolutions.com>,
	"Marco Braga" <marco.braga@gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


When you expose any electronic storage device to radiation of any kind,
then bit flips can definetely happen.

But instead I would suggest to think more on easily reproduceable
software defined methods. That will ensure one can see a problem
and ultimately a fix to the problem. Otherwise, this will be treated
as a ozone hole and none will be interested!

Thanks,
-LN


> -----Original Message-----
> From: linux-mtd-bounces@lists.infradead.org=20
> [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of=20
> Suresh Rajashekara
> Sent: Monday, October 27, 2008 4:47 PM
> To: Marco Braga
> Cc: linux-mtd@lists.infradead.org
> Subject: Re: JFFS2 losing dirs/files on NAND flash
>=20
> Hi All,
>=20
> Can this happen if the flash is exposed to X-ray/MRI machines=20
> or any electromagnetic radiation?
>=20
> Thanks in advance.
>=20
> Suresh
>=20
> On Mon, Oct 27, 2008 at 9:46 AM, Suresh R=20
> <suresh@mistralsolutions.com> wrote:
> > We could not switch to a new kernel because of our internal time=20
> > lines, but we have made some minor modifications to the=20
> application to=20
> > reduce the flash usage. This, however, does not solve the=20
> issue, but=20
> > if GC is what is causing this, we want to reduce the number=20
> of times=20
> > GC triggers.
> >
> > We had even planned for partition layout with more of RO partitions=20
> > and less of RW partitions so that we don't run in to this condition.
> > This would be ideal because, no matter what kernel you use.
> >
> > HTH,
> >
> > Suresh
> >
> > On Mon, Oct 27, 2008 at 9:16 PM, Marco Braga=20
> <marco.braga@gmail.com> wrote:
> >> Hi,
> >>
> >> and did the problem disappear when using the new kernel?=20
> How did you=20
> >> solve the problem?
> >> Thank you!
> >>
> >> Marco
> >>
> >>
> >> 2008/10/27 Suresh R <suresh@mistralsolutions.com>:
> >>> Hi,
> >>>
> >>> Even I have faced a similar issue with the JFFS2 on onenand on=20
> >>> 2.6.16-rc3. I too was not able to reproduce the issue by shutting=20
> >>> down abruptly, but it happens on our products on the field.
> >>>
> >>> I looks to me that it happens when switched off during a GC. I am=20
> >>> not sure. I was not able to prove to myself this theory.=20
> Where ever=20
> >>> I reported this issue, I was told to use a new kernel.
> >>>
> >>> Suresh
> >>>
> >>> On Mon, Oct 27, 2008 at 1:42 PM, Marco Braga=20
> <marco.braga@gmail.com> wrote:
> >>>> Hello,
> >>>>
> >>>> I am using JFFS2 on an ARM base board with a 128Mb NAND flash,=20
> >>>> kernel 2.6.22.10. Sometimes the board does not boot because a=20
> >>>> directory in /etc has disappeared after a JFFS2 error or=20
> a file is missing data.
> >>>> I'm trying to understand at what level (hardware,=20
> kernel, MTD, file
> >>>> system) it happens. The error appears when trying to access the=20
> >>>> directory or file:
> >>>>
> >>>> JFFS2 warning: (96) jffs2_do_read_inode_internal: no data nodes=20
> >>>> found for ino #65
> >>>> JFFS2 notice: (96) jffs2_do_read_inode_internal: but it has=20
> >>>> children so we fake some modes for it
> >>>> JFFS2 warning: (96) jffs2_do_read_inode_internal: no data nodes=20
> >>>> found for ino #97
> >>>> JFFS2 notice: (96) jffs2_do_read_inode_internal: but it has=20
> >>>> children so we fake some modes for it ...
> >>>>
> >>>> I've not been able to relate it to an unclean shutdown.=20
> I've tried=20
> >>>> powering off the board several times without being able=20
> to make the=20
> >>>> problem happen. Moreover I've tried a multithreaded program that=20
> >>>> opens, writes, reads and deletes several files to stress=20
> the FS and=20
> >>>> it never happened after an overnight run.
> >>>>
> >>>> Can you please help understanding the cause or the=20
> meaning of those log lines?
> >>>> Thank you!
> >>>>
> >>>> ______________________________________________________
> >>>> Linux MTD discussion mailing list
> >>>> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> >>>>
> >>>
> >>
> >
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>=20
