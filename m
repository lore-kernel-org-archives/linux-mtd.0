Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VBLCM-0007o6-7R
 for linux-mtd@lists.infradead.org; Mon, 19 Aug 2013 08:52:30 +0000
From: Julia Lawall <Julia.Lawall@lip6.fr>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 0/6] simplify
 platform_get_resource_byname/devm_ioremap_resource
Date: Mon, 19 Aug 2013 10:51:50 +0200
Message-Id: <1376902316-18520-1-git-send-email-Julia.Lawall@lip6.fr>
Cc: linux-mips@linux-mips.org, alsa-devel@alsa-project.org,
 linux-watchdog@vger.kernel.org, linux-usb@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

devm_ioremap_resource often uses the result of a call to
platform_get_resource_byname as its last argument.  devm_ioremap_resource
does appropriate error handling on this argument, so error handling can be
removed from the call to platform_get_resource_byname.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression pdev,res,n,e,e1;
expression ret != 0;
identifier l,f;
expression list es;
@@

(
  res = f(...);
- if (res == NULL) { ... \(goto l;\|return ret;\) }
  e = devm_ioremap_resource(e1, res);
|
- res = f(es);
  ... when != res
- if (res == NULL) { ... \(goto l;\|return ret;\) }
  ... when != res
+ res = f(es);
  e = devm_ioremap_resource(e1, res);
)
// </smpl>

In practice, f is always platform_get_resource_byname (or
platform_get_resource, which was handled by a previous patch series).  And
the call to platform_get_resource_byname always immediately precedes the
call to devm_ioremap_resource.
