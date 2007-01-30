Received: from smtp.nokia.com ([131.228.20.172] helo=mgw-ext13.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HByDj-00027C-0R
	for linux-mtd@lists.infradead.org; Tue, 30 Jan 2007 14:00:45 -0500
Subject: Re: [MTD] UBI: Per volume update marker
From: Artem Bityutskiy <dedekind@infradead.org>
To: Alexander Schmidt <alexs@linux.vnet.ibm.com>
In-Reply-To: <200701291736.01006.alexs@linux.vnet.ibm.com>
References: <200701241019.27470.alexs@linux.vnet.ibm.com>
	<200701291147.10111.alexs@linux.vnet.ibm.com>
	<1170075745.9477.73.camel@sauron>
	<200701291736.01006.alexs@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Date: Tue, 30 Jan 2007 21:00:20 +0200
Message-Id: <1170183620.9477.157.camel@sauron>
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

I've just committed a patch which refines the semantics of the
'corrupted' flag. As I know we are going to commit your per-volume
update patch, I changed some things which otherwise maybe forgotten
correspondingly. I introduces upd_marker flag ro some data structures.
It is always 0 now, but will be used after your patch is in the
repository. I have also fixed comments assuming the per-volume update
patch is also there. Just because otherwise many of them may have been
forgotten.

I've run some tests from ubi-utils - they work. Please, send your patch
on top of my changes. I think they may even help you.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
