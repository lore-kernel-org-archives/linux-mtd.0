Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xm2Jh-0002v3-4C
 for linux-mtd@lists.infradead.org; Wed, 05 Nov 2014 15:16:13 +0000
Message-ID: <1415200447.958.109.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 02/35] UBI: Fix stale pointers in ubi->lookuptbl
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Richard Weinberger <richard@nod.at>
Date: Wed, 05 Nov 2014 17:14:07 +0200
In-Reply-To: <1414586758-9972-3-git-send-email-richard@nod.at>
References: <1414586758-9972-1-git-send-email-richard@nod.at>
 <1414586758-9972-3-git-send-email-richard@nod.at>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 tlinder@codeaurora.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2014-10-29 at 13:45 +0100, Richard Weinberger wrote:
> +			ubi->lookuptbl[e2->pnum] = NULL;
>  			kmem_cache_free(ubi_wl_entry_slab, e2);

Since these 2 must always go together, they really deserve a separate
helper function.
