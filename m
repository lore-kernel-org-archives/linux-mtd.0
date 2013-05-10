Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UaoVT-0007vj-Rm
 for linux-mtd@lists.infradead.org; Fri, 10 May 2013 14:41:12 +0000
Message-ID: <1368197016.26780.171.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] drivers: mtd: devices: convert to devm_ioremap_resource()
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Silviu-Mihai Popescu <silviupopescu1990@gmail.com>
Date: Fri, 10 May 2013 17:43:36 +0300
In-Reply-To: <1365627711-17476-1-git-send-email-silviupopescu1990@gmail.com>
References: <1365627711-17476-1-git-send-email-silviupopescu1990@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2013-04-11 at 00:01 +0300, Silviu-Mihai Popescu wrote:
> Convert all uses of devm_request_and_ioremap() to the newly introduced
> devm_ioremap_resource() which provides more consistent error handling.
> 
> Signed-off-by: Silviu-Mihai Popescu <silviupopescu1990@gmail.com>

Pushed to l2-mtd.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
