Received: from db3ehsobe003.messaging.microsoft.com ([213.199.154.141]
 helo=db3outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UCQRB-0007MG-Ev
 for linux-mtd@lists.infradead.org; Mon, 04 Mar 2013 08:08:00 +0000
Message-ID: <5134566C.2090405@freescale.com>
Date: Mon, 4 Mar 2013 16:08:12 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: [PATCH V3 1/3] mtd: add new fields to nand_flash_dev{}
References: <1359349039-11510-1-git-send-email-b32955@freescale.com>		
 <1359349039-11510-2-git-send-email-b32955@freescale.com>		
 <1360684037.12703.117.camel@sauron.fi.intel.com>		
 <CAMiH66ExMK8rPMw3kvs9M2b-0ZSkfxBYteTi8QTZf+XCzJw5Dw@mail.gmail.com>	
 <1362234094.2745.9.camel@sauron> <513437DF.2030505@freescale.com>
 <1362383434.2943.5.camel@sauron>
In-Reply-To: <1362383434.2943.5.camel@sauron>
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

=E4=BA=8E 2013=E5=B9=B403=E6=9C=8804=E6=97=A5 15:50, Artem Bityutskiy =E5=
=86=99=E9=81=93:
> On Mon, 2013-03-04 at 13:57 +0800, Huang Shijie wrote:
>> The current code uses the @id to store the device id(byte 1).
>> But if we use the 8 bytes id data as the keyword, and expand the @id
>> field to 8byte array,
>> the device id is the second byte now. All the added zeros are for the
> I do not think you need to store the full array of ID's. Device ID's fo=
r
> all the 4 of above chips are different, which is enough to distinguish
> between them.
>
> The only thing you need to add is the OOB size field to 'struct
> nand_flash_dev'.
>
If i only add the oob size field. There will be two items with the same=20
Device ID in nand_flash_ids table,
one has oob_size, one does not have. such as:

    {"NAND 8GIB 3,3V 8-bit", 0xDE, 0, 8192, 0, LP_OPTIONS},
    {"NAND 8GIB 3,3V 8-bit", 0xDE, 0, 8192, 0, LP_OPTIONS, 640},   //OOB=20
size is 640.


How can i distinguish them? In which case, i choose the item with the=20
oob_size, and in which case, i choose
the item without the oobsize?

thanks
Huang Shijie
