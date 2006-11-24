Received: from mgw-ext12.nokia.com ([131.228.20.171])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1Gnam8-0000Np-4i
	for linux-mtd@lists.infradead.org; Fri, 24 Nov 2006 08:07:37 -0500
Subject: Re: [PATCH] [MTD] NAND: Lazily BBT construction
From: Artem Bityutskiy <dedekind@infradead.org>
To: Konstantin Baydarov <kbaidarov@dev.rtsoft.ru>
In-Reply-To: <20061124154210.6303c9fe@localhost.localdomain>
References: <20061124154210.6303c9fe@localhost.localdomain>
Content-Type: text/plain; charset=utf-8
Date: Fri, 24 Nov 2006 15:05:50 +0200
Message-Id: <1164373550.576.13.camel@sauron>
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

On Fri, 2006-11-24 at 15:42 +0300, Konstantin Baydarov wrote:
> This is the implementation of lazy BBT construction. It introduces
> a new config option that allows to construct BBT(bad block table)
> lazily for NAND chips with memory based BBT.
> The main goal of the feature introduced is to decrease boot time.
> How it works: BBT is filled only when we check if block is bad. NAND
> is
> scanned and BBT entries is constructed from topmost unscanned block to
> requested.
> By default BBT is constructed during boot. To enable lazily
> construction NAND_LAZY_BBT bit should be set in options field of
> structure nand_chip.=20

Also, the 3rd question.

3. Why don't you use on-flash BBT if you are not satisfied with in-RAM
BBT?

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
