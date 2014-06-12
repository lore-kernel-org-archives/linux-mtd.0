Message-ID: <539954CD.5080309@atmel.com>
Date: Thu, 12 Jun 2014 15:20:45 +0800
From: Josh Wu <josh.wu@atmel.com>
MIME-Version: 1.0
To: Bo Shen <voice.shen@atmel.com>
Subject: Re: [PATCH] mtd: atmel_nand: make ecc parameters same as definition
References: <1402041728-12056-1-git-send-email-voice.shen@atmel.com>
 <53958CCE.5080307@atmel.com> <5397CBF9.800@atmel.com>
In-Reply-To: <5397CBF9.800@atmel.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 nicolas.ferre@atmel.com, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, Bo

On 6/11/2014 11:24 AM, Bo Shen wrote:
> Hi Josh,
>
> On 06/09/2014 06:30 PM, Josh Wu wrote:
>> Hi, Bo
>>
>> Thanks for the patch.
>>
>> On 6/6/2014 4:02 PM, Bo Shen wrote:
>>> If the ecc parameter is not the same as definition, when the
>>> mtd core check these parameters, it will give the unexpected
>>> result.
>> Could you be more specific to tell what kind of result will happened?
>
> For example:
> When try to calculate how many bits can correct in one page according 
> to the definition, it will give the wrong result.
>
> one page correct bits = (mtd->writesize * ecc->strength) / ecc->size;
>
> take the following use case as an example:
> mtd->writesize = 2048 bytes,
> ecc->strength = 4 bytes, (for 512 bytes)
>
> before this patch, the ecc->size = 2048, so the result is 4 bytes.
>
> after this patch, the ecc->size = 512, so the result is 16 bytes.
>
> The maximum correct bytes is 16 bytes while not 4 bytes. So, if not align

That is clear enough, thanks. The patch is fine to me. so
Acked-by: Josh Wu <josh.wu@atmel.com>

>
> Best Regards,
> Bo Shen

Best Regards,
Josh Wu
