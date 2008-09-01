Subject: Re: warning during mtd registration in 2.6.27-rc5
From: David Woodhouse <dwmw2@infradead.org>
To: Dmitry Baryshkov <dbaryshkov@gmail.com>
In-Reply-To: <20080901142949.GA18081@doriath.ww600.siemens.net>
References: <20080901142949.GA18081@doriath.ww600.siemens.net>
Content-Type: text/plain
Date: Mon, 01 Sep 2008 21:17:44 +0100
Message-Id: <1220300264.2982.140.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: axboe@kernel.dk, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2008-09-01 at 18:29 +0400, Dmitry Baryshkov wrote:
> This happens when adding mtd partitions. I've traced it to the fact that
> mtd partition devices share the genhd queue with the whole chip block device.
> Thus blk_register_filter receives the same pointer for the chip and for each
> registered partition.

Yes, the fix for that is already on its way to Linus.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
