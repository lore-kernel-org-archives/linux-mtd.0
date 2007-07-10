Received: from smtp.nokia.com ([131.228.20.173] helo=mgw-ext14.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1I8AsG-0003iO-MU
	for linux-mtd@lists.infradead.org; Tue, 10 Jul 2007 04:15:12 -0400
Subject: Re: overflows while calculating volume->used_bytes
From: Artem Bityutskiy <dedekind@infradead.org>
To: Vinit Agnihotri <vinit.agnihotri@gmail.com>
In-Reply-To: <9b52d64c0707100058m7730acdbv8fb8c3ca57eac2ac@mail.gmail.com>
References: <9b52d64c0707092237x48c149cdy24b6eaf1d0baa184@mail.gmail.com>
	<1184050868.3531.67.camel@sauron>
	<9b52d64c0707100047k604ca250g94a0657defc6eac3@mail.gmail.com>
	<9b52d64c0707100058m7730acdbv8fb8c3ca57eac2ac@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Tue, 10 Jul 2007 11:14:57 +0300
Message-Id: <1184055297.3531.82.camel@sauron>
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

On Tue, 2007-07-10 at 13:28 +0530, Vinit Agnihotri wrote:
> Heres the modified patch.
> Not special purpose as such. Its just my flash is a bit large :)

Committed the patch, thanks, although it did not apply cleanly and
I did hand work. Thy to save your mail and use git-am -i -s as I do.

P.S. It is so much easier to use git or quilt for preparing patches
then dealing with diff.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
