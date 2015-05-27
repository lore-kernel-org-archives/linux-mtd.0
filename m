Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YxVl2-0001Rq-7n
 for linux-mtd@lists.infradead.org; Wed, 27 May 2015 07:28:08 +0000
Message-ID: <1432711648.2703.152.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] ubifs: fix to check error code of register_shrinker
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Richard Weinberger <richard@nod.at>
Date: Wed, 27 May 2015 10:27:28 +0300
In-Reply-To: <55645910.9010706@nod.at>
References: <003001d09146$c124b150$436e13f0$@samsung.com>
 <000301d097a6$6f3f9e70$4dbedb50$@samsung.com> <55645910.9010706@nod.at>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Chao Yu <chao2.yu@samsung.com>, linux-mtd@lists.infradead.org,
 adrian.hunter@intel.com, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2015-05-26 at 13:29 +0200, Richard Weinberger wrote:
> Am 26.05.2015 um 13:23 schrieb Chao Yu:
> > Ping.
> > 
> > Add Cc Richard Weinberger.
> 
> Patch looks good to me.
> Artem, if you don't mind I'd pick it up for the 4.2 queue.

Yes, please, thanks!

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
