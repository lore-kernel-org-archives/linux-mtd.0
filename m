Received: from smtp.nokia.com ([131.228.20.171] helo=mgw-ext12.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1GwxxP-0007Qy-1M
	for linux-mtd@lists.infradead.org; Wed, 20 Dec 2006 04:41:53 -0500
Subject: Re: Reduce boot time with jffs2 and CM-X255
From: Artem Bityutskiy <dedekind@infradead.org>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
In-Reply-To: <Pine.LNX.4.64.0612201007240.11369@lnxricardw.se.axis.com>
References: <45881281.8060001@sacet.com> <4588E35F.8000806@fatti.com>
	<4588F67A.6080602@sacet.com>
	<Pine.LNX.4.64.0612201007240.11369@lnxricardw.se.axis.com>
Content-Type: text/plain; charset=utf-8
Date: Wed, 20 Dec 2006 11:41:09 +0200
Message-Id: <1166607669.3939.18.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: Linux mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2006-12-20 at 10:17 +0100, Ricard Wanderlof wrote:
> Admittedly, NAND=20
> is faster than NOR, but then you've got quite a lot of empty flash too=20
> (250 MB).

Just do not include empty eraseblocks to the image.

> I don't know what the solution is - one idea is that a program like=20
> nandwrite could be instructed to write cleanmarkers to the OOB of unused=20
> parts of a partition. Currently there is no support for this but it could=
=20
> be added.

nandwrite -o ?

>=20
> Hm, sidetracking here a bit, I'm thinking a general erase + write image=20
> utility for NAND flash would be useful, given that bad block management=20
> gets a bit hairy when you write to NAND and the write fails - should the=20
> block be re-erased (not really part of a nand writing tool's job) and=20
> retried, or just marked as bad (because most likely the block had recentl=
y=20
> been erased by an erasing tool)? Having erase+write in the same tool woul=
d=20
> make it easier for the tool to manage this, and it could also write jffs2=
=20
> cleanmarkers to the oob as part of the whole procedure.

I would recommend to improve/re-work/upgrade nandwrite instead of a new
tool.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
