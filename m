Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WXWv7-0000IL-3C
 for linux-mtd@lists.infradead.org; Tue, 08 Apr 2014 14:22:41 +0000
Message-ID: <1396965172.30750.0.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] ubi: avoid workqueue format string leak
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Kees Cook <keescook@chromium.org>
Date: Tue, 08 Apr 2014 16:52:52 +0300
In-Reply-To: <20140408044407.GA13141@www.outflux.net>
References: <20140408044407.GA13141@www.outflux.net>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2014-04-07 at 21:44 -0700, Kees Cook wrote:
> When building the name for the workqueue thread, make sure a format
> string cannot leak in from the disk name.
> 
> Signed-off-by: Kees Cook <keescook@chromium.org>

Pushed to linux-ubifs / master, thanks!

-- 
Best Regards,
Artem Bityutskiy
