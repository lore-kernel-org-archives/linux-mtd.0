Received: from mga09.intel.com ([134.134.136.24])
 by casper.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WXWl8-0002jF-FW
 for linux-mtd@lists.infradead.org; Tue, 08 Apr 2014 14:12:19 +0000
Message-ID: <1396964674.26672.68.camel@sauron.fi.intel.com>
Subject: Re: [RFC/PATCH] mtd: ubi: Fix ubi free PEBs count calculation
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Tanya Brokhman <tlinder@codeaurora.org>
Date: Tue, 08 Apr 2014 16:44:34 +0300
In-Reply-To: <1396339327-16090-1-git-send-email-tlinder@codeaurora.org>
References: <1396339327-16090-1-git-send-email-tlinder@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, open list <linux-kernel@vger.kernel.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2014-04-01 at 11:02 +0300, Tanya Brokhman wrote:
> The ubi->free_count should be updated with every insert/remove to/from
> the ubi->free list.
> 
> Signed-off-by: Tanya Brokhman <tlinder@codeaurora.org>

Pushed to linux-ubifs.git / master, thanks!

-- 
Best Regards,
Artem Bityutskiy
