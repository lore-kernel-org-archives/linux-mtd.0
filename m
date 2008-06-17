Received: from mba.ocn.ne.jp ([122.1.235.107] helo=smtp.mba.ocn.ne.jp)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K8dKg-0004g5-IV
	for linux-mtd@lists.infradead.org; Tue, 17 Jun 2008 15:42:55 +0000
Date: Wed, 18 Jun 2008 00:44:21 +0900 (JST)
Message-Id: <20080618.004421.26096582.anemo@mba.ocn.ne.jp>
To: dwmw2@infradead.org
Subject: Re: [PATCH RESEND] mtdpart: Avoid divide-by-zero on out-of-reach path
From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
In-Reply-To: <1213711819.26255.1066.camel@pmac.infradead.org>
References: <1213628634.26255.781.camel@pmac.infradead.org>
	<20080617.230923.05598528.anemo@mba.ocn.ne.jp>
	<1213711819.26255.1066.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: joern@logfs.org, linux-mtd@lists.infradead.org, akpm@linux-foundation.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 17 Jun 2008 15:10:19 +0100, David Woodhouse <dwmw2@infradead.or=
g> wrote:
> > Then, should I revise these patches with holding long lines?
> =

> As J=F6rn says, it's probably better to do things one logical step at=
 a
> time. Why not follow up with a third patch which wraps the long lines=
 in
> the whole file (as long as that doesn't make it harder to read).

OK, I will send a cleanup patch soon after these two patches
stabilized.  It seems J=F6rn still not comfortable with current shape :=
)

---
Atsushi Nemoto
