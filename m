Received: from mail.analogue-micro.com ([217.144.149.242])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aWN2E-0007QE-5l
 for linux-mtd@lists.infradead.org; Thu, 18 Feb 2016 11:46:16 +0000
From: Gary Thomas <gary@mlbassoc.com>
Subject: Re: NAND dump questions
To: Richard Weinberger <richard.weinberger@gmail.com>
References: <56C57F32.8080301@mlbassoc.com>
 <CAFLxGvwzdcTs+hLoOCzc26VcxD08bke92EfHVVbmRgoqrooMpA@mail.gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Message-ID: <56C5AEED.30704@mlbassoc.com>
Date: Thu, 18 Feb 2016 12:45:49 +0100
MIME-Version: 1.0
In-Reply-To: <CAFLxGvwzdcTs+hLoOCzc26VcxD08bke92EfHVVbmRgoqrooMpA@mail.gmail.com>
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

On 2016-02-18 10:27, Richard Weinberger wrote:
> Hi!
>
> On Thu, Feb 18, 2016 at 9:22 AM, Gary Thomas <gary@mlbassoc.com> wrote:
>> I'm trying to use 'nanddump' to help me duplicate a NAND device.
>> The idea is to provide a production lab with raw dumps, including
>> OOB data for every page.  They have a programming machine which can
>> take these dumps and program the device.  This process is interesting
>> because we need to make thousands of identical devices and programming
>> the NAND manually takes a lot of time & manpower.
>
> [...]
>
>> Any ideas what's going on here?  What else can I look at to diagnose the
>> issue?
>>
>> Note: I've actually done this process on another system which is
>> TI/OMAP Davinci based.  On that device (a different NAND chip and
>> a different production lab), the duplication worked perfectly.
>
> I read your mail and the first thing that alarmed me was, why OOB?
> Can you please retry without OOB and which read errors do you get?
> I bet uncorrectable ECC errors...
>

The reason for the OOB is that the production lab doesn't have the
ability to generate that info itself - they only know how to push
raw bits (all of them) into the device.  Maybe there are better ways
to mass duplicate NAND devices - does anyone know?

I think that the driver or device is not reporting the correct OOB data.
If I look at another i.MX6 board I have which is fitted with a different
NAND device, the OOB is vastly different.  Using U-Boot to dump some OOB

On the failing board with this NAND device:
   nand: device found, Manufacturer ID: 0x2c, Chip ID: 0x48
   nand: Micron MT29F16G08ABACAWP
   nand: 2048MiB, SLC, page size: 4096, OOB size: 224

Page 00780000 dump:
OOB:
         ff 00 00 00 00 00 00 00
         00 00 00 00 00 00 00 00
         00 00 00 00 00 00 00 00
         00 00 00 00 00 00 00 00
         00 00 00 00 00 00 00 00
         00 00 00 00 00 00 00 00
         00 00 00 00 00 00 00 00
         00 00 00 00 00 00 00 00
         00 00 00 00 00 00 00 00
         00 00 00 00 00 00 00 00
         00 00 00 00 00 00 00 00
         00 00 00 00 00 00 00 00
         00 00 00 00 00 00 00 00
         00 00 00 00 00 00 00 00
         00 00 00 00 00 00 00 00
         00 00 00 00 00 00 00 00
         00 00 00 00 00 00 00 00
         00 00 00 00 00 00 00 00
         00 00 00 00 00 00 00 00
         00 00 00 00 00 00 00 00
         00 00 00 00 00 00 00 00
         00 00 00 00 00 00 00 00
         00 00 00 00 00 00 00 00
         00 00 00 00 00 00 00 00
         9b af dc 75 5f 24 d8 95
         ba 51 16 e5 f3 5d 8d a8
         37 66 08 44 f1 63 ac 5d
         e8 49 00 00 00 00 00 00

On the other board with this NAND device
   nand: device found, Manufacturer ID: 0x01, Chip ID: 0xdc
   nand: AMD/Spansion S34ML04G2
   nand: 512MiB, SLC, page size: 2048, OOB size: 128

Page 003e0000 dump:
OOB:
         ff 5b 4f 1b de 98 99 18
         8c 0e 59 99 5d 0f db 18
         19 cb 10 53 50 50 cb 95
         d5 51 10 4b 9a 59 8f d4
         91 90 0c 0d c8 d8 9b db
         dc 1b 5b 99 18 5b 98 db
         5a 0f 0c 88 5d 1a 59 d9
         5b 4f 1b de 98 99 58 8c
         ce 9b 99 19 88 5d 1a 59
         d9 5b 4f 1b de 98 99 98
         8c ce 9b 99 19 88 5d 1a
         59 d9 5b 4f 1b de 98 99
         d8 4c 07 03 98 ab 17 1c
         cc 1e fa 21 6f 43 d4 3b
         bc 8d 56 0b 20 77 0d de
         09 1a 2c ef 7b 82 a8 00

Different NAND devices, same kernel rev & SOC (i.MX6).  Look how
different - how many non-zero bits are in the AMD device.  Is
this significant at all?

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------
