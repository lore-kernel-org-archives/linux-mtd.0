Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WaJsH-0000Jl-3H
 for linux-mtd@lists.infradead.org; Wed, 16 Apr 2014 07:03:13 +0000
Received: by mail-pb0-f49.google.com with SMTP id jt11so10403591pbb.8
 for <linux-mtd@lists.infradead.org>; Wed, 16 Apr 2014 00:02:47 -0700 (PDT)
Date: Tue, 15 Apr 2014 23:57:29 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Roman Pen <r.peniaev@gmail.com>
Subject: Re: [v2 PATCH 1/1] mtd: mtd_blkdevs: handle REQ_FLUSH request and do
 explicit flush of writeback buffer
Message-ID: <20140416065729.GP3131@norris-Latitude-E6410>
References: <1394283554-27423-1-git-send-email-r.peniaev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1394283554-27423-1-git-send-email-r.peniaev@gmail.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Mar 08, 2014 at 09:59:14PM +0900, Roman Pen wrote:
> From: Roman Peniaev <r.peniaev@gmail.com>
> 
> mtd_blkdevs is device with volatile cache (writeback buffer), so it should support
> REQ_FLUSH to do explicit flush.
> 
> Without this patch 'sync' does not guarantee that writeback buffer will be flushed
> on disk in case of power off, e.g.:
> 
>   $ cp some_file /mnt
>   $ sync
> 
>   ### POWER OFF
> 
> In case of this sequence writeback buffer will not be flushed on disk.
> 
> This patch fixes this behaviour and explicitly reports to block layer that flush
> requests are being supported.
> 
> Signed-off-by: Roman Peniaev <r.peniaev@gmail.com>
> CC: David Woodhouse <dwmw2@infradead.org>
> CC: Brian Norris <computersforpeace@gmail.com>
> CC: linux-mtd@lists.infradead.org
> CC: linux-kernel@vger.kernel.org

Pushed to l2-mtd.git. Thanks!

Brian
