Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VBlcT-0003ZP-Lb
 for linux-mtd@lists.infradead.org; Tue, 20 Aug 2013 13:05:10 +0000
Message-ID: <1377004210.2089.556.camel@sauron.fi.intel.com>
Subject: Re: [RFC] mtd-utils: integck: add support for volume specific
 power-cut test
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mats =?ISO-8859-1?Q?K=E4rrman?= <Mats.Karrman@tritech.se>
Date: Tue, 20 Aug 2013 16:10:10 +0300
In-Reply-To: <1377001384.2089.541.camel@sauron.fi.intel.com>
References: <ED3E0BCACD909541BA94A34C4A164D4C4FCDC571@post.tritech.se>
 ,<1376919409.2089.463.camel@sauron.fi.intel.com>
 <ED3E0BCACD909541BA94A34C4A164D4C4FCDC6D3@post.tritech.se>
 <1376923842.2089.480.camel@sauron.fi.intel.com>
 ,<1376924118.2089.482.camel@sauron.fi.intel.com>
 <ED3E0BCACD909541BA94A34C4A164D4C4FCDC729@post.tritech.se>
 ,<1376925394.2089.491.camel@sauron.fi.intel.com>
 <ED3E0BCACD909541BA94A34C4A164D4C4FCDC77F@post.tritech.se>
 <1377001384.2089.541.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

On Tue, 2013-08-20 at 15:23 +0300, Artem Bityutskiy wrote:
> Then if you have name instead of the volume number (Y), you use libubi
> and resolve it like this:

Take a loot at ubirmvol.c in mtd-utils and use it as an example, it is
doing a similar thing, but not exactly the same.

-- 
Best Regards,
Artem Bityutskiy
