Message-ID: <4A858B4A.9000705@gmail.com>
Date: Fri, 14 Aug 2009 19:05:30 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
MIME-Version: 1.0
To: JiSheng Zhang <jszhang3@gmail.com>
Subject: Re: [PATCH] UBI: Fix allocation of volume table
References: <20090811094455.6f9cbbfe@ustc>
In-Reply-To: <20090811094455.6f9cbbfe@ustc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: Artem.Bityutskiy@nokia.com, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	rmk@arm.linux.org.uk, adrian.hunter@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/11/2009 04:44 AM, JiSheng Zhang wrote:
> We can't use vmalloc for the buffer used for volume table for some NAND
> or NOR drivers may pass the buffer to DMA. And the volume table size
> a.k.a vtbl_size is small so we can use kmalloc or kzalloc for it instead
>
> Signed-off-by: JiSheng Zhang<jszhang3@gmail.com>

I do not have objections if this patch becomes a member of a series of
patches which kick vmalloc from whole UBI. Applying just this patch does
not make much sense.

You may go through UBI code and try to split large vmalloc-ed buffers on
smaller kmalloc-ed ones.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
