Received: from mgw-ext13.nokia.com ([131.228.20.172])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GhRfH-00077C-B1
	for linux-mtd@lists.infradead.org; Tue, 07 Nov 2006 09:11:10 -0500
Subject: Re: UBI and OneNAND
From: Artem Bityutskiy <dedekind@infradead.org>
To: Josh Boyer <jwboyer@linux.vnet.ibm.com>
In-Reply-To: <1162900051.19697.16.camel@crusty.rchland.ibm.com>
References: <32544906.187201162866905328.JavaMail.weblogic@ep_ml06>
	<1162889433.5606.15.camel@localhost.localdomain>
	<loom.20061107T110704-786@post.gmane.org>
	<1162899578.31636.19.camel@sauron>
	<1162900051.19697.16.camel@crusty.rchland.ibm.com>
Content-Type: text/plain; charset=utf-8
Date: Tue, 07 Nov 2006 16:10:37 +0200
Message-Id: <1162908637.31636.23.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: John Smith <john.smith@arrows.demon.co.uk>, linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2006-11-07 at 05:47 -0600, Josh Boyer wrote:
> It's the default.  I think it's too low of a default.  Others disagreed
> with me.
>=20
> Telling every new UBI user "may be it makes sense to reserve more" will
> get old quick.  Perhaps the default should be bumped to 5 or so?

Actually with 128MiB flash the default ends up with something like
32EBs, which looks even too large, so I do not know...

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
