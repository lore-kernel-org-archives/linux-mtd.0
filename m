Received: from smtp.nokia.com ([131.228.20.170] helo=mgw-ext11.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1I5bBz-000791-Di
	for linux-mtd@lists.infradead.org; Tue, 03 Jul 2007 01:44:52 -0400
Subject: Re: What is subpage_sft??
From: Artem Bityutskiy <dedekind@infradead.org>
To: Vinit Agnihotri <vinit.agnihotri@gmail.com>
In-Reply-To: <9b52d64c0707022228u1d47fa1awfef79a9f6574b0f@mail.gmail.com>
References: <9b52d64c0707022228u1d47fa1awfef79a9f6574b0f@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Tue, 03 Jul 2007 08:44:25 +0300
Message-Id: <1183441465.3531.5.camel@sauron>
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

On Tue, 2007-07-03 at 10:58 +0530, Vinit Agnihotri wrote:
> I tried searching on net to understand what subpage_sft means, but
> aint find any relevant information.
>=20
> What does subpage_sft means?? Where it is used?? Is it related with
> NAND or NOR flash?
> Can anybody provide this little information to me. Any relevant
> document or link is welcome.

Many NANDs are allow to write more then once to the NAND page, and MTD
allows you to write a sub-page rather then whole page. Typically 512
bytes NAND page consists of 2x256 byte sub-pages, or 2KiB NAND page
consists of 4x512 byte sub-pages.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
