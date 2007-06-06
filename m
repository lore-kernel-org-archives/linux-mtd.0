Received: from moutng.kundenserver.de ([212.227.126.183])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HvurF-0004J4-Vt
	for linux-mtd@lists.infradead.org; Wed, 06 Jun 2007 08:45:18 -0400
From: Arnd Bergmann <arnd@arndb.de>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [Patch 04/18] include/linux/logfs.h
Date: Wed, 6 Jun 2007 14:42:29 +0200
References: <20070603183845.GA8952@lazybastard.org>
	<db91817d295770e459727005108b05e2@kernel.crashing.org>
	<1181119820.25232.434.camel@pmac.infradead.org>
In-Reply-To: <1181119820.25232.434.camel@pmac.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200706061442.31147.arnd@arndb.de>
Cc: akpm@osdl.org, David Weinehall <tao@acc.umu.se>,
	Dongjun Shin <djshin90@gmail.com>, Kyle Moffett <mrmacman_g4@mac.com>,
	linux-mtd@lists.infradead.org, Pavel Machek <pavel@ucw.cz>,
	Sam Ravnborg <sam@ravnborg.org>,
	Ulisses Furquim <ulissesf@gmail.com>, CaT <cat@zip.com.au>,
	Evgeniy Polyakov <johnpol@2ka.mipt.ru>, Roland Dreier <rdreier@cisco.com>,
	Segher Boessenkool <segher@kernel.crashing.org>,
	=?iso-8859-15?q?J=F6rn_Engel?= <joern@lazybastard.org>,
	Jamie Lokier <jamie@shareable.org>, Pekka Enberg <penberg@cs.helsinki.fi>,
	Jan Engelhardt <jengelh@linux01.gwdg.de>,
	Thomas Gleixner <tglx@linutronix.de>, Bill Davidsen <davidsen@tmr.com>,
	Albert Cahalan <acahalan@gmail.com>,
	John Stoffel <john@stoffel.org>, linux-kernel@vger.kernel.org,
	Ondrej Zajicek <santiago@crfreenet.org>,
	linux-fsdevel@vger.kernel.org, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 06 June 2007, David Woodhouse wrote:
> And if I had something like this (which is admittedly contrived, but
> hardware people _do_ do stupid things to us):
> =A0 =A0{ uint32_t, uint8_t, uint16_t, uint8_t, uint32_t, uint32_t }
>=20
> With the 'packed' attribute the compiler would assume arbitrary
> alignment of all the 32-bit integers. But in reality it's only necessary
> for the uint16_t in the middle. A 'nopadding' attribute would deal with
> that correctly.

I would argue that a newly invented 'nopadding' attribute should reject
such a structure as invalid, because it should not let members be
unaligned. Unfortunately, this also gets tricky if you consider

struct {
	uint32_t a;
	uint64_t b;
	uint32_t c;
};

which does have an unaligned member by default in i386, but not on
any modern platform.

	Arnd <><
