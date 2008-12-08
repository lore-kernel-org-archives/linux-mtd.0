Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L9cp5-0004xt-Qq
	for linux-mtd@lists.infradead.org; Mon, 08 Dec 2008 09:54:40 +0000
Subject: Re: UBI/DVB ioctl conflict?
From: Artem Bityutskiy <dedekind@infradead.org>
To: Laurent Pinchart <laurentp@cse-semaphore.com>
In-Reply-To: <200812081041.14178.laurentp@cse-semaphore.com>
References: <20081207095811.13b51cca@zod.rchland.ibm.com>
	<1228717226.13686.89.camel@sauron>
	<200812081041.14178.laurentp@cse-semaphore.com>
Content-Type: text/plain; charset=utf-8
Date: Mon, 08 Dec 2008 11:51:55 +0200
Message-Id: <1228729915.13686.95.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: v4l-dvb-maintainer@linuxtv.org, linux-mtd@lists.infradead.org,
	LKML <linux-kernel@vger.kernel.org>, arnd@arndb.de
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2008-12-08 at 10:41 +0100, Laurent Pinchart wrote:
> Correct me if I'm wrong, but doesn't this only matters for devices that w=
ould=20
> implement both the UBI and DVB API on the same inode ? That would be quit=
e=20
> unlikely.

Yeah, I guess. But this anyway makes sense to keep ioctls
non-overlapping.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
