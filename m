Received: from mgw-ext13.nokia.com ([131.228.20.172])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GneB3-00038M-3R
	for linux-mtd@lists.infradead.org; Fri, 24 Nov 2006 11:45:31 -0500
Subject: Re: [PATCH] [MTD] NAND: Lazily BBT construction
From: Artem Bityutskiy <dedekind@infradead.org>
To: Vitaly Wool <vwool@ru.mvista.com>
In-Reply-To: <4566EF6A.1000404@ru.mvista.com>
References: <20061124154210.6303c9fe@localhost.localdomain>
	<1164373299.576.11.camel@sauron>  <4566EF6A.1000404@ru.mvista.com>
Content-Type: text/plain; charset=utf-8
Date: Fri, 24 Nov 2006 17:42:24 +0200
Message-Id: <1164382944.576.16.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org,
	Konstantin Baydarov <kbaidarov@dev.rtsoft.ru>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2006-11-24 at 16:11 +0300, Vitaly Wool wrote:
> I was poking around this idea a bit and it turned out that the boot time=20
> is longer for most flashes.

Why is it longer for most flashes? And longer with comparing to what?

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
