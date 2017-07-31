Subject: Re: [PATCH 4/5] mtd: spi-nor: Add driver for Adaptrum Anarion QSPI
 controller
To: Marek Vasut <marek.vasut@gmail.com>, linux-snps-arc@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20170728220707.13960-1-alex.g@adaptrum.com>
 <20170728220707.13960-5-alex.g@adaptrum.com>
 <135fdf95-1029-2d34-2802-1283a73588e5@gmail.com>
 <83a4e27a-b96c-0558-fbb5-10e64f9bf59b@adaptrum.com>
 <e7c916c4-7b0a-1f76-b91f-5befeb24faf5@gmail.com>
 <e1390c36-086b-aeba-848c-f45dcb88b5ce@adaptrum.com>
 <1da97744-bc02-420e-d4e9-5ebf331475e8@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org
From: Alexandru Gagniuc <alex.g@adaptrum.com>
Message-ID: <054534f2-deed-a339-f82a-e3eba569b029@adaptrum.com>
Date: Mon, 31 Jul 2017 15:59:17 -0700
MIME-Version: 1.0
In-Reply-To: <1da97744-bc02-420e-d4e9-5ebf331475e8@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 07/31/2017 03:43 PM, Marek Vasut wrote:
> On 08/01/2017 12:20 AM, Alexandru Gagniuc wrote:
>> On 07/31/2017 02:33 PM, Marek Vasut wrote:
>>> On 07/31/2017 07:17 PM, Alexandru Gagniuc wrote:
>>>>>> +struct anarion_qspi {
>>>>>> +    struct        spi_nor nor;
>>>>>> +    struct        device *dev;
>>>>>> +    uintptr_t    regbase;
>>>>>
>>>>> Should be void __iomem * I guess ?
>>>>
>>>> I chose uintptr_t as opposed to void *, because arithmetic on void * is
>>>> not valid in C. What is the right answer hen, without risking undefined
>>>> behavior?
>>>
>>> What sort of arithmetic ? It's perfectly valid in general ...
>>
>> ISO/IEC 9899:201x, Section 6.5.6, constraint(2) is not met when the one
>> of the operands to addition is a void pointer.
>> Section 6.2.5 (19) defines void to be an incomplete type.
>
> Is that something new in C 201x draft ?

C99 had similar restrictions.

> Anyway, this would mean half of the drivers are broken, so I'm not convinced.

They are. Feel free to send me a private email if you want to discuss 
this further.

Alex
