Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xu0yw-00072e-V2
 for linux-mtd@lists.infradead.org; Thu, 27 Nov 2014 15:27:47 +0000
Message-ID: <1417102042.5858.102.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 2/6] UBI: Fastmap: Ensure that only one fastmap work is
 scheduled
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Richard Weinberger <richard@nod.at>
Date: Thu, 27 Nov 2014 17:27:22 +0200
In-Reply-To: <1416835236-25185-3-git-send-email-richard@nod.at>
References: <1416835236-25185-1-git-send-email-richard@nod.at>
 <1416835236-25185-3-git-send-email-richard@nod.at>
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

On Mon, 2014-11-24 at 14:20 +0100, Richard Weinberger wrote:
> If the WL pool runs out of PEBs we schedule a fastmap write
> to refill it as soon as possible.
> Ensure that only one at a time is scheduled otherwise we might end in
> a fastmap write storm because writing the fastmap can schedule another
> write if bitflips are detected.

Could you please provide some more details about the "write storm". Does
it happen when there are 2 fastmap works in the queue? Or if they run
simultaneously? Why the storm happens and white kind of "writes" it
consists of?

Thanks!
