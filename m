Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dWzOJ-0006k2-Bq
 for linux-mtd@lists.infradead.org; Mon, 17 Jul 2017 06:20:24 +0000
Received: by mail-pf0-x242.google.com with SMTP id q85so18467315pfq.2
 for <linux-mtd@lists.infradead.org>; Sun, 16 Jul 2017 23:20:02 -0700 (PDT)
Message-ID: <1500272347.8256.0.camel@gmail.com>
Subject: Re: [PATCH v3 01/10] mtd: powernv_flash: Use WARN_ON_ONCE() rather
 than BUG_ON()
From: Balbir Singh <bsingharora@gmail.com>
To: Cyril Bur <cyrilbur@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-mtd@lists.infradead.org
Cc: stewart@linux.vnet.ibm.com, alistair@popple.id.au, dwmw2@infradead.org,
 rlippert@google.com
Date: Mon, 17 Jul 2017 16:19:07 +1000
In-Reply-To: <20170712042304.19745-2-cyrilbur@gmail.com>
References: <20170712042304.19745-1-cyrilbur@gmail.com>
 <20170712042304.19745-2-cyrilbur@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2017-07-12 at 14:22 +1000, Cyril Bur wrote:
> BUG_ON() should be reserved in situations where we can not longer
> guarantee the integrity of the system. In the case where
> powernv_flash_async_op() receives an impossible op, we can still
> guarantee the integrity of the system.
> 
> Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
> ---

Looks reasonable

Acked-by: Balbir Singh <bsingharora@gmail.com>
