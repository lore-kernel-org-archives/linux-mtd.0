Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xa3tT-0004sD-KT
 for linux-mtd@lists.infradead.org; Fri, 03 Oct 2014 14:31:40 +0000
Message-ID: <1412346676.3795.62.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 3/4] UBI: Fastmap: Care about the protection queue
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Richard Weinberger <richard@nod.at>
Date: Fri, 03 Oct 2014 17:31:16 +0300
In-Reply-To: <1412029248-22454-4-git-send-email-richard@nod.at>
References: <1412029248-22454-1-git-send-email-richard@nod.at>
 <1412029248-22454-4-git-send-email-richard@nod.at>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2014-09-30 at 00:20 +0200, Richard Weinberger wrote:
> +
> +	for (i = 0; i < UBI_PROT_QUEUE_LEN; i++) {
> +		list_for_each_entry(wl_e, &ubi->pq[i], u.list) {
> +			fec = (struct ubi_fm_ec *)(fm_raw + fm_pos);

Similarly to my other posts, is it possible to not touch the WL-internal
things like 'ubi->pq[]' from fastmap.c? Can we come up with a function
at wl.c which fastmap.c could call instead?
