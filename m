Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VBRC7-0001DH-VZ
 for linux-mtd@lists.infradead.org; Mon, 19 Aug 2013 15:16:36 +0000
Message-ID: <1376925707.2089.493.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] UBI: Fix PEB leak in wear_leveling_worker()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Weinberger <richard@nod.at>
Date: Mon, 19 Aug 2013 18:21:47 +0300
In-Reply-To: <1376894892-31519-1-git-send-email-richard@nod.at>
References: <1376894892-31519-1-git-send-email-richard@nod.at>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2013-08-19 at 08:48 +0200, Richard Weinberger wrote:
> get_peb_for_wl() removes the PEB from the free list.
> If the WL subsystem detects that no wear leveling is needed
> it cancels the operation and drops the gained PEB.
> In this case we have to put the PEB back into the free list.
> 
> This issue was introduced with commit ed4b7021c
> (UBI: remove PEB from free tree in get_peb_for_wl()).
> 
> Cc: <stable@vger.kernel.org> # 3.7.x
> Signed-off-by: Richard Weinberger <richard@nod.at>

Pushed to linux-ubi.git, thanks.

And special thanks for taking care about Ccing -stable.

-- 
Best Regards,
Artem Bityutskiy
