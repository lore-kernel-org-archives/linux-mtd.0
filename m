Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Krn6w-0008Cj-Rf
	for linux-mtd@lists.infradead.org; Mon, 20 Oct 2008 05:15:23 +0000
Subject: Re: [RFC] ubi: tmp hack for lstat
From: Artem Bityutskiy <dedekind@infradead.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
In-Reply-To: <20081019132122.GA20282@www.tglx.de>
References: <20081019132122.GA20282@www.tglx.de>
Content-Type: text/plain; charset=utf-8
Date: Mon, 20 Oct 2008 08:13:57 +0300
Message-Id: <1224479637.4466.55.camel@sauron>
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

On Sun, 2008-10-19 at 15:21 +0200, Sebastian Andrzej Siewior wrote:
> lstat() on /dev/ubi%d_%d returns 0 in the st_size field. This hack
> allows to get the correct file size (as long as nobody updates the volume
> in the meantime).
>=20
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
> I have userpsace programs which stat() the file and process the
> returned number bytes. The other work around is to copy the file
> somewhere and use this file instead of /dev/ubi.
> Artem, do you thing it is possible to implement this functionality
> properly or would it be reasonable not to use stat() at all on ubi
> volumes?

Hi,

I've tried to stat various files in my /dev/ and all of them have size
0. Why UBI should be different? Indeed, stat should return size of the
inode, that is normal semantics. You suggest making stat on UBI volume
character devices return volume size. It might help your application,
but it'll confuse other applications - for example 'du', which uses stat
to calculate directory size. So am not sure it is good idea.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
