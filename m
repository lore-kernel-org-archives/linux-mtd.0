Received: from co1ehsobe002.messaging.microsoft.com ([216.32.180.185]
 helo=co1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UCRD9-0002Tm-Od
 for linux-mtd@lists.infradead.org; Mon, 04 Mar 2013 08:57:36 +0000
Message-ID: <5134620F.8010306@freescale.com>
Date: Mon, 4 Mar 2013 16:57:51 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: [PATCH V3 1/3] mtd: add new fields to nand_flash_dev{}
References: <1359349039-11510-1-git-send-email-b32955@freescale.com>			
 <1359349039-11510-2-git-send-email-b32955@freescale.com>			
 <1360684037.12703.117.camel@sauron.fi.intel.com>			
 <CAMiH66ExMK8rPMw3kvs9M2b-0ZSkfxBYteTi8QTZf+XCzJw5Dw@mail.gmail.com>		
 <1362234094.2745.9.camel@sauron> <513437DF.2030505@freescale.com>	
 <1362383434.2943.5.camel@sauron> <5134566C.2090405@freescale.com>
 <1362386260.2943.9.camel@sauron>
In-Reply-To: <1362386260.2943.9.camel@sauron>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 Huang Shijie <shijie8@gmail.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B403=E6=9C=8804=E6=97=A5 16:37, Artem Bityutskiy =E5=
=86=99=E9=81=93:
> On Mon, 2013-03-04 at 16:08 +0800, Huang Shijie wrote:
>> =E4=BA=8E 2013=E5=B9=B403=E6=9C=8804=E6=97=A5 15:50, Artem Bityutskiy =
=E5=86=99=E9=81=93:
>>> On Mon, 2013-03-04 at 13:57 +0800, Huang Shijie wrote:
>>>> The current code uses the @id to store the device id(byte 1).
>>>> But if we use the 8 bytes id data as the keyword, and expand the @id
>>>> field to 8byte array,
>>>> the device id is the second byte now. All the added zeros are for th=
e
>>> I do not think you need to store the full array of ID's. Device ID's =
for
>>> all the 4 of above chips are different, which is enough to distinguis=
h
>>> between them.
>>>
>>> The only thing you need to add is the OOB size field to 'struct
>>> nand_flash_dev'.
>>>
>> If i only add the oob size field. There will be two items with the sam=
e
>> Device ID in nand_flash_ids table,
>> one has oob_size, one does not have. such as:
>>
>>      {"NAND 8GIB 3,3V 8-bit", 0xDE, 0, 8192, 0, LP_OPTIONS},
> OK, I guess for this one:
>
> {"NAND 8GIB 3,3V 8-bit", 0xDE, 0, 8192, 0, LP_OPTIONS, 0},
>
> nand_decode_ext_id() will calculate the OOB size.
>
>>      {"NAND 8GIB 3,3V 8-bit", 0xDE, 0, 8192, 0, LP_OPTIONS, 640},   //=
OOB
>> size is 640.
> And for this one 'nand_decode_ext_id()' will calculate it too, but
> _afterwards_ we change OOB size to 640.
>
> Does this sound sane?
>
I think not.

The problem is : we can not know which nand_flash_dev item we should use=20
when the same Device ID occurs.
When we meet a nand whose Device ID is 0xDE, the current code will=20
select the first one:
    {"NAND 8GIB 3,3V 8-bit", 0xDE, 0, 8192, 0, LP_OPTIONS, 0}

Could you tell me how can we choose the seconde one? The second same=20
device-id item is
   {"NAND 8GIB 3,3V 8-bit", 0xDE, 0, 8192, 0, LP_OPTIONS, 640}

thanks
Huang Shijie
