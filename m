Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WpYrJ-0000Fx-Pz
 for linux-mtd@lists.infradead.org; Wed, 28 May 2014 08:05:15 +0000
Message-ID: <1401264290.983.15.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] ubifs: add missing ui pointer in debugging code
From: Artem Bityutskiy <dedekind1@gmail.com>
To: hujianyang <hujianyang@huawei.com>
Date: Wed, 28 May 2014 11:04:50 +0300
In-Reply-To: <53854980.2000204@huawei.com>
References: <20140513202750.GA27516@earthship.olsr.leipzig.freifunk.net>
 <53731C00.1020203@huawei.com>
 <1401193701.1304.135.camel@sauron.fi.intel.com>
 <53854980.2000204@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

On Wed, 2014-05-28 at 10:27 +0800, hujianyang wrote:
> Hi Artem,
> 
> I think you made a small mistake:

Indeed, and not that small, even. I'll fix this, thanks!

If I was writing this code now, I would not bother using shifts, I'd
just use divisions, which are simpler and less error-prone. And modern
compilers are smart enough to optimize the code to use shifts when the
divider is a constant.

-- 
Best Regards,
Artem Bityutskiy
