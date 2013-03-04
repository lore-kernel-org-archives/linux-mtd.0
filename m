Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UCQgS-0007lh-1m
 for linux-mtd@lists.infradead.org; Mon, 04 Mar 2013 08:23:44 +0000
Message-ID: <1362385446.2943.7.camel@sauron>
Subject: Re: [PATCH V3 1/3] mtd: add new fields to nand_flash_dev{}
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Date: Mon, 04 Mar 2013 10:24:06 +0200
In-Reply-To: <5134566C.2090405@freescale.com>
References: <1359349039-11510-1-git-send-email-b32955@freescale.com>
 <1359349039-11510-2-git-send-email-b32955@freescale.com>
 <1360684037.12703.117.camel@sauron.fi.intel.com>
 <CAMiH66ExMK8rPMw3kvs9M2b-0ZSkfxBYteTi8QTZf+XCzJw5Dw@mail.gmail.com>
 <1362234094.2745.9.camel@sauron> <513437DF.2030505@freescale.com>
 <1362383434.2943.5.camel@sauron> <5134566C.2090405@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 Huang Shijie <shijie8@gmail.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2013-03-04 at 16:08 +0800, Huang Shijie wrote:
> 于 2013年03月04日 15:50, Artem Bityutskiy 写道:
> > On Mon, 2013-03-04 at 13:57 +0800, Huang Shijie wrote:
> >> The current code uses the @id to store the device id(byte 1).
> >> But if we use the 8 bytes id data as the keyword, and expand the @id
> >> field to 8byte array,
> >> the device id is the second byte now. All the added zeros are for the
> > I do not think you need to store the full array of ID's. Device ID's for
> > all the 4 of above chips are different, which is enough to distinguish
> > between them.
> >
> > The only thing you need to add is the OOB size field to 'struct
> > nand_flash_dev'.
> >
> If i only add the oob size field. There will be two items with the same 
> Device ID in nand_flash_ids table,
> one has oob_size, one does not have. such as:
> 
>     {"NAND 8GIB 3,3V 8-bit", 0xDE, 0, 8192, 0, LP_OPTIONS},

Do you know what is this chip?

>     {"NAND 8GIB 3,3V 8-bit", 0xDE, 0, 8192, 0, LP_OPTIONS, 640},   //OOB 
> size is 640

So there are really 2 different chips with the same device id and
different OOB size? If you had 2 datasheets for me demonstrating this,
I'd be grateful.

-- 
Best Regards,
Artem Bityutskiy
