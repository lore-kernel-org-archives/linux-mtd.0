Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VBPYQ-0005v0-FZ
 for linux-mtd@lists.infradead.org; Mon, 19 Aug 2013 13:31:31 +0000
Message-ID: <1376919409.2089.463.camel@sauron.fi.intel.com>
Subject: Re: [RFC] mtd-utils: integck: add support for volume specific
 power-cut test
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mats =?ISO-8859-1?Q?K=E4rrman?= <Mats.Karrman@tritech.se>
Date: Mon, 19 Aug 2013 16:36:49 +0300
In-Reply-To: <ED3E0BCACD909541BA94A34C4A164D4C4FCDC571@post.tritech.se>
References: <ED3E0BCACD909541BA94A34C4A164D4C4FCDC571@post.tritech.se>
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

On Mon, 2013-08-19 at 08:50 +0000, Mats Kärrman wrote:
> Problem:
> The current power-cut test requires power-cut emulation to be enabled globally
> (e.g. for all UBIFS volumes) but this may lead to some practical problems when
> the root fs of the tested machine is also of the same type.

Hi, sorry, I do not understand the problem. First of all, I never ran
this on a device which uses an UBIFS file-system as rootfs. I only ran
it on a PC where UBIFS has only been on top of a nandsim.

So, AFAICS, power cut emulation is per-mountpoint. So you should enable
it only for the the file-system under test. Power-cut should switch only
the file-system under test to R/O mode, not the rootfs.

What are the practical problems you mention?

-- 
Best Regards,
Artem Bityutskiy
