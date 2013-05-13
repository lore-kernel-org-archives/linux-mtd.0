Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ubnde-0006og-F7
 for linux-mtd@lists.infradead.org; Mon, 13 May 2013 07:57:44 +0000
Message-ID: <1368431995.5360.26.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: Convert logging messages
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Joe Perches <joe@perches.com>
Date: Mon, 13 May 2013 10:59:55 +0300
In-Reply-To: <1366394375.3901.36.camel@joe-AO722>
References: <1366394375.3901.36.camel@joe-AO722>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>, Joern Engel <joern@lazybastard.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2013-04-19 at 10:59 -0700, Joe Perches wrote:
> Use a more current logging style.
> 
> Convert homegrown ERROR/INFO macros to pr_<level>.
> Convert homegrown parse_err macros to pr_err and
> expand hidden flow control.
> 
> Signed-off-by: Joe Perches <joe@perches.com>

Pushed to l2-mtd.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
