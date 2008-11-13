Received: from mba.ocn.ne.jp ([122.1.235.107] helo=smtp.mba.ocn.ne.jp)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L0eTf-00022l-NU
	for linux-mtd@lists.infradead.org; Thu, 13 Nov 2008 15:51:28 +0000
Date: Fri, 14 Nov 2008 00:51:32 +0900 (JST)
Message-Id: <20081114.005132.78730934.anemo@mba.ocn.ne.jp>
To: vapier.adi@gmail.com
Subject: Re: [PATCH] mtd: unify mtd partition/device registration
From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
In-Reply-To: <8bd0f97a0811130651k11c52a53j91c80cf196e9f66a@mail.gmail.com>
References: <20081113.224350.18312549.anemo@mba.ocn.ne.jp>
	<20081113.232823.125897716.anemo@mba.ocn.ne.jp>
	<8bd0f97a0811130651k11c52a53j91c80cf196e9f66a@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, vapier@gentoo.org, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 13 Nov 2008 09:51:01 -0500, "Mike Frysinger" <vapier.adi@gmail.com> wrote:
> > Automatic fallback to mtd_device in parse_mtd() is convenient but
> > somewhat unflexible...
> 
> we could just have it do it all the time.  i dont see a problem with
> exposing the entire block device the whole time ?  i know for the
> driver or two of mine, i'm fine with it.
> 
> ...
>        ret = parse_mtd_partitions(mtd, probe_types, &parts, 0);
>        if (ret > 0) {
>                ret = add_mtd_partitions(mtd, parts, ret);
>                kfree(parts);
>        } else if (nr_parts)
>                ret = add_mtd_partitions(mtd, parts, nr_parts);
>        if (ret)
>                return ret;
> #endif
> 
>        return add_mtd_device(mtd);

I'm OK with this.  But not sure all current mtd partition users.

Are you going to convert all parse_mtd_partitions() call?  Maybe some
people do not want to change /dev/mtd numbers...

---
Atsushi Nemoto
