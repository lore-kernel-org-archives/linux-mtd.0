Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PFkrv-0005tk-Ld
	for linux-mtd@lists.infradead.org; Tue, 09 Nov 2010 09:52:00 +0000
Received: by wyf22 with SMTP id 22so6539269wyf.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 09 Nov 2010 01:51:58 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1288772847-8120-8-git-send-email-computersforpeace@gmail.com>
References: <1288772847-8120-1-git-send-email-computersforpeace@gmail.com>
	<1288772847-8120-8-git-send-email-computersforpeace@gmail.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Tue, 9 Nov 2010 04:48:53 -0500
Message-ID: <AANLkTikCjW=P2ncq7E_4WLJtxzwPdaU4SWi1s-7Us7ZP@mail.gmail.com>
Subject: Re: [PATCH 08/10] mtd-utils: nandwrite: prevent 32-bit overflow
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: David Woodhouse <dwmw2@infradead.org>, Jehan Bing <jehan@orb.com>,
	linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Nov 3, 2010 at 04:27, Brian Norris wrote:
> For large block- and page-sizes, the multiplication of ebsize_aligned
> and pagelen can overflow a 32-bit integer. =C2=A0This overflow can be
> prevented by a simple change in order of operations (i.e., do division
> first).
>
> - =C2=A0 =C2=A0 =C2=A0 filebuf_max =3D pagelen * ebsize_aligned / mtd.min=
_io_size;
> + =C2=A0 =C2=A0 =C2=A0 filebuf_max =3D ebsize_aligned / mtd.min_io_size *=
 pagelen;

i'd insert a comment noting that order of operations matters to avoid
32bit overflow so someone doesnt switch it back by accident in the
future
-mike
