Received: from hd5b91d02.k46641.sta.perspektivbredband.net ([213.185.29.2]
 helo=fg-dc1.flatfrog.local)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S4T35-0008Ds-4p
 for linux-mtd@lists.infradead.org; Mon, 05 Mar 2012 08:13:40 +0000
Message-ID: <4F5475A8.3050600@flatfrog.com>
Date: Mon, 5 Mar 2012 09:13:28 +0100
From: Orjan Friberg <of@flatfrog.com>
MIME-Version: 1.0
To: Grazvydas Ignotas <notasas@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
Subject: Re: Spurious ECC errors with mtd_subpagetest (OMAP3, NAND)
References: <4F50F2AB.10209@flatfrog.com>
 <CANOLnOM6X=29r7_aMs=z4eiDtw0kvWZ-jSeds_NO0KdZ3E8Ouw@mail.gmail.com>
In-Reply-To: <CANOLnOM6X=29r7_aMs=z4eiDtw0kvWZ-jSeds_NO0KdZ3E8Ouw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 03/02/2012 06:17 PM, Grazvydas Ignotas wrote:
> IIRC NAND in mainline was broken for very long time on OMAP3, I think
> it was only fixed in 2.6.39.1.

That seems to be the case; the 2.6.39.1 diff contains the OMAP NAND sub 
page write fix (applied locally).


Anyone else who can testify on the "volatile-ness" of NAND ECC errors?

I.e., are they expected to be more persistent?


Thanks,
Orjan

-- 
Orjan Friberg
FlatFrog Laboratories AB
