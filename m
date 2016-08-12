Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bYEZH-0001mT-FE
 for linux-mtd@lists.infradead.org; Fri, 12 Aug 2016 15:40:19 +0000
Message-ID: <1471016396.29184.11.camel@linux.intel.com>
Subject: Re: [PATCH] UBIFS: fix assertion in layout_in_gaps()
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Reply-To: artem.bityutskiy@linux.intel.com
To: Vincent =?ISO-8859-1?Q?Stehl=E9?= <vincent.stehle@intel.com>,
 linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Date: Fri, 12 Aug 2016 18:39:56 +0300
In-Reply-To: <1471008390-19227-1-git-send-email-vincent.stehle@intel.com>
References: <1471008390-19227-1-git-send-email-vincent.stehle@intel.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2016-08-12 at 15:26 +0200, Vincent Stehlé wrote:
> An assertion in layout_in_gaps() verifies that the gap_lebs pointer
> is
> below the maximum bound. When computing this maximum bound the
> idx_lebs
> count is multiplied by sizeof(int), while C pointers arithmetic does
> take
> into account the size of the pointed elements implicitly already.
> Remove
> the multiplication to fix the assertion.
> 
> Fixes: 1e51764a3c2ac05a ("UBIFS: add new flash file system")
> Signed-off-by: Vincent Stehlé <vincent.stehle@intel.com>
> Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Thanks!

-- 
Best Regards,
Artem Bityutskiy
