Received: from smtp.nokia.com ([131.228.20.173] helo=mgw-ext14.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1I5bDh-0007ME-HH
	for linux-mtd@lists.infradead.org; Tue, 03 Jul 2007 01:46:48 -0400
Subject: RE: What is subpage_sft??
From: Artem Bityutskiy <dedekind@infradead.org>
To: kmpark@infradead.org
In-Reply-To: <000f01c7bd33$d71f6850$e1ac580a@swcenter.sec.samsung.co.kr>
References: <9b52d64c0707022228u1d47fa1awfef79a9f6574b0f@mail.gmail.com>
	<000f01c7bd33$d71f6850$e1ac580a@swcenter.sec.samsung.co.kr>
Content-Type: text/plain; charset=utf-8
Date: Tue, 03 Jul 2007 08:46:23 +0300
Message-Id: <1183441583.3531.8.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org,
	'Vinit Agnihotri' <vinit.agnihotri@gmail.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2007-07-03 at 14:34 +0900, Kyungmin Park wrote:
> It is used at UBI.

Yeah, it is very beneficial for UBI because it wastes twice as less NAND
flash space if there is sub-page access.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
