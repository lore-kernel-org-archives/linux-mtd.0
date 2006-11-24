Received: from mgw-ext12.nokia.com ([131.228.20.171])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GndhV-0002iu-Jp
	for linux-mtd@lists.infradead.org; Fri, 24 Nov 2006 11:15:17 -0500
Subject: Re: [PATCH] [MTD] NAND: Lazily BBT construction
From: Artem Bityutskiy <dedekind@infradead.org>
To: Konstantin Baydarov <kbaidarov@dev.rtsoft.ru>
In-Reply-To: <20061124165618.44418a5e@localhost.localdomain>
References: <20061124154210.6303c9fe@localhost.localdomain>
	<1164373550.576.13.camel@sauron>
	<20061124165618.44418a5e@localhost.localdomain>
Content-Type: text/plain; charset=utf-8
Date: Fri, 24 Nov 2006 17:45:38 +0200
Message-Id: <1164383138.576.21.camel@sauron>
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

On Fri, 2006-11-24 at 16:56 +0300, Konstantin Baydarov wrote:
> Patch covers the case when there is no on-flash BBT and on-flash
> BBT wasn't requested
Right. So the idea was if your flash is small enough and you are
satisfied with scanning, you use scanning. If not, you use on-flash BBT.

>  How can I use it?=20
I haven't actually used it. There is some flag you have to set in your
chip structure.

> Also when we have on-flash BBT we
> don't need to scan chip so we don't need lazily BBT.

Yes, I did not say this. I meant why don't you just switch to on-media
BBT instead of implementing this lazy scan stuff. Just curious.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
