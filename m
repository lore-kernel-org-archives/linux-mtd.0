Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V5Hif-0006wk-6Y
 for linux-mtd@lists.infradead.org; Fri, 02 Aug 2013 15:56:45 +0000
Message-ID: <1375459275.14869.353.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: diskonchip: remove unused entries in Kconfig
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Michael Opdenacker <michael.opdenacker@free-electrons.com>
Date: Fri, 02 Aug 2013 19:01:15 +0300
In-Reply-To: <1373258360-22702-1-git-send-email-michael.opdenacker@free-electrons.com>
References: <1373258360-22702-1-git-send-email-michael.opdenacker@free-electrons.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: keescook@chromium.org, arnd@arndb.de, dwmw2@infradead.org,
 rdunlap@infradead.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, shijie8@gmail.com, robert.jarzmik@free.fr
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2013-07-08 at 06:39 +0200, Michael Opdenacker wrote:
> This patch proposes to remove kernel configuration parameters
> defined in drivers/mtd/devices/Kconfig, but used nowhere
> in the makefiles and source code (except in comments).
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@free-electrons.com>

Pushed to l2-mtd.git, thanks! 

-- 
Best Regards,
Artem Bityutskiy
