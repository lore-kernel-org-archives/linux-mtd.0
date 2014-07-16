Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X7IQo-00026W-P7
 for linux-mtd@lists.infradead.org; Wed, 16 Jul 2014 06:11:16 +0000
Message-ID: <1405491038.1829.20.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/1] fs/ubifs/super.c: replace count*size kzalloc by
 kcalloc
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Fabian Frederick <fabf@skynet.be>
Date: Wed, 16 Jul 2014 09:10:38 +0300
In-Reply-To: <1403541683-10898-1-git-send-email-fabf@skynet.be>
References: <1403541683-10898-1-git-send-email-fabf@skynet.be>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Adrian Hunter <adrian.hunter@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2014-06-23 at 18:41 +0200, Fabian Frederick wrote:
> kcalloc manages count*sizeof overflow.
> 
> Cc: Artem Bityutskiy <dedekind1@gmail.com>
> Cc: Adrian Hunter <adrian.hunter@intel.com>
> Cc: linux-mtd@lists.infradead.org
> Signed-off-by: Fabian Frederick <fabf@skynet.be>

In the commit message, please, try to not only tell _what_ you do,
but also _why_ you do this. And ideally, but not necessary for this
case, I think, how this was tested (e.g., compile-tested only).

Thanks! I'll apply this patch, and amend the commit message so that it
tells that kcalloc() makes better bob of the overflow checking.

-- 
Best Regards,
Artem Bityutskiy
