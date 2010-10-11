Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P5LqP-000864-Rw
	for linux-mtd@lists.infradead.org; Mon, 11 Oct 2010 17:07:27 +0000
Received: by wyj26 with SMTP id 26so1209087wyj.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 11 Oct 2010 10:07:24 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <0870ac8ab250ec91dceb2cc461fe82c0d7995bc8.1286788714.git.baruch@tkos.co.il>
References: <0870ac8ab250ec91dceb2cc461fe82c0d7995bc8.1286788714.git.baruch@tkos.co.il>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Mon, 11 Oct 2010 13:07:03 -0400
Message-ID: <AANLkTikVHPH8KkpcfKHM9bSoqx2iCqNfx+4VZMLWP-RE@mail.gmail.com>
Subject: Re: [PATCH] nanddump: fix initialization of bad blocks oob data buffer
To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Oct 11, 2010 at 05:19, Baruch Siach wrote:
> When dumping oob data of a bad block, initialize oobbuf with 0xff, instea=
d of
> readbuf. =C2=A0This avoids bogus oob data on output.
>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Acked-by: Mike Frysinger <vapier@gentoo.org>
-mike
