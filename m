Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wpbf9-0002AQ-Di
 for linux-mtd@lists.infradead.org; Wed, 28 May 2014 11:04:51 +0000
Message-ID: <1401275067.2118.9.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v2] mtd-utils: integck: add support for volume specific
 power-cut test
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mats =?ISO-8859-1?Q?K=E4rrman?= <Mats.Karrman@tritech.se>
Date: Wed, 28 May 2014 14:04:27 +0300
In-Reply-To: <ED3E0BCACD909541BA94A34C4A164D4C5B4097B0@post.tritech.se>
References: <ED3E0BCACD909541BA94A34C4A164D4C5B401901@post.tritech.se>
 ,<1401194249.1304.140.camel@sauron.fi.intel.com>
 <ED3E0BCACD909541BA94A34C4A164D4C5B4091B2@post.tritech.se>
 ,<1401202545.1304.164.camel@sauron.fi.intel.com>
 <ED3E0BCACD909541BA94A34C4A164D4C5B4094CF@post.tritech.se>
 ,<1401269453.2118.5.camel@sauron.fi.intel.com>
 <ED3E0BCACD909541BA94A34C4A164D4C5B4097B0@post.tritech.se>
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

On Wed, 2014-05-28 at 10:52 +0000, Mats Kärrman wrote:
> How about having two options, one for global and one for per-fs enable,
> both automatically selecting the appropriate sysfs file and with an
> improved help text?

Should work too.

-- 
Best Regards,
Artem Bityutskiy
