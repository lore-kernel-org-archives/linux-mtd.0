Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LAPf8-0003Mg-98
	for linux-mtd@lists.infradead.org; Wed, 10 Dec 2008 14:03:38 +0000
Subject: RE: Mounting UBIFS fails intermittently
From: Artem Bityutskiy <dedekind@infradead.org>
To: Manish Jain <Manish.Jain@raymarine.com>
In-Reply-To: <B8993E4AF7E2B44A80FE742A85665EF00ADA1D74@rmukmail.raymarine.com>
References: <B8993E4AF7E2B44A80FE742A85665EF00ADA1BF3@rmukmail.raymarine.com>
	<1228913998.13686.275.camel@sauron>
	<B8993E4AF7E2B44A80FE742A85665EF00ADA1D73@rmukmail.raymarine.com>
	<1228915942.13686.282.camel@sauron>
	<B8993E4AF7E2B44A80FE742A85665EF00ADA1D74@rmukmail.raymarine.com>
Content-Type: text/plain; charset=utf-8
Date: Wed, 10 Dec 2008 16:01:01 +0200
Message-Id: <1228917661.13686.288.camel@sauron>
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

On Wed, 2008-12-10 at 13:39 +0000, Manish Jain wrote:
> Can you please suggest any alternate to ubiformat, I would like to try th=
at out.

Well, ubiformat is kind of the right solution, because it preserves
erase counters.

But you may try nandwrite which is available in mtd-utils. It destroys
erase counters, but it is OK if you are developing.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
