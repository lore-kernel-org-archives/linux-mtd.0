Received: from an-out-0708.google.com ([209.85.132.240])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KaHSv-0002Ra-2J
	for linux-mtd@lists.infradead.org; Mon, 01 Sep 2008 22:01:41 +0000
Received: by an-out-0708.google.com with SMTP id c24so335437ana.99
	for <linux-mtd@lists.infradead.org>;
	Mon, 01 Sep 2008 15:01:40 -0700 (PDT)
Message-ID: <bc64b4640809011501j30dae45bqd8326169478c4060@mail.gmail.com>
Date: Tue, 2 Sep 2008 02:01:40 +0400
From: Dmitry <dbaryshkov@gmail.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Subject: Re: warning during mtd registration in 2.6.27-rc5
In-Reply-To: <1220300264.2982.140.camel@pmac.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <20080901142949.GA18081@doriath.ww600.siemens.net>
	<1220300264.2982.140.camel@pmac.infradead.org>
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

2008/9/2 David Woodhouse <dwmw2@infradead.org>:
> On Mon, 2008-09-01 at 18:29 +0400, Dmitry Baryshkov wrote:
>> This happens when adding mtd partitions. I've traced it to the fact that
>> mtd partition devices share the genhd queue with the whole chip block device.
>> Thus blk_register_filter receives the same pointer for the chip and for each
>> registered partition.
>
> Yes, the fix for that is already on its way to Linus.

Thanks. Sorry for the noise.

>
> --
> David Woodhouse                            Open Source Technology Centre
> David.Woodhouse@intel.com                              Intel Corporation
>
>
>
>



-- 
With best wishes
Dmitry
