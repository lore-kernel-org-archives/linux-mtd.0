Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UDxAy-0001AV-JV
 for linux-mtd@lists.infradead.org; Fri, 08 Mar 2013 13:17:36 +0000
Message-ID: <1362748695.5101.1.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: maps: Remove redundant NULL check before kfree
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Syam Sidhardhan <syamsidhardh@gmail.com>
Date: Fri, 08 Mar 2013 15:18:15 +0200
In-Reply-To: <1361908016-3110-1-git-send-email-s.syam@samsung.com>
References: <1361908016-3110-1-git-send-email-s.syam@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2013-02-27 at 01:16 +0530, Syam Sidhardhan wrote:
> kfree on NULL pointer is a no-op.
> 
> Signed-off-by: Syam Sidhardhan <s.syam@samsung.com>

Pushed to l2-mtd.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
