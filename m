Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X7IZd-0004qC-Hw
 for linux-mtd@lists.infradead.org; Wed, 16 Jul 2014 06:20:17 +0000
Message-ID: <1405491585.1829.23.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/1] fs/ubifs/super.c: replace seq_printf by seq_puts
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Fabian Frederick <fabf@skynet.be>
Date: Wed, 16 Jul 2014 09:19:45 +0300
In-Reply-To: <1405452395-9296-1-git-send-email-fabf@skynet.be>
References: <1405452395-9296-1-git-send-email-fabf@skynet.be>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2014-07-15 at 21:26 +0200, Fabian Frederick wrote:
> Fix checkpatch warnings:
> "WARNING: Prefer seq_puts to seq_printf"

Applied to linux-ubifs.git, added Andrew's comments there, thanks.

-- 
Best Regards,
Artem Bityutskiy
