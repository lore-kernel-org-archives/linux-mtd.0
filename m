Received: from zorglub.ssji.net ([2001:7a8:3030::face])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CGzUE-0003LB-2c
	for linux-mtd@lists.infradead.org; Mon, 11 Oct 2004 08:41:11 -0400
Date: Mon, 11 Oct 2004 14:41:02 +0200
From: Nicolas Pouillon <nipo@ssji.net>
To: Kalev Lember <kalev@colleduc.ee>
Message-Id: <20041011144102.5f419c76.nipo@ssji.net>
In-Reply-To: <Pine.LNX.4.44.0410111142280.30772-100000@kiire.colleduc.ee>
References: <1097261009.11402.1703.camel@thomas>
	<Pine.LNX.4.44.0410111142280.30772-100000@kiire.colleduc.ee>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH]Probing at 0x0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[Mon, 11 Oct 2004 12:00:02 +0300 (EEST)]
Kalev Lember <kalev@colleduc.ee> eut le bonheur d'=E9crire:

> This is a 64 MB device that must be accessed it 16 bit mode.

Indeed, and as I have no control over the hardware configuration, I wont
be able to use it as 8bit.

Forcing some detection code, it finally ends up with something like
"Media Header not found". I did not understand the calling chain which
ended in the corresponding function, and didn't understand what is
"media header"... no ref in datasheets (at least in those I have)

--=20
Nipo <nipo@ssji.net>
