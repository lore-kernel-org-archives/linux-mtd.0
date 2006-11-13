Received: from mgw-ext12.nokia.com ([131.228.20.171])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GjYo1-0006Za-MA
	for linux-mtd@lists.infradead.org; Mon, 13 Nov 2006 05:12:55 -0500
Subject: Re: number mtd partitions on 16 limits?
From: Artem Bityutskiy <dedekind@infradead.org>
To: hermes33@freenet.de
In-Reply-To: <E1GjYhU-00007r-PL@www8.emo.freenet-rz.de>
References: <E1GjYhU-00007r-PL@www8.emo.freenet-rz.de>
Content-Type: text/plain; charset=utf-8
Date: Mon, 13 Nov 2006 12:12:35 +0200
Message-Id: <1163412755.3925.34.camel@sauron>
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

Hi,

On Mon, 2006-11-13 at 11:06 +0100, hermes33@freenet.de wrote:
> I need more than 16 mtd partitions on a omap1610 (arm) with kernel 2.4.20=
.=20
> I create 16 partitions. All ok, 'cat /proc/mtd' show mtd0 to mtd15.=20
> I create 17 partitions. 'cat /proc/mtd' show only mtd0 to mtd15.=20
> It seems to give a limit with 16 partitions.=20
> Where can I change that? can someone help me?

This is because of
#define MAX_MTD_DEVICES 16
at include/linux/mtd/mtd.h. Increase this macro. I guess it is harmless
to make it 32, feel free to send a patch.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
