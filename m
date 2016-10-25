Received: from mail-sn1nam01on0083.outbound.protection.outlook.com
 ([104.47.32.83] helo=NAM01-SN1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1byufm-0001YV-6r
 for linux-mtd@lists.infradead.org; Tue, 25 Oct 2016 05:53:19 +0000
From: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
To: Christoph Hellwig <hch@infradead.org>, Richard Weinberger <richard@nod.at>
CC: "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "dedekind1@gmail.com" <dedekind1@gmail.com>,
 "adrian.hunter@intel.com" <adrian.hunter@intel.com>,
 "michal.simek@xilinx.com" <michal.simek@xilinx.com>, "Punnaiah Choudary
 Kalluri" <punnaia@xilinx.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Boris Brezillon
 <boris.brezillon@free-electrons.com>
Subject: RE: UBIFS with dma on 4.6 kernel is not working
Date: Tue, 25 Oct 2016 05:52:49 +0000
Message-ID: <DA6901612C71B84D91459DE817C418AE26E0015A@XAP-PVEXMBX01.xlnx.xilinx.com>
References: <DA6901612C71B84D91459DE817C418AE26DF0F2B@XAP-PVEXMBX01.xlnx.xilinx.com>
 <519a83bf-1244-5151-b873-bb8e1f2db3c6@nod.at>
 <20161021125313.GA16754@infradead.org>
 <c0b0098d-3a68-3a4a-0b7e-a1d95dd4aafc@nod.at>
 <20161021131505.GA25942@infradead.org>
In-Reply-To: <20161021131505.GA25942@infradead.org>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Thanks everybody for your valuable information.

I am not aware of all these dma related APIs but where to handle these dma =
stuff?
Is it in UBI/UBIFS(at the time of vmalloc allocations)? Or in controller dr=
iver?

And also is there a way to know the memory allocated using vmalloc is conti=
guous or not?
Based on that I can switch my driver to work in dma or non-dma mode for ubi=
fs use.

Thanks,
Naga Sureshkumar Relli

-----Original Message-----
From: Christoph Hellwig [mailto:hch@infradead.org]=20
Sent: Friday, October 21, 2016 6:45 PM
To: Richard Weinberger <richard@nod.at>
Cc: Christoph Hellwig <hch@infradead.org>; Naga Sureshkumar Relli <nagasure=
@xilinx.com>; dwmw2@infradead.org; computersforpeace@gmail.com; dedekind1@g=
mail.com; adrian.hunter@intel.com; michal.simek@xilinx.com; Punnaiah Chouda=
ry Kalluri <punnaia@xilinx.com>; linux-mtd@lists.infradead.org; linux-kerne=
l@vger.kernel.org; Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: UBIFS with dma on 4.6 kernel is not working

On Fri, Oct 21, 2016 at 03:07:57PM +0200, Richard Weinberger wrote:
> Hmm, thought this is still problematic on VIVT architectures.
> Boris tried to provide a solution for that some time ago:
> http://www.spinics.net/lists/arm-kernel/msg494025.html

Things have been working fine for approx 10 years when using flush_kernel_v=
map_range before doing I/O using the physical addresses and then invalidate=
_kernel_vmap_range when completing the I/O and going back to using the virt=
ual mapping for XFS.

Of course all this assumes at least the higher level that did the vm_map_ra=
m operation knows about this dance between virtually mapped and physiscal a=
ddresses.=20
