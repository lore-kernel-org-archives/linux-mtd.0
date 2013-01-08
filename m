Date: Tue, 8 Jan 2013 10:16:46 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Yuanhan Liu <yuanhan.liu@linux.intel.com>
Subject: Re: [PATCH 5/5] kfifo: log based kfifo API
Message-ID: <20130108181645.GA7972@core.coreip.homeip.net>
References: <1357657073-27352-1-git-send-email-yuanhan.liu@linux.intel.com>
 <1357657073-27352-6-git-send-email-yuanhan.liu@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1357657073-27352-6-git-send-email-yuanhan.liu@linux.intel.com>
Cc: linux-iio@vger.kernel.org, linux-mmc@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-mm@kvack.org,
 linux-sctp@vger.kernel.org, linux-mtd@lists.infradead.org,
 devel@driverdev.osuosl.org, linux-scsi@vger.kernel.org,
 libertas-dev@lists.infradead.org, linux-rdma@vger.kernel.org,
 Stefani Seibold <stefani@seibold.net>, linux-serial@vger.kernel.org,
 linux-pci@vger.kernel.org, open-iscsi@googlegroups.com,
 linux-media@vger.kernel.org, linux-input@vger.kernel.org,
 linux-omap@vger.kernel.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 dccp@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Yuanhan,

On Tue, Jan 08, 2013 at 10:57:53PM +0800, Yuanhan Liu wrote:
> The current kfifo API take the kfifo size as input, while it rounds
>  _down_ the size to power of 2 at __kfifo_alloc. This may introduce
> potential issue.
> 
> Take the code at drivers/hid/hid-logitech-dj.c as example:
> 
> 	if (kfifo_alloc(&djrcv_dev->notif_fifo,
>                        DJ_MAX_NUMBER_NOTIFICATIONS * sizeof(struct dj_report),
>                        GFP_KERNEL)) {
> 
> Where, DJ_MAX_NUMBER_NOTIFICATIONS is 8, and sizeo of(struct dj_report)
> is 15.
> 
> Which means it wants to allocate a kfifo buffer which can store 8
> dj_report entries at once. The expected kfifo buffer size would be
> 8 * 15 = 120 then. While, in the end, __kfifo_alloc will turn the
> size to rounddown_power_of_2(120) =  64, and then allocate a buf
> with 64 bytes, which I don't think this is the original author want.
> 
> With the new log API, we can do like following:
> 
> 	int kfifo_size_order = order_base_2(DJ_MAX_NUMBER_NOTIFICATIONS *
> 					    sizeof(struct dj_report));
> 
> 	if (kfifo_alloc(&djrcv_dev->notif_fifo, kfifo_size_order, GFP_KERNEL)) {
> 
> This make sure we will allocate enough kfifo buffer for holding
> DJ_MAX_NUMBER_NOTIFICATIONS dj_report entries.

Why don't you simply change __kfifo_alloc to round the allocation up
instead of down?

Thanks.

-- 
Dmitry
