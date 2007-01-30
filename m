Received: from smtp.nokia.com ([131.228.20.172] helo=mgw-ext13.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HBtbl-0008Se-9E
	for linux-mtd@lists.infradead.org; Tue, 30 Jan 2007 09:05:16 -0500
Subject: Re: [MTD] UBI: Per volume update marker
From: Artem Bityutskiy <dedekind@infradead.org>
To: Alexander Schmidt <alexs@linux.vnet.ibm.com>
In-Reply-To: <200701291736.01006.alexs@linux.vnet.ibm.com>
References: <200701241019.27470.alexs@linux.vnet.ibm.com>
	<200701291147.10111.alexs@linux.vnet.ibm.com>
	<1170075745.9477.73.camel@sauron>
	<200701291736.01006.alexs@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Date: Tue, 30 Jan 2007 15:44:41 +0200
Message-Id: <1170164681.9477.126.camel@sauron>
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

On Mon, 2007-01-29 at 17:36 +0100, Alexander Schmidt wrote:
> I removed the function from vmt unit and moved the code for checking if t=
he
> update marker already has the given value to the vtbl unit.

There is also an ubi_upd_clean() function which becomes unneeded with
your patch - please, do not forget to get rid of it.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
