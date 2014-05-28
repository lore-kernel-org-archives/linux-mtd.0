Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WpaBE-0006Cw-Sa
 for linux-mtd@lists.infradead.org; Wed, 28 May 2014 09:29:53 +0000
Message-ID: <1401269369.2118.4.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v2] ubifs: respect MS_SILENT mount flag
From: Artem Bityutskiy <dedekind1@gmail.com>
To: hujianyang <hujianyang@huawei.com>
Date: Wed, 28 May 2014 12:29:29 +0300
In-Reply-To: <5385A16A.4070807@huawei.com>
References: <1401193128.1304.132.camel@sauron.fi.intel.com>
 <20140527141030.GA3130@earthship.local>
 <1401202595.1304.165.camel@sauron.fi.intel.com>
 <5384B772.4030506@makrotopia.org> <538545B4.7070103@huawei.com>
 <1401264104.983.12.camel@sauron.fi.intel.com>
 <1401264446.983.17.camel@sauron.fi.intel.com>
 <1401264889.983.19.camel@sauron.fi.intel.com>
 <1401265736.2118.2.camel@sauron.fi.intel.com> <5385A16A.4070807@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2014-05-28 at 16:42 +0800, hujianyang wrote:
> In this way we can disable unnecessary messages during mount if we use "slient"
> flag. I have a simple question，Is this @probing safe during mount? Are there
> some probably race conditions of it? I have no experiences of these.

I do not think so, the mount path is "single-stream".


-- 
Best Regards,
Artem Bityutskiy
