Received: from secvs02.rockwellcollins.com ([205.175.225.241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cq59n-000456-2x
 for linux-mtd@lists.infradead.org; Mon, 20 Mar 2017 21:48:05 +0000
Received: by mail-it0-f72.google.com with SMTP id z70so33710460itb.6
 for <linux-mtd@lists.infradead.org>; Mon, 20 Mar 2017 14:47:36 -0700 (PDT)
MIME-Version: 1.0
From: Ronak Desai <ronak.desai@rockwellcollins.com>
Date: Mon, 20 Mar 2017 16:47:35 -0500
Message-ID: <CADFuHZ6xb=M_zRkktnq2b8QBOhq-WDsqgzViPHU1g8Gj9M3E-g@mail.gmail.com>
Subject: Regarding UBI fastmap data CRC failure
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

In one of the products with MLC NAND flash, we are using UBI
filesystem with kernel 3.12.

Fastmap is enabled to reduce the attach time and it works as expected.
We performed number of powercycles on the unit and never seen a
continuous failure of attached by fastmap. But, at one occurrence I
observed that there was a  "fastmap data CRC failure". UBI was
complaining about not find anchor node error when performing detach
(that's why was not able to write new fastmap data). It was a
permanent failure until I reformatted that NAND partition.

I understand that UBI stores fastmap data in initial few KBs of that
NAND device and it was not able to find spare block in that region to
store fastmap data. But, I am not able to understand that why UBI end
up with this situation when it already manages the erasure of the bad
fastmap blocks?

I would like to know that how I can avoid this situation or get a
workaround of it. Any advice will be appreciated.

Best Regards,
Ronak Desai
