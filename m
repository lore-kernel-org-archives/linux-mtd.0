Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VBQhu-0008Id-H3
 for linux-mtd@lists.infradead.org; Mon, 19 Aug 2013 14:45:23 +0000
Message-ID: <1376923842.2089.480.camel@sauron.fi.intel.com>
Subject: Re: [RFC] mtd-utils: integck: add support for volume specific
 power-cut test
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mats =?ISO-8859-1?Q?K=E4rrman?= <Mats.Karrman@tritech.se>
Date: Mon, 19 Aug 2013 17:50:42 +0300
In-Reply-To: <ED3E0BCACD909541BA94A34C4A164D4C4FCDC6D3@post.tritech.se>
References: <ED3E0BCACD909541BA94A34C4A164D4C4FCDC571@post.tritech.se>
 ,<1376919409.2089.463.camel@sauron.fi.intel.com>
 <ED3E0BCACD909541BA94A34C4A164D4C4FCDC6D3@post.tritech.se>
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

On Mon, 2013-08-19 at 14:24 +0000, Mats Kärrman wrote:
> # echo "1" > /sys/kernel/debug/ubifs/ubi1_0/tst_recovery
> 
> However, in the latter case, the flag is reset when the file system is
> remounted
> so the test continues without tst_recovery enabled.

Ah, I see it now.

Did you try if you can resolve the mount path into 'ubiX_Y' in integck,
so that one wouldn't need to pass this -P <loong/path/string> option?

-- 
Best Regards,
Artem Bityutskiy
