Message-ID: <4BBAF6E6.20902@nokia.com>
Date: Tue, 06 Apr 2010 11:55:02 +0300
From: Adrian Hunter <adrian.hunter@nokia.com>
MIME-Version: 1.0
To: "dwmw2@infradead.org" <dwmw2@infradead.org>
Subject: Re: [PATCH] mtd: OneNAND: OMAP3: unmap correct DMA buffer
References: <1269351224-10637-1-git-send-email-ext-mika.1.westerberg@nokia.com>
	<874ojpdnb2.fsf@small.ssi.corp>
In-Reply-To: <874ojpdnb2.fsf@small.ssi.corp>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "kyungmin.park@samsung.com" <kyungmin.park@samsung.com>,
	Arnaud Ebalard <arno@natisbad.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"Westerberg Mika.1 \(EXT-Nixu/Helsinki\)" <ext-mika.1.westerberg@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ext Arnaud Ebalard wrote:
> Hi,
> 
> Mika Westerberg <ext-mika.1.westerberg@nokia.com> writes:
> 
>> Function omap3_onenand_write_bufferram() maps the write buffer and stores the
>> returned handle in dma_src. However, when it does the DMA unmap, it uses wrong
>> DMA handle (dma_dst).
>>
>> This patch fixes it to use the correct DMA handle.
>>
>> Signed-off-by: Mika Westerberg <ext-mika.1.westerberg@nokia.com>
>> ---
>>  drivers/mtd/onenand/omap2.c |    4 ++--
>>  1 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/mtd/onenand/omap2.c b/drivers/mtd/onenand/omap2.c
>> index 75f38b9..2d81a3a 100644
>> --- a/drivers/mtd/onenand/omap2.c
>> +++ b/drivers/mtd/onenand/omap2.c
>> @@ -402,7 +402,7 @@ static int omap3_onenand_write_bufferram(struct mtd_info *mtd, int area,
>>  
>>  	dma_src = dma_map_single(&c->pdev->dev, buf, count, DMA_TO_DEVICE);
>>  	dma_dst = c->phys_base + bram_offset;
>> -	if (dma_mapping_error(&c->pdev->dev, dma_dst)) {
>> +	if (dma_mapping_error(&c->pdev->dev, dma_src)) {
>>  		dev_err(&c->pdev->dev,
>>  			"Couldn't DMA map a %d byte buffer\n",
>>  			count);
>> @@ -425,7 +425,7 @@ static int omap3_onenand_write_bufferram(struct mtd_info *mtd, int area,
>>  		if (*done)
>>  			break;
>>  
>> -	dma_unmap_single(&c->pdev->dev, dma_dst, count, DMA_TO_DEVICE);
>> +	dma_unmap_single(&c->pdev->dev, dma_src, count, DMA_TO_DEVICE);
>>  
>>  	if (!*done) {
>>  		dev_err(&c->pdev->dev, "timeout waiting for DMA\n");
> 
> That patch removes the kernel panic I get when booting current l-o
> kernel on my N900.
> 
> Tested-by: Arnaud Ebalard <arno@natisbad.org>
> 
> Cheers,
> 
> a+
> 

Acked-by: Adrian Hunter <adrian.hunter@nokia.com>
