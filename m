Received: from ch1ehsobe006.messaging.microsoft.com ([216.32.181.186]
 helo=ch1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UCOPJ-00064k-KZ
 for linux-mtd@lists.infradead.org; Mon, 04 Mar 2013 05:57:54 +0000
Message-ID: <513437DF.2030505@freescale.com>
Date: Mon, 4 Mar 2013 13:57:51 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: [PATCH V3 1/3] mtd: add new fields to nand_flash_dev{}
References: <1359349039-11510-1-git-send-email-b32955@freescale.com>	
 <1359349039-11510-2-git-send-email-b32955@freescale.com>	
 <1360684037.12703.117.camel@sauron.fi.intel.com>	
 <CAMiH66ExMK8rPMw3kvs9M2b-0ZSkfxBYteTi8QTZf+XCzJw5Dw@mail.gmail.com>
 <1362234094.2745.9.camel@sauron>
In-Reply-To: <1362234094.2745.9.camel@sauron>
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

=E4=BA=8E 2013=E5=B9=B403=E6=9C=8802=E6=97=A5 22:21, Artem Bityutskiy =E5=
=86=99=E9=81=93:
> On Sat, 2013-02-16 at 11:56 +0800, Huang Shijie wrote:
>> On Tue, Feb 12, 2013 at 11:47 PM, Artem Bityutskiy<dedekind1@gmail.com=
>  wrote:
>>> On Mon, 2013-01-28 at 12:57 +0800, Huang Shijie wrote:
>>>> +       {"SmartMedia 256MiB 3,3V",      {0, 0x71}, 512, 256, 0x4000 =
},
>>>> +       {"SmartMedia 256MiB 3,3V ROM",  {0, 0x5b}, 512, 256, 0x4000,
>>>> NAND_ROM},
>>> Sorry for a possibly stupid question, but what does it buy you adding
>>> another "0" to all the entries? I see you add another table, which yo=
u
>>> look up if the "traditional" table does not work. Why you need to add
>>> these zeroes?
>> The zeros are for the maf_id.
>>
>> The dev_id is the second byte of the 8-byte id data.
> It does not really make me understand why we add these zeroes, they
> still look useless to me... Would you please be a little more verbose
> about your solution?
>
the 8bytes id data read out by the READ ID command is in the following=20
order:
    byte 0(Maker id): such as 0x98 stands for Toshiba, 0xec stands for=20
Samsung.
    byte 1(device id):
    byte 2(used to store the chip number,cell type information):
    byte 3(used to store the page size, block size information)
    byte 4(used to store the Plane information).
    ........................


The current code uses the @id to store the device id(byte 1).
But if we use the 8 bytes id data as the keyword, and expand the @id=20
field to 8byte array,
the device id is the second byte now. All the added zeros are for the=20
Maker id.
For example,
     {"SmartMedia 256MiB 3,3V",      {0, 0x71}, 512, 256, 0x4000 },

We really do not use the zeros. All the zeros are added for avoiding the=20
misunderstanding.
If we do not add the zero, it will looks like:

      {"SmartMedia 256MiB 3,3V",      {0x71}, 512, 256, 0x4000 },

The device id (0x71) becomes the first byte of 8byte id array, people wil=
l treat the 0x71 as the Maker code.


thanks
Huang Shijie
