Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xm2j2-0001Sv-07
 for linux-mtd@lists.infradead.org; Wed, 05 Nov 2014 15:42:24 +0000
Message-ID: <1415202120.958.123.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 05/35] UBI: Fastmap: Ensure that only one fastmap work
 is scheduled
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Richard Weinberger <richard@nod.at>
Date: Wed, 05 Nov 2014 17:42:00 +0200
In-Reply-To: <1414586758-9972-6-git-send-email-richard@nod.at>
References: <1414586758-9972-1-git-send-email-richard@nod.at>
 <1414586758-9972-6-git-send-email-richard@nod.at>
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
>  	struct ubi_device *ubi = container_of(wrk, struct ubi_device, fm_work);
>  	ubi_update_fastmap(ubi);
> +	spin_lock(&ubi->wl_lock);
> +	ubi->fm_work_scheduled = 0;
> +	spin_unlock(&ubi->wl_lock);
>  }

Why is the 'update_fastmap_work_fn()' function in wl.c? Can we move it
to fastmap.c?
