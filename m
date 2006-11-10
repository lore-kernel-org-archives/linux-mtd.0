Received: from mgw-ext14.nokia.com ([131.228.20.173])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GiYwU-0007CQ-Qg
	for linux-mtd@lists.infradead.org; Fri, 10 Nov 2006 11:09:30 -0500
Subject: Re: mount costs too long
From: Artem Bityutskiy <dedekind@infradead.org>
To: Aubrey <aubreylee@gmail.com>
In-Reply-To: <6d6a94c50611100648g87770a0qb723fad11fa65cd8@mail.gmail.com>
References: <6d6a94c50611092305v6f52b9b0hfd254e10a2992d44@mail.gmail.com>
	<1163159781.19697.24.camel@crusty.rchland.ibm.com>
	<6d6a94c50611100648g87770a0qb723fad11fa65cd8@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Fri, 10 Nov 2006 18:08:18 +0200
Message-Id: <1163174898.3925.13.camel@sauron>
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

On Fri, 2006-11-10 at 22:48 +0800, Aubrey wrote:
> I got a clue from YAFFS mailing list, this is a known issue on 2.6.18 ker=
nels.
> It is caused by the MTD layer rework and corresponding yaffs-mtd layer
> modifications. Namely, an additional translation had to be implemented
> for OOB area for 512b page chips.

Is it possible to describe this in more details? And why YAFFS people do
not fix this?

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
