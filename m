Date: Fri, 21 Oct 2016 06:15:05 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Richard Weinberger <richard@nod.at>
Cc: Christoph Hellwig <hch@infradead.org>,
 Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>,
 "adrian.hunter@intel.com" <adrian.hunter@intel.com>,
 "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
 Punnaiah Choudary Kalluri <punnaia@xilinx.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: UBIFS with dma on 4.6 kernel is not working
Message-ID: <20161021131505.GA25942@infradead.org>
References: <DA6901612C71B84D91459DE817C418AE26DF0F2B@XAP-PVEXMBX01.xlnx.xilinx.com>
 <519a83bf-1244-5151-b873-bb8e1f2db3c6@nod.at>
 <20161021125313.GA16754@infradead.org>
 <c0b0098d-3a68-3a4a-0b7e-a1d95dd4aafc@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c0b0098d-3a68-3a4a-0b7e-a1d95dd4aafc@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 21, 2016 at 03:07:57PM +0200, Richard Weinberger wrote:
> Hmm, thought this is still problematic on VIVT architectures.
> Boris tried to provide a solution for that some time ago:
> http://www.spinics.net/lists/arm-kernel/msg494025.html

Things have been working fine for approx 10 years when using
flush_kernel_vmap_range before doing I/O using the physical addresses and
then invalidate_kernel_vmap_range when completing the I/O and going back
to using the virtual mapping for XFS.

Of course all this assumes at least the higher level that did the
vm_map_ram operation knows about this dance between virtually mapped and
physiscal addresses. 
