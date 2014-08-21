Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XKXoO-0001Cs-1a
 for linux-mtd@lists.infradead.org; Thu, 21 Aug 2014 19:14:16 +0000
Date: Thu, 21 Aug 2014 16:12:46 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Colin King <colin.king@canonical.com>
Subject: Re: [PATCH][V2] UBI: block: fix dereference on uninitialized dev
Message-ID: <20140821191246.GA13322@arch.cereza>
References: <1408526378-12972-1-git-send-email-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1408526378-12972-1-git-send-email-colin.king@canonical.com>
Cc: linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 20 Aug 10:19 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> commit 4df38926f337 ("UBI: block: Avoid disk size integer overflow")
> introduced a dereference on dev (which is not initialized at that
> point) when printing a warning message.  Re-order disk_capacity check
> after the dev is found.
> 
> Found by cppcheck:
>  [drivers/mtd/ubi/block.c:509]: (error) Uninitialized variable: dev
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Acked-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>

Thanks a lot,
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
