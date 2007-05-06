Received: from smtp.nokia.com ([131.228.20.173] helo=mgw-ext14.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HkfL4-00055v-Gi
	for linux-mtd@lists.infradead.org; Sun, 06 May 2007 07:55:44 -0400
Subject: Re: UBI: Can I boot with an UBI volume holding a root file system?
From: Artem Bityutskiy <dedekind@infradead.org>
To: John Smith <john.smith@arrows.demon.co.uk>
In-Reply-To: <loom.20070506T124743-262@post.gmane.org>
References: <Pine.LNX.4.33.0705042323250.30567-100000@arrows.demon.co.uk>
	<1178374139.3659.150.camel@sauron>
	<loom.20070506T124743-262@post.gmane.org>
Content-Type: text/plain; charset=utf-8
Date: Sun, 06 May 2007 14:55:35 +0300
Message-Id: <1178452535.3708.3.camel@sauron>
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

On Sun, 2007-05-06 at 11:25 +0000, John Smith wrote:
> I have not done anything explicit about alignment. Have I just been lucky=
=20
> because my NAND device works in pages of 512 bytes? The squashfs block si=
ze is=20
> currently 65536 bytes, though may be the word block is describing a diffe=
rent=20
> concept. Perhaps it would be best to make the squashfs block size the sam=
e size=20
> as the UBI logical erase block size.=20

Yeah, you probably do not need alignment. mtdblock emulates 512-byte
block device, and since you have NAND, you have 512-bytes-aligned
logical eraseblocks, so everything is fine. But you would need to
specify 512-byte alignment if you had NOR flash, for example.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
