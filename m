Received: from na3sys009aog118.obsmtp.com ([74.125.149.244])
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RkPNl-0001Ay-I6
 for linux-mtd@lists.infradead.org; Tue, 10 Jan 2012 00:16:06 +0000
Received: by mail-vx0-f171.google.com with SMTP id fl11so5389946vcb.16
 for <linux-mtd@lists.infradead.org>; Mon, 09 Jan 2012 16:16:03 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAN8TOE_5KGaxOtgYn2hSAfaccF9_-fxjzgiSy4d_0HArwZ=wew@mail.gmail.com>
References: <CA+0Dg4q8+6Z+UAr6ni0v_GA70Phhaug-s=PCZyYLjHV1Sk-Qww@mail.gmail.com>
 <CAN8TOE_5KGaxOtgYn2hSAfaccF9_-fxjzgiSy4d_0HArwZ=wew@mail.gmail.com>
Date: Tue, 10 Jan 2012 11:16:03 +1100
Message-ID: <CA+0Dg4rZVcW2jJP6EbXsh+OAvCB3vPA_az8bz2hGrEmeOrnm6A@mail.gmail.com>
Subject: Re: No oob scheme defined for oobsize 218
From: Joo Aun Saw <jasaw@dius.com.au>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm running UBI(FS) on top of it, so I don't need the OOB area. In
this case, what's the best way to work around this problem? Should I
use a smaller ECC layout or disable ECC?

How is the ECC layout defined, as in what decides how big the
eccbytes, eccpos, oobfree should be?




On Tue, Jan 10, 2012 at 4:36 AM, Brian Norris
<computersforpeace@gmail.com> wrote:
> On Sun, Jan 8, 2012 at 10:34 PM, Joo Aun Saw <jasaw@dius.com.au> wrote:
>> I'm getting this error and hope someone can help me.
>>
>> ONFI flash detected
>> ONFI param page 0 valid
>> NAND device: Manufacturer ID: 0x2c, Chip ID: 0xd3 (Micron MT29F8G08AAA)
>> No oob scheme defined for oobsize 218
>>
>> Do I need to define struct nand_ecclayout nand_oob_218? or can I use
>> the nand_oob_128 ecc layout?
>> I'm running Linux version 3.0.4.
>
> This may depend on what hardware/driver, what type of ECC you're
> using, and what filesystem you're using on top of your MTD. It's
> possible you can get by with just using a "smaller" ECC layout,
> especially if you're not using the OOB area for filesystem data (e.g.,
> UBI(FS), which doesn't use OOB). You just won't have as much "free"
> OOB area (again, doesn't matter much for UBI(FS)) and your ECC layout
> might not reflect the actual positioning of your ECC data.
>
> Brian
