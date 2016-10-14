Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bv3dX-0003cH-8K
 for linux-mtd@lists.infradead.org; Fri, 14 Oct 2016 14:39:04 +0000
Message-ID: <1476455919.2342.950.camel@gmail.com>
Subject: Re: Failure on MTD sub-page test
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Danesh Daroui <Danesh.Daroui@ascom.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Date: Fri, 14 Oct 2016 17:38:39 +0300
In-Reply-To: <39BC08CB3FF4C84CB6397533D4FC7909015DE2F7@SEGOTEXCH02.ascom-Resource.ads>
References: <39BC08CB3FF4C84CB6397533D4FC7909015DDE3F@SEGOTEXCH02.ascom-Resource.ads>
 <1476448883.2342.924.camel@gmail.com>
 <39BC08CB3FF4C84CB6397533D4FC7909015DE2F7@SEGOTEXCH02.ascom-Resource.ads>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2016-10-14 at 14:13 +0000, Danesh Daroui wrote:
> Hi Artem,
> 
> Thanks for your reply. I can unmount the device and run the tests,
> but then how can we make sure whether the problem is in UBI/UBIFS
> layers or only MTD layer? Anyway, if we update the kernel, then both
> MTD drivers and UBI/UBIFS will be updated, am I right?

You are experiencing some issues with UBIFS, I suppose. Naturally, you
want to fix it.

But the SW you are dealing with is sandwich, and you want to narrow
down the problem to a specific layer, if possible.

The first step we usually recommend to do is to start validating the
low level - MTD. You use MTD tests for that. If they fail, you know
there is something wrong at this layer, and you go and fix that. If
they do not fail, the problem is probably somewhere above MTD.

Artem.
