Received: from n6.bullet.re3.yahoo.com ([68.142.237.91])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Ml38Q-0002UH-RB
	for linux-mtd@lists.infradead.org; Tue, 08 Sep 2009 16:01:39 +0000
Message-ID: <774508.54364.qm@web110103.mail.gq1.yahoo.com>
Date: Tue, 8 Sep 2009 09:01:32 -0700 (PDT)
From: Justin Treon <justin_treon@yahoo.com>
Subject: Re: Ideal NAND flashes for JFFS2 or YAFFS
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>,
	Bill Gatliff <bgat@billgatliff.com>
In-Reply-To: <4A92E0EA.1050406@billgatliff.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

For NAND I think there is a simple flow chart to pick your filing system.=
=0A=0ADo you have a partition bigger than 256 MBytes?=0AIf YES: Use UBIFS (=
@128 MB you can argue the point)=0AIf NO: Do you have a LOT of RAM?=0A=09If=
 YES: Use YAFFS2 (It is fast, but RAM hungry)=0A=09If NO: Use JFFS2=0A=0A> =
I'm currently a big fan of UBIFS for NAND.=A0 I'd take a=0A> look at it.=0A=
> =0A> I haven't compared it to YAFFS2, but UBIFS is in mainline=0A> kernel=
s, where YAFFS2 isn't.=A0 That gives UBIFS bonus=0A> points for convenience=
..=A0 And so far for me, UBIFS has=0A> been really, really solid.=0A> =0A> =
=0A=0A=0A      
