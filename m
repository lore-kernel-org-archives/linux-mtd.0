Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JjH6t-000521-Ub
	for linux-mtd@lists.infradead.org; Tue, 08 Apr 2008 16:55:52 +0000
Subject: Re: Question about ubimkvol vs. mkfs.ubifs
From: Artem Bityutskiy <dedekind@infradead.org>
To: Bruce_Leonard@selinc.com
In-Reply-To: <OF360E3C04.51837E02-ON88257425.005B6EBB-88257425.005C150F@selinc.com>
References: <OF360E3C04.51837E02-ON88257425.005B6EBB-88257425.005C150F@selinc.com>
Content-Type: text/plain; charset=utf-8
Date: Tue, 08 Apr 2008 19:54:56 +0300
Message-Id: <1207673696.8040.122.camel@sauron>
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

On Tue, 2008-04-08 at 09:45 -0700, Bruce_Leonard@selinc.com wrote:
> One would think so, but I keep running into division and modulo problems=20
> (because doing 64-bit division in the kernel is strongly frowned upon, fo=
r=20
> good reasons), and once I work through all those issues I get seg faults,=
=20
> etc, etc, etc.  You know...the usual development things ;).

Hmm. Do you divide 64-bit offset on eraseblock size? Could generally
make sense to change MTD interfaces to accept eraseblock:offset pair
instead?

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
