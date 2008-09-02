Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KaTaR-00036a-6i
	for linux-mtd@lists.infradead.org; Tue, 02 Sep 2008 10:58:15 +0000
Subject: Re: [PATCH] [MTD-UTILS] nandwrite: read from stdin support
From: Artem Bityutskiy <dedekind@infradead.org>
To: Tommi Airikka <tommi.airikka@ericsson.com>
In-Reply-To: <816E1A2C67CC2B488292E7A0981FFD7702AC16FB@esealmw110.eemea.ericsson.se>
References: <816E1A2C67CC2B488292E7A0981FFD7702AC16FB@esealmw110.eemea.ericsson.se>
Content-Type: text/plain; charset=utf-8
Date: Tue, 02 Sep 2008 13:54:29 +0300
Message-Id: <1220352869.4036.34.camel@sauron>
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


On Tue, 2008-09-02 at 11:04 +0200, Tommi Airikka wrote:
> Here is a patch that adds read from stdin support for nandwrite.
> I have tried it with 'cat filename.jffs2 | nandwrite -i filesize -p
> /dev/mtdX -'
> and it did work.

Looks OK for me, but I would rather call stdin "Standard input", not
"Standard in", as you call it in the help output and in the comments.

Also, it would be better to send the patch in-line, not as an
attachment.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
