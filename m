Received: from smtp.nokia.com ([131.228.20.172] helo=mgw-ext13.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Iu38g-0000Wk-4X
	for linux-mtd@lists.infradead.org; Mon, 19 Nov 2007 04:42:04 -0500
Subject: Re: Yet Another UBI Question
From: Artem Bityutskiy <dedekind@infradead.org>
To: Vinit Agnihotri <vinit.agnihotri@gmail.com>
In-Reply-To: <9b52d64c0711190124p6730356ep3b0c7a381863a905@mail.gmail.com>
References: <B1EDF20A6EAAD74EA65E46F774F1784502B64384@orsmsx413.amr.corp.intel.com>
	<B1EDF20A6EAAD74EA65E46F774F1784502B9D207@orsmsx413.amr.corp.intel.com>
	<9b52d64c0711190124p6730356ep3b0c7a381863a905@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Mon, 19 Nov 2007 11:41:05 +0200
Message-Id: <1195465265.1119.24.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2007-11-19 at 14:54 +0530, Vinit Agnihotri wrote:
> Hi,
> As a part of work I have work with UBI & character drivers i.e. cdev.c in=
 UBI.
> Can we think of implementing block device drivers instead of cdev to
> implement volume?
> That way we'll not be needing any block emulation layer on top of
> volume cdev & user will be able to
> put any file system on top of it.
> Will it complicate volume management or wear levelling anyway????

Sorry, not sure what you mean. UBI character devices represent UBI
volumes, they give you a possibility to update volumes, to read them, to
fetch different kind of information. So we need them.

An UBI volume is not a block device
(http://www.linux-mtd.infradead.org/faq/ubi.html#L_ext2_over_ubi)

You do have to write quite complex layer of code to implement FTL on top
of UBI. Once you've done this, just expose the resulting block devices
as /dev/ubiblock0 block device nodes. This is how I see it.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
