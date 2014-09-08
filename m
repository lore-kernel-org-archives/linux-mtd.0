Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XQwAC-0004hq-T3
 for linux-mtd@lists.infradead.org; Mon, 08 Sep 2014 10:27:13 +0000
Message-ID: <1410172009.10764.135.camel@sauron.fi.intel.com>
Subject: Re: [PATCH][V2] UBI: block: fix dereference on uninitialized dev
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Date: Mon, 08 Sep 2014 13:26:49 +0300
In-Reply-To: <20140821191246.GA13322@arch.cereza>
References: <1408526378-12972-1-git-send-email-colin.king@canonical.com>
 <20140821191246.GA13322@arch.cereza>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Colin King <colin.king@canonical.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2014-08-21 at 16:12 -0300, Ezequiel Garcia wrote:
> On 20 Aug 10:19 AM, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> > 
> > commit 4df38926f337 ("UBI: block: Avoid disk size integer overflow")
> > introduced a dereference on dev (which is not initialized at that
> > point) when printing a warning message.  Re-order disk_capacity check
> > after the dev is found.
> > 
> > Found by cppcheck:
> >  [drivers/mtd/ubi/block.c:509]: (error) Uninitialized variable: dev
> > 
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> Acked-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>

Do we want to have this patch in @stable?

-- 
Best Regards,
Artem Bityutskiy
