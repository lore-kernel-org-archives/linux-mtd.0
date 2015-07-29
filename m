Received: from mx.dave-tech.it ([2.229.21.40])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZKTnJ-0000sN-H5
 for linux-mtd@lists.infradead.org; Wed, 29 Jul 2015 16:01:27 +0000
Subject: Re: [PATCH 5/6] mtd: nand: gpmi: correct bitflip for erased NAND page
To: Han Xu <xhnjupt@gmail.com>
References: <mailman.4028.1438106338.1758.linux-mtd@lists.infradead.org>
 <mailman.4028.1438106338.1758.linux-mtd.{c3fbf4b6-bd46-4f1f-ba46-40c78864ddc3}.0@lists.infradead.org>
 <1438105841-22314-1-git-send-email-b45815@freescale.com>
 <55B88952.1060709@dave-tech.it>
 <CA+EcR21ert+xksT92-=jQ6HSPEVdOo3gYGttqvsUW2LE9Jk9qA@mail.gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Han Xu <b45815@freescale.com>, Fabio Estevam <fabio.estevam@freescale.com>,
 boris.brezillon@free-electrons.com, Huang Shijie <shijie8@gmail.com>,
 linux-kernel@vger.kernel.org, Nicholas Mc Guire <hofrat@osadl.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
From: Andrea Scian <rnd4@dave-tech.it>
Message-ID: <55B8F8BE.4060005@dave-tech.it>
Date: Wed, 29 Jul 2015 18:01:02 +0200
MIME-Version: 1.0
In-Reply-To: <CA+EcR21ert+xksT92-=jQ6HSPEVdOo3gYGttqvsUW2LE9Jk9qA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Il 29/07/2015 16:34, Han Xu ha scritto:
> Hi Andrea,
>
> The threshold gf/2 is referred to Huang Shijie's previous patch for bitflip,
>
> http://lists.infradead.org/pipermail/linux-mtd/2014-January/051513.html

Thanks for pointing out the reference.
Looking forward on the same thread, I saw that Brian already have some 
doubt about having the threshold correlated with gf instead of ecc_strength.

I think in this way (until someone, e.g. from micron, tell me something 
different ;-) ): erased pages act like the programmed one. They have 
bitflips and, unfortunately, cannot be protected by an ECC-like algorithm.
If, let's say, your NAND device need a 30 bit ECC protection over 1024 
byte page, this is nearly the same for an erased page.

As additional thought: what happens if you reports that an erased page 
has too much bitflips? UBIFS will fail badly [1]

Usually you never reach the "uncorrectable ECC error" level on standard 
situation (even on MLC ;-) ) because as soon as bitflips are more than a 
given threshold [2] those blocks are scrubbed and you're in the safe 
area again.
If you report ECC errors before this threshold, I think we fake the 
scrubbing functionality of UBI (which, yes, AFAIK should work on erased 
blocks too, why not?)

As first instance I would choose ECC strength as value to use, apart 
from the fact that I'm wondering what's happens if:
* my erased block is close to this value (let's say ECC strength -1)
* I write some data on it (with ECC)
* this write probably increase bitflips (only an erase operation will 
lower bitflip events) and, even worst, it will point me close to "ECC 
strength + 1" bitflips

> To verify the function, I raw write the whole NAND page with 0xFF and several
> scattered bits with 0x0 to fake the bitflip, since the real bitflip is
> unpredictable and tested the feature with Micron MT29F64G08AFAAA.

Ok thanks.

IIUC MT29F64G08AFAAA is an SLC NAND device but probably, due it's size, 
not a "real" SLC device and should have MLC like behavior.

I think you can easily trigger this situation (as I do) as follows:
* ubiformat, ubiattach, ubimkvol on a NAND MTD partition
* mount -t ubifs that volume
* get the physical address of LEB1 and LEB2 (somehow.. ;-) ). They have 
lots of erased space that UBIFS will check at boot time
* umount, ubidetach the partition
* do a nanddump lots of times (let's say from 10k to 100k) on those two PEBs
* sooner or later you'll see some bitflips on erased page
* try to mount UBIFS again: without patch it should fail, with your 
addition you should see that your erased-page check works correctly and 
UBIFS mounts successfully

Maybe I'm a bit OT regarding this patch, but I think this is an 
interesting point to discuss about.
Any comment is welcome

Kind Regards,

-- 

Andrea SCIAN

DAVE Embedded Systems

[1] http://lists.infradead.org/pipermail/linux-mtd/2015-July/060168.html
[2] http://lists.infradead.org/pipermail/linux-mtd/2015-January/057334.html
