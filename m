Received: from mail-gy0-f177.google.com ([209.85.160.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1ONc2u-0004od-Ou
	for linux-mtd@lists.infradead.org; Sun, 13 Jun 2010 01:31:33 +0000
Received: by gyb11 with SMTP id 11so2006289gyb.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 12 Jun 2010 18:31:31 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1276371338-14253-1-git-send-email-agust@denx.de>
References: <1276371338-14253-1-git-send-email-agust@denx.de>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Sat, 12 Jun 2010 21:31:11 -0400
Message-ID: <AANLkTikutI1bWUpG4FDWwwKOGSEfik-ycZZLs37AjDtK@mail.gmail.com>
Subject: Re: [PATCH v3] mtdchar: fix mmap() for MTD RAM/ROM char devices
To: Anatolij Gustschin <agust@denx.de>
Content-Type: text/plain; charset=UTF-8
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

On Sat, Jun 12, 2010 at 15:35, Anatolij Gustschin wrote:
> For no-mmu systems mmap() on RAM/ROM devices already works
> but for systems with mmu it probably was not tested and
> currently doesn't work.

nope, never did

> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (vma->vm_pgoff > (~=
0UL >> PAGE_SHIFT))
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 return -EINVAL;

i'm pretty sure this is inappropriate and doesnt belong here
-mike
