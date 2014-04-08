Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WXWMt-0007nB-Qs
 for linux-mtd@lists.infradead.org; Tue, 08 Apr 2014 13:47:16 +0000
Message-ID: <1396964546.26672.65.camel@sauron.fi.intel.com>
Subject: Re: [RFC/PATCH] mtd: ubi: Free peb's synchronously for fastmap
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Tanya Brokhman <tlinder@codeaurora.org>
Date: Tue, 08 Apr 2014 16:42:26 +0300
In-Reply-To: <1396339305-16005-1-git-send-email-tlinder@codeaurora.org>
References: <1396339305-16005-1-git-send-email-tlinder@codeaurora.org>
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

On Tue, 2014-04-01 at 11:01 +0300, Tanya Brokhman wrote:
> At first mount it's possible that there are not enough free PEBs since
> there are PEB's pending to be erased. In such scenario, fm_pool (which is
> the pool from which user required PEBs are allocated) will be empty.
> Try fixing the above described situation by synchronously performing
> pending erase work, thus produce another free PEB.
> 
> Signed-off-by: Tatyana Brokhman <tlinder@codeaurora.org>

Pushed to linux-ubifs.git / master, thanks!

-- 
Best Regards,
Artem Bityutskiy
