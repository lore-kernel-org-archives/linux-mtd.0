Received: from co9ehsobe003.messaging.microsoft.com ([207.46.163.26]
 helo=co9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UCQwc-0001OO-G4
 for linux-mtd@lists.infradead.org; Mon, 04 Mar 2013 08:40:30 +0000
Message-ID: <51345DFA.7070601@freescale.com>
Date: Mon, 4 Mar 2013 16:40:26 +0800
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
 <1362385446.2943.7.camel@sauron>
In-Reply-To: <1362385446.2943.7.camel@sauron>
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

=E4=BA=8E 2013=E5=B9=B403=E6=9C=8804=E6=97=A5 16:24, Artem Bityutskiy =E5=
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
> Do you know what is this chip?
this maybe not just a nand chip, it may stands for a class of nand chips.
Toshiba may uses this device id, Micron may also uses it.

In other word, this item may stands for many nand chips.
>>      {"NAND 8GIB 3,3V 8-bit", 0xDE, 0, 8192, 0, LP_OPTIONS, 640},   //=
OOB
>> size is 640
> So there are really 2 different chips with the same device id and
> different OOB size? If you had 2 datasheets for me demonstrating this,
> I'd be grateful.
Please see the http://www.linux-mtd.infradead.org/nand-data/nanddata.html
The ST's NAND08GW3B2C and Numonyx's NAND08GW3F2B share the same device=20
id but with the
different oob size.

thanks
Huang Shijie
