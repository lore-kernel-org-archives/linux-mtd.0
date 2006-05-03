Received: from ug-out-1314.google.com ([66.249.92.170])
	by canuck.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1FbIws-0000KE-Om
	for linux-mtd@lists.infradead.org; Wed, 03 May 2006 11:08:01 -0400
Received: by ug-out-1314.google.com with SMTP id u40so144060ugc
	for <linux-mtd@lists.infradead.org>;
	Wed, 03 May 2006 08:07:22 -0700 (PDT)
Message-ID: <625fc13d0605030807q43ee416bo8cb1dcf9f2a71645@mail.gmail.com>
Date: Wed, 3 May 2006 10:07:22 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: "Dmitry Bazhenov" <atrey@emcraft.com>
In-Reply-To: <200605031828.51552.atrey@emcraft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <200605031556.37660.atrey@emcraft.com> <44589BCE.2060402@yandex.ru>
	<200605031828.51552.atrey@emcraft.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 node versioning problem?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 5/3/06, Dmitry Bazhenov <atrey@emcraft.com> wrote:
> On Wednesday 03 May 2006 16:02, Artem B. Bityutskiy wrote:
> > Can it happen with a real-life flash device? If it can, we have to
> > switch to 64-bit versions.
>
> I think it can happen. I can imagine at least one scenario where such
> situation can occur. Of course, in normal circumstances it is hardly poss=
ible
> but in the case of a powerfail it can be.
>         1. Assume, upon a call to jffs2_commit_write() function the
>         f->highest_version has the maximum value.
>         2. jffs2_commit_write() increments f->highest_version which becom=
es 0.
>         3. jffs2_commit_write() invokes jffs2_write_dnode() with version=
=3D0.
>
>         5. Powerfail before obsoleting least recent overlapping nodes.
>
>         6. After reset, the scan process finds two(if were only one node =
for the
>         commited page before) valid nodes wich refer to the same region. =
It places
>         the least recent node which has the maximum version number at the=
 end of
>         the node list.
>         7. When jffs2_read_inode() function is invoked, the node with the=
 biggest
>         version number is added last, thus, obsoleting all overlapping no=
des.
>         The most recent inode is obsoleted as well. --> Bug.
>
> As a workaround I suggest to obsolete previous nodes before writing the n=
ew
> one. In case of powerfail there will be holes in data which can be easily
> recognized during inode reading.

On NAND flash (and some NOR flash chips), the nodes can't physically
be marked obsolete on the chip.  So JFFS2 has to figure it all out at
scan time for those regardless.

What Artem was asking is if it was physically possible to have a
file/directory with 4294967296 versions to being with.  Take a 1 byte
file as an example.  If that was the only file on the whole device,
and you had that many versions of it you'd have:

68 bytes overhead per version + 1 byte of data per version =3D
296352743424 bytes required to store.

That's 276 GiB.  Which isn't even sane for JFFS2 anyway.

josh
