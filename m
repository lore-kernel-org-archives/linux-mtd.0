Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WzuUL-0004VN-Bl
 for linux-mtd@lists.infradead.org; Wed, 25 Jun 2014 21:12:18 +0000
Message-ID: <53AB3B12.5000605@nod.at>
Date: Wed, 25 Jun 2014 23:11:46 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Heiko Schocher <hs@denx.de>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] ubi: fix correct rb_tree node comparison in add_vol
References: <1403594718-20595-1-git-send-email-hs@denx.de>
In-Reply-To: <1403594718-20595-1-git-send-email-hs@denx.de>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Cc: Mike Snitzer <snitzer@redhat.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-kernel@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 24.06.2014 09:25, schrieb Heiko Schocher:
> Commit 604b592e6fd3c98f21435e1181ba7723ffc24715 ("UBI: fix rb_tree node comparison in add_map")
> 
> introduced problems with attaching ubi fastmap images,
> created with older kernel.
> 
> As in ubi_find_av() from attach.c is
> [...]
>                 if (vol_id > av->vol_id)
>                         p = p->rb_left;
>                 else
>                         p = p->rb_right;
> 
> sync this logic also in add_vol() with this.
> 
> With this patch attaching older ubi images works again.
> 
> Signed-off-by: Heiko Schocher <hs@denx.de>

Thanks a lot for fixing this!

Acked-by: Richard Weinberger <richard@nod.at>

Thanks,
//richard
