Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ubmmn-0005kJ-VR
 for linux-mtd@lists.infradead.org; Mon, 13 May 2013 07:03:06 +0000
Message-ID: <1368428717.5360.1.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 0/7] mtd: nand: pxa3xx cleanup
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Date: Mon, 13 May 2013 10:05:17 +0300
In-Reply-To: <1366216694-2365-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1366216694-2365-1-git-send-email-ezequiel.garcia@free-electrons.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Lior Amsalem <alior@marvell.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lei Wen <leiwen@marvell.com>, Eric Miao <eric.miao@linaro.org>,
 linux-mtd@lists.infradead.org,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Zhangfei Gao <zhangfei.gao@linaro.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2013-04-17 at 13:38 -0300, Ezequiel Garcia wrote:
> This is a small set of cleanups for pxa3xx. Tested by compilation only.
> 
> Although the patches are somewhat simple, it would be wise to have some
> testing before applying them.

Looks OK to me, but I'd like to compile-test it before applying. Would
you please send me a defconfig that I can use for compile-testing?

-- 
Best Regards,
Artem Bityutskiy
