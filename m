Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UDvzX-0008Gh-6N
 for linux-mtd@lists.infradead.org; Fri, 08 Mar 2013 12:01:43 +0000
Message-ID: <1362744144.21850.196.camel@sauron>
Subject: Re: [PATCH 1/2] mtd: m25p80: introduce SST_WRITE flag for SST byte
 programming
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Krzysztof Mazur <krzysiek@podlesie.net>
Date: Fri, 08 Mar 2013 14:02:24 +0200
In-Reply-To: <1361544666-7148-1-git-send-email-krzysiek@podlesie.net>
References: <1361544666-7148-1-git-send-email-krzysiek@podlesie.net>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2013-02-22 at 15:51 +0100, Krzysztof Mazur wrote:
> Not all SST devices implement the SST byte programming command.
> Some devices (like SST25VF064C) implement only standard m25p80 page
> write command.
> 
> Now SPI flash devices that need sst_write() are explicitly marked
> with new SST_WRITE flag and the decision to use sst_write() is based
> on this flag instead of manufacturer id.
> 
> Signed-off-by: Krzysztof Mazur <krzysiek@podlesie.net>

Pushed both to l2-mtd.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
