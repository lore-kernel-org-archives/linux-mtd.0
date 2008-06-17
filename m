Received: from mba.ocn.ne.jp ([122.1.235.107] helo=smtp.mba.ocn.ne.jp)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K8bqm-0005cU-5k
	for linux-mtd@lists.infradead.org; Tue, 17 Jun 2008 14:07:57 +0000
Date: Tue, 17 Jun 2008 23:09:23 +0900 (JST)
Message-Id: <20080617.230923.05598528.anemo@mba.ocn.ne.jp>
To: dwmw2@infradead.org
Subject: Re: [PATCH RESEND] mtdpart: Avoid divide-by-zero on out-of-reach path
From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
In-Reply-To: <1213628634.26255.781.camel@pmac.infradead.org>
References: <20080616.233039.01916379.anemo@mba.ocn.ne.jp>
	<20080616145704.GB20814@logfs.org>
	<1213628634.26255.781.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: joern@logfs.org, linux-mtd@lists.infradead.org, akpm@linux-foundation.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 16 Jun 2008 16:03:54 +0100, David Woodhouse <dwmw2@infradead.org> wrote:
> > David seems to like long lines.  Sometimes even for good reasons.
> 
> Sometimes I do, yes. But at a quick glance I don't think I would argue
> that we should keep _those_ ones. They could be wrapped without
> detriment.

Then, should I revise these patches with holding long lines?

> Subject: [PATCH 1/2] mtdpart: Avoid divide-by-zero on out-of-reach path
> Subject: [PATCH 2/2] mtdpart: Do not shadow symbol 'i'

---
Atsushi Nemoto
