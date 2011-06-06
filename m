Received: from mail-vx0-f177.google.com ([209.85.220.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTcQe-0000Oh-Un
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 16:13:25 +0000
Received: by vxd2 with SMTP id 2so3816018vxd.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 09:13:22 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <29EDD457F13D0846B91A4845A68C3836E4657A@BOSQNAOMAIL1.qnao.net>
References: <29EDD457F13D0846B91A4845A68C3836DF7DEF@BOSQNAOMAIL1.qnao.net>
	<BANLkTi=ymbNh93riTAjJ5RVFXogYt9HPYg@mail.gmail.com>
	<29EDD457F13D0846B91A4845A68C3836E4657A@BOSQNAOMAIL1.qnao.net>
Date: Mon, 6 Jun 2011 12:13:21 -0400
Message-ID: <BANLkTik=6Q5conreu-GYbQ-Q7YZk65QEqQ@mail.gmail.com>
Subject: Re: ubi image only mounts once
From: "Matthew L. Creech" <mlcreech@gmail.com>
To: "Douglass, Woody" <Woodrow.Douglass@qinetiq-na.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jun 6, 2011 at 11:53 AM, Douglass, Woody
<Woodrow.Douglass@qinetiq-na.com> wrote:
> Matt,
>
> Thanks for the quick reply. I have tried both ubiformat (passing -f with
> my image) and nandwrite, both seem to behave the same way. The
> filesystem mounts once, but when I reboot, it doesn't ever mount again.
>

OK, if you tried using ubiformat and got the same error, then it's not
the problem I mentioned.

> I cannot upgrade my kernel as my development schedule is too aggressive;
> I don't have time. I'm using 2.6.32 for now; if I fail at getting UBI to
> work, I can fall back on jffs2, which works, but I prefer UBIFS.
>

That's fine, an upgrade should only be necessary to add support for
the fixup flag, which you don't need if you use ubiformat.

So it looks like it's something else (maybe platform-specific?), sorry.

-- 
Matthew L. Creech
