Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZKVrU-0005HJ-3O
 for linux-mtd@lists.infradead.org; Wed, 29 Jul 2015 18:13:52 +0000
Received: by pacan13 with SMTP id an13so9604343pac.1
 for <linux-mtd@lists.infradead.org>; Wed, 29 Jul 2015 11:13:30 -0700 (PDT)
Date: Wed, 29 Jul 2015 11:13:27 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Boris BREZILLON <b.brezillon.dev@gmail.com>,
 linux-mtd@lists.infradead.org, linux-sunxi@googlegroups.com,
 Michal Suchanek <hramrach@gmail.com>, Scott Wood <scottwood@freescale.com>
Subject: Re: [PATCH 1/4] mtd: nand: Fix NAND_* options to use unique values.
Message-ID: <20150729181327.GU8876@google.com>
References: <1438192434-18363-1-git-send-email-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1438192434-18363-1-git-send-email-hdegoede@redhat.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jul 29, 2015 at 07:53:51PM +0200, Hans de Goede wrote:
> From: Michal Suchanek <hramrach@gmail.com>
> 
> NAND_BUSWIDTH_AUTO (64b37b2a6) and NAND_USE_BOUNCE_BUFFER (66507c7bc)
> are the same value. Change the later introduced NAND_USE_BOUNCE_BUFFER
> to a different value.
> 
> Signed-off-by: Michal Suchanek <hramrach@gmail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Thanks for the fix! But Scott already caught this one. The fix is in
4.2-rc already as commit 5f867db63473 ("mtd: nand: Fix
NAND_USE_BOUNCE_BUFFER flag conflict").

(Obligatory: please base your MTD patches on l2-mtd.git, or
linux-next.git if necessary [1].)

Regards,
Brian

[1] http://linux-mtd.infradead.org/source.html
