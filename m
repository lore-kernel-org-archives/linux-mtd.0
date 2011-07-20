Received: from mail.elutions.com ([64.31.159.3])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QjVXb-0002nO-O9
	for linux-mtd@lists.infradead.org; Wed, 20 Jul 2011 12:06:16 +0000
Received: from mail.elutions.com (127.0.0.1) by mail.elutions.com (MlfMTA
	v3.2r9) id h4qos60171sm for <linux-mtd@lists.infradead.org>;
	Wed, 20 Jul 2011 06:45:23 -0400 (envelope-from
	<prvs=1182c31cb7=mhench@elutions.com>)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: RE: Regression in handling of unsafe UBI shutdown
Date: Wed, 20 Jul 2011 08:06:14 -0400
Message-ID: <F87D23B7E1F84E4AB52E4FA4A55F85DC026DADA7@tpamail.elutions.com>
In-Reply-To: <CACTFLAOsEZksaUXrN9KVeXHnSxtY-h8XWiYDyn_OxTLxmeWjeg@mail.gmail.com>
From: "Mike Hench" <mhench@elutions.com>
To: "Daniel Mack" <zonque@gmail.com>
Cc: Sven Neumann <s.neumann@raumfeld.com>,
	Artem Bityutskiy <dedekind1@gmail.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Are you an an ARM as well?
We run powerpc.

> Did you try to cut the power from your device in the middle of full
> operation? If would help a lot if you could try this.
My test is automated random power cycling while doing a complicated file
copy/compare operation I use for abuse testing.

Oh, forgot to mention, we are using u-boot 2010-06, not that old,
not new either.

Mike.
