Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wa3Am-0006Hd-55
 for linux-mtd@lists.infradead.org; Tue, 15 Apr 2014 13:13:13 +0000
Message-ID: <1397567532.4441.9.camel@karhu>
Subject: Re: [PATCH 2/2] mtd-utils: integck: add support for volume specific
 power-cut test
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mats =?ISO-8859-1?Q?K=E4rrman?= <Mats.Karrman@tritech.se>
Date: Tue, 15 Apr 2014 16:12:12 +0300
In-Reply-To: <ED3E0BCACD909541BA94A34C4A164D4C5B3D11F5@post.tritech.se>
References: <ED3E0BCACD909541BA94A34C4A164D4C5B3D11F5@post.tritech.se>
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

Hi Mats,

pushed the first patch out, thanks.

On Mon, 2014-04-14 at 11:47 +0000, Mats Kärrman wrote:
> -"continues forever.\n";
> +"continues forever.\n"
> +"Whereas -p requires power cut emulation to be enabled globally, the -P option\n"
> +"automatically enables the use of power cut emulation on the tested fs instance\n"
> +"only (currently implemented for UBIFS only).\n";

Could we please invent an easy to understand way of naming this and the
option.

So essentially, this is about emulating power cuts at UBI and UBIFS
levels. The "reenabling" thing is a small details which should not be
visible in --help, because it is confusing anyway.

I'd suggest to split this patch on 2. First patch renames the option to
'--ubi-power-cut', refines help message, may be some comments and
function names, if needed.

The second patch introduces '--ubifs-power-cut', and explains that this
makes sure that power cuts happen in the UBIFS driver, versus the
underlying UBI driver.

Thanks!

-- 
Best Regards,
Artem Bityutskiy
