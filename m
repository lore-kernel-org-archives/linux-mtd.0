Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KCF7Z-0003Ui-Db
	for linux-mtd@lists.infradead.org; Fri, 27 Jun 2008 14:40:17 +0000
Subject: Re: ubiupdatevol from pipe/compressed file
From: Artem Bityutskiy <dedekind@infradead.org>
To: Hamish Moffatt <hamish@cloud.net.au>
In-Reply-To: <20080520083957.GA29998@cloud.net.au>
References: <20080519084746.GA19325@cloud.net.au>
	<1211187241.27243.40.camel@sauron>
	<20080520083957.GA29998@cloud.net.au>
Content-Type: text/plain; charset=utf-8
Date: Fri, 27 Jun 2008 17:36:19 +0300
Message-Id: <1214577379.6573.27.camel@sauron>
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

On Tue, 2008-05-20 at 18:39 +1000, Hamish Moffatt wrote:
> On Mon, May 19, 2008 at 11:54:01AM +0300, Artem Bityutskiy wrote:
> > On Mon, 2008-05-19 at 18:47 +1000, Hamish Moffatt wrote:
> > > Alternatively allow the uncompressed file size to be specified as a
> > > ubiupdatevol parameter. In my application I can store the uncompresse=
d
> > > file size and provide it to ubiupdatevol ok.
> >=20
> > Yeah, I think it is reasonable to add one more option and pass the size
> > there. Then it could be easy to teach ubiupdatevol to read the specifie=
d
> > amount of bytes from stdin.
>=20
> Here's a patch for ubiupdatevol. It contains 3 changes;
>=20
> 1. Adds -s/--size switch;
> 2. Allows the image file to be specified as '-', meaning stdin; if used,
> the size must be specified.
>=20
> 3. In ubi_update_volume(), the code assumed that a read() requesting a
> whole LEB worth of data would always return the amount requested.
> However read() is allowed to return less than that, and does in some
> cases eg reading from a pipe. I modified it to call read() in a loop
> until it had a whole LEB worth of data.

You didn't send this N3 change, so I did this (and few more minor
tewaks) and pushed your patch, thanks.

http://git.infradead.org/mtd-utils.git?a=3Dcommit;h=3D8ec6531393464519a9d27=
20c27be200d226c21fb

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
