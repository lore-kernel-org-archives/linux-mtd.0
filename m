Message-ID: <53C65116.2040508@atmel.com>
Date: Wed, 16 Jul 2014 18:16:54 +0800
From: Josh Wu <josh.wu@atmel.com>
MIME-Version: 1.0
To: <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 1/3] mtd: atmel_nand: add NFC status error check
References: <1402393811-24578-1-git-send-email-josh.wu@atmel.com>
 <53C64EA2.3050703@atmel.com>
In-Reply-To: <53C64EA2.3050703@atmel.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: computersforpeace@gmail.com, Matthieu.CRAPET@ingenico.com,
 voice.shen@atmel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 7/16/2014 6:06 PM, Josh Wu wrote:
> On 6/10/2014 5:50 PM, Josh Wu wrote:
>> Add a new function to read the NFC status. Meantime, this function will
>> theck if there is any errors in NFC.
>>
>> Signed-off-by: Josh Wu <josh.wu@atmel.com>
>
> Tested-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
>

Sorry, I forgot to mention this Tested-by tag is for these patch series.

Best Regards,
Josh Wu

> I add a Tested-by tag from Matthieu Crapet.
> He didn't reply this email thread directly. His test-by tag is in 
> email:http://lists.infradead.org/pipermail/linux-mtd/2014-June/054443.html 
>
>
> Best Regards,
> Josh Wu
>
