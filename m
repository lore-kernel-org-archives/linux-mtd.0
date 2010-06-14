Received: from mail-out.m-online.net ([212.18.0.9])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OO5s4-0007tx-Kd
	for linux-mtd@lists.infradead.org; Mon, 14 Jun 2010 09:22:21 +0000
Date: Mon, 14 Jun 2010 11:22:13 +0200
From: Anatolij Gustschin <agust@denx.de>
To: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: [PATCH v3] mtdchar: fix mmap() for MTD RAM/ROM char devices
Message-ID: <20100614112213.695ac5d2@wker>
In-Reply-To: <AANLkTikutI1bWUpG4FDWwwKOGSEfik-ycZZLs37AjDtK@mail.gmail.com>
References: <1276371338-14253-1-git-send-email-agust@denx.de>
	<AANLkTikutI1bWUpG4FDWwwKOGSEfik-ycZZLs37AjDtK@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	Detlev Zundel <dzu@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 12 Jun 2010 21:31:11 -0400
Mike Frysinger <vapier.adi@gmail.com> wrote:

> On Sat, Jun 12, 2010 at 15:35, Anatolij Gustschin wrote:
> > For no-mmu systems mmap() on RAM/ROM devices already works
> > but for systems with mmu it probably was not tested and
> > currently doesn't work.
>=20
> nope, never did

Do you mean it never worked on mmu systems?

>=20
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (vma->vm_pgoff > (~0UL >> PAGE_SHIFT))
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
>=20
> i'm pretty sure this is inappropriate and doesnt belong here

Then I'll drop this in the next patch.

Thanks,
Anatolij
