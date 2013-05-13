Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UbmpV-0005ra-J0
 for linux-mtd@lists.infradead.org; Mon, 13 May 2013 07:05:54 +0000
Message-ID: <1368428882.5360.3.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 3/8] mtd: use generic helper to set max_discard_sectors
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Namjae Jeon <linkinjeon@gmail.com>
Date: Mon, 13 May 2013 10:08:02 +0300
In-Reply-To: <1365860324-21295-1-git-send-email-linkinjeon@gmail.com>
References: <1365860324-21295-1-git-send-email-linkinjeon@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: axboe@kernel.dk, nbd-general@lists.sourceforge.net,
 Vivek Trivedi <t.vivek@samsung.com>, npiggin@kernel.dk, neilb@suse.de,
 dwmw2@infradead.org, Paul.Clements@steeleye.com, adrian.hunter@intel.com,
 linux-kernel@vger.kernel.org, linux-raid@vger.kernel.org,
 Namjae Jeon <namjae.jeon@samsung.com>, linux-mtd@lists.infradead.org,
 linux-mmc@vger.kernel.org, cjb@laptop.org, shli@kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2013-04-13 at 22:38 +0900, Namjae Jeon wrote:
> From: Namjae Jeon <namjae.jeon@samsung.com>
> 
> It is better to use blk_queue_max_discard_sectors helper
> function to set max_discard_sectors as it checks
> max_discard_sectors upper limit UINT_MAX >> 9
> 
> similar issue was reported for mmc in below link
> https://lkml.org/lkml/2013/4/1/292

Pushed to l2-mtd.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
