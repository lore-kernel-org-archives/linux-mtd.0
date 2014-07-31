Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XCpsv-0007Tu-GG
 for linux-mtd@lists.infradead.org; Thu, 31 Jul 2014 12:55:05 +0000
Message-ID: <1406811281.20616.6.camel@sauron.fi.intel.com>
Subject: Re: [PATCH resend] UBIFS: Add log overlap assertions
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: hujianyang <hujianyang@huawei.com>
Date: Thu, 31 Jul 2014 15:54:41 +0300
In-Reply-To: <53D85A81.3010106@huawei.com>
References: <53D85A81.3010106@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2014-07-30 at 10:37 +0800, hujianyang wrote:
> We use a circle area to record the log nodes in ubifs. This log area
> should not be overlapped. But after researching the code, I found
> some conditions may lead log head wraps log ltail. Although we've
> fixed the problems discovered, there may be some other issues still
> left.
> 
> This patch adds assertions where lhead changes to next leb to make
> sure ltail is not wrapped.

Pushed to linux-ubifs.

-- 
Best Regards,
Artem Bityutskiy
