Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X202Y-0008LJ-85
 for linux-mtd@lists.infradead.org; Tue, 01 Jul 2014 15:32:14 +0000
Message-ID: <1404228681.6841.130.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] UBIFS: fix some comments
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Randy Dunlap <rdunlap@infradead.org>
Date: Tue, 01 Jul 2014 18:31:21 +0300
In-Reply-To: <53B2D378.7010006@infradead.org>
References: <1404225925-3347-1-git-send-email-waydi1@gmail.com>
 <53B2D378.7010006@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-fsdevel@vger.kernel.org, Seunghun Lee <waydi1@gmail.com>,
 linux-mtd@lists.infradead.org, adrian.hunter@intel.com,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2014-07-01 at 08:27 -0700, Randy Dunlap wrote:
> > - * This function returns %0 on success and a negative error code on failure.
> > + * This function returns the scaned information on success and a negative error
> 
>                                 scanned

I'll correct this, thanks!

-- 
Best Regards,
Artem Bityutskiy
