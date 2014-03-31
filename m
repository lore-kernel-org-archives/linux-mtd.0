Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WUYvA-0003QW-5A
 for linux-mtd@lists.infradead.org; Mon, 31 Mar 2014 09:54:24 +0000
Message-ID: <1396259602.9016.61.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] ubi-utils: Fix file descriptor leaks in libubi
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Daniel van Gerpen <daniel@vangerpen.de>
Date: Mon, 31 Mar 2014 12:53:22 +0300
In-Reply-To: <20140330005210.6df43941@abel>
References: <20140330005210.6df43941@abel>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2014-03-30 at 00:52 +0100, Daniel van Gerpen wrote:
> Signed-off-by: Daniel van Gerpen <daniel@vangerpen.de>

Tweaked a bit and pushed to mtd-utils, thanks!

-- 
Best Regards,
Artem Bityutskiy
