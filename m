Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WkCoa-0004Lc-V6
 for linux-mtd@lists.infradead.org; Tue, 13 May 2014 13:32:20 +0000
Message-ID: <1399987913.1797.46.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 2/2] mtd-utils: integck: add support for volume specific
 power-cut test
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mats =?ISO-8859-1?Q?K=E4rrman?= <Mats.Karrman@tritech.se>
Date: Tue, 13 May 2014 16:31:53 +0300
In-Reply-To: <ED3E0BCACD909541BA94A34C4A164D4C5B3EF5E5@post.tritech.se>
References: <ED3E0BCACD909541BA94A34C4A164D4C5B3D11F5@post.tritech.se>
 , <1397567532.4441.9.camel@karhu>
 <ED3E0BCACD909541BA94A34C4A164D4C5B3D17D4@post.tritech.se>
 ,<1399978838.1797.35.camel@sauron.fi.intel.com>
 <ED3E0BCACD909541BA94A34C4A164D4C5B3EF5E5@post.tritech.se>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2014-05-13 at 12:59 +0000, Mats Kärrman wrote:
> 
> So, what you're suggesting is that we should change integck so that:
> a) it has only one power-cut emulation switch: -p
> b) this switch should enable (and re-enable) power-cut emulation per
> fs instance (always).

Yes, I think so.

-- 
Best Regards,
Artem Bityutskiy
