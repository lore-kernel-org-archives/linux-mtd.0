Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XTudC-0003Wu-GO
 for linux-mtd@lists.infradead.org; Tue, 16 Sep 2014 15:25:26 +0000
Message-ID: <1410880907.28850.50.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] UBI: add missing kmem_cache_free() in process_pool_aeb
 error path
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Richard Genoud <richard.genoud@gmail.com>
Date: Tue, 16 Sep 2014 18:21:47 +0300
In-Reply-To: <1410265519-25111-1-git-send-email-richard.genoud@gmail.com>
References: <1410265519-25111-1-git-send-email-richard.genoud@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2014-09-09 at 14:25 +0200, Richard Genoud wrote:
> I ran into this error after a ubiupdatevol, because I forgot to backport
> e9110361a9a4 UBI: fix the volumes tree sorting criteria.

Pushed, thanks!

-- 
Best Regards,
Artem Bityutskiy
