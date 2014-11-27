Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xu0Sn-0005lK-Tu
 for linux-mtd@lists.infradead.org; Thu, 27 Nov 2014 14:54:34 +0000
Message-ID: <1417100049.5858.98.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/6] UBI: Fastmap: Care about the protection queue
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Richard Weinberger <richard@nod.at>
Date: Thu, 27 Nov 2014 16:54:09 +0200
In-Reply-To: <1416835236-25185-2-git-send-email-richard@nod.at>
References: <1416835236-25185-1-git-send-email-richard@nod.at>
 <1416835236-25185-2-git-send-email-richard@nod.at>
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
> Fastmap can miss a PEB if it is in the protection queue
> and not jet in the used tree.
> Treat every protected PEB as used.
> 
> Signed-off-by: Richard Weinberger <richard@nod.at>

Picked this one and pushed, thanks!
