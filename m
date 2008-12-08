Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L9bVB-0002NH-Jz
	for linux-mtd@lists.infradead.org; Mon, 08 Dec 2008 08:30:02 +0000
Subject: Re: [PATCH] UBI WL-Subsystem: Improvement in prot tree
From: Artem Bityutskiy <dedekind@infradead.org>
To: xiaochuan-xu <xiaochuan-xu@cqu.edu.cn>
In-Reply-To: <1228724140.2694.27.camel@localhost.localdomain>
References: <1228724140.2694.27.camel@localhost.localdomain>
Content-Type: text/plain; charset=utf-8
Date: Mon, 08 Dec 2008 10:27:39 +0200
Message-Id: <1228724859.13686.92.camel@sauron>
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

Hi,

you are back. I thought you had disappeared forever and removed your git
tree from my home last week, sorry. I'll create it soon and will take a
look at your patch, thanks.

On Mon, 2008-12-08 at 16:15 +0800, xiaochuan-xu wrote:
> Hi, all.
>=20
> A new PEB protection method in UBI WL-Subsystem is implemented,
> It's simpler and higher efficiency than the older prot RB-tree, I think.
>=20
> 1. without two prot RB-tree, there is only one prot array, But their
> functions are the same.
>=20
> 2. no other structure needed except @ubi_wl_entry ubi_wl_prot_entry is
> discarded. and we need not malloc new struct every time in
> ubi_wl_get_peb() function.
>=20
> 3. protarray add and del operation are O(1) operations, and check over
> opteration is O(n), which is better then the older prot RB-tree
> implement.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
