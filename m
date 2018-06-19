Subject: Re: [PATCH v2] mtd: atmel-quadspi: add suspend/resume hooks
To: Claudiu Beznea <Claudiu.Beznea@microchip.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, richard@nod.at,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <1528101993-4772-1-git-send-email-claudiu.beznea@microchip.com>
 <20180618114920.654647c0@bbrezillon>
 <8474a744-5552-932f-7ba8-85b7d95368ea@gmail.com>
 <0be344a2-9878-2b92-9436-bc2f4d4fd6e0@microchip.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <5b66cafe-782e-43a9-c221-cf0a1528f382@gmail.com>
Date: Tue, 19 Jun 2018 03:28:19 +0200
MIME-Version: 1.0
In-Reply-To: <0be344a2-9878-2b92-9436-bc2f4d4fd6e0@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 06/18/2018 02:00 PM, Claudiu Beznea wrote:
> 
> 
> On 18.06.2018 12:53, Marek Vasut wrote:
>> On 06/18/2018 11:49 AM, Boris Brezillon wrote:
>>> Hi Claudiu,
>>>
>>> The subject prefix should be "mtd: spi-nor: atmel-quadspi: ". No need
>>> to send a new version just for that, I'll fix it when applying the
>>> patch.
>>>
> Hi Boris,
> 
> Thank you!
> 
>>> Looks good otherwise. Marek, any objection? If not, can you add your
>>> Acked-by?
>>
>> Will this work if you have ie. ubifs mounted on that QSPI NOR and you
>> suspect and resume during IO ? I think it would, but just curious if
>> there could be some problem.
> 
> Hi Marek,
> 
> I tested only with read/writes while suspending, simple scripts, but not
> having ubifs mounted on QSPI NOR. I will double check also with ubifs
> mounted on QSPI NOR and come back with the results.

Thanks. I think it's gonna be OK, but let's just be sure.
Make sure to disable 4K sector support when fiddling with UBI/UBIFS on
QSPI NOR.

-- 
Best regards,
Marek Vasut
