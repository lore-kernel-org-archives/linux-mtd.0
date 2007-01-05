Received: from smtp.nokia.com ([131.228.20.172] helo=mgw-ext13.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1H2mj2-00004v-DA
	for linux-mtd@lists.infradead.org; Fri, 05 Jan 2007 05:55:09 -0500
Subject: Re: OneNAND: read-while-load
From: Artem Bityutskiy <dedekind@infradead.org>
To: kyungmin.park@samsung.com
In-Reply-To: <3488442.114061167991102401.JavaMail.weblogic@ep_ml22>
References: <3488442.114061167991102401.JavaMail.weblogic@ep_ml22>
Content-Type: text/plain; charset=utf-8
Date: Fri, 05 Jan 2007 12:54:58 +0200
Message-Id: <1167994498.3683.12.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Adrian Hunter <hunter.programmer@gmail.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2007-01-05 at 09:58 +0000, Kyungmin Park wrote:
> Yes, We already knew read-while-loading has better performance than norma=
l read.
> Internally we called it 'MRead' (refer another OneNAND open source in sam=
sung web site)

It is true that JFFS2 is currently the main user. But it may be changed
in the future. Also one day one can teach JFFS2 to maintain larger nodes
with, say 16K or more bytes of data. And BTW, UBI reads whole
eraseblocks when making wear-leveling, so it would also benefit.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
