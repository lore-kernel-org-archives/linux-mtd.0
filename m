Received: from mail-wm0-x230.google.com ([2a00:1450:400c:c09::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZtYUw-00085J-UY
 for linux-mtd@lists.infradead.org; Tue, 03 Nov 2015 10:07:30 +0000
Received: by wmff134 with SMTP id f134so10299714wmf.0
 for <linux-mtd@lists.infradead.org>; Tue, 03 Nov 2015 02:07:05 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <562E8697.50207@nod.at>
References: <CAJ+vNU3eu4qBxaZpDRY=Fidv=9iGmA5pq8b4yUfyBayLTos5oQ@mail.gmail.com>
 <562E8697.50207@nod.at>
From: Michal Suchanek <hramrach@gmail.com>
Date: Tue, 3 Nov 2015 11:06:25 +0100
Message-ID: <CAOMqctQz=MnPMw2Dq-SFGwa1g7tPw7jG25Rh9=W4xkw-__HXDg@mail.gmail.com>
Subject: Re: UBIFS corruption after power cut - possibly unstable bits issue?
To: Richard Weinberger <richard@nod.at>
Cc: Tim Harvey <tharvey@gateworks.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 26 October 2015 at 21:01, Richard Weinberger <richard@nod.at> wrote:
> Tim,
>
> Am 26.10.2015 um 20:37 schrieb Tim Harvey:
>>
>> [    9.282782]  r4:00000000 r3:00000000
>> [    9.286909] UBIFS error (ubi0:0 pid 1): ubifs_recover_leb: corrupt
>> empty space LEB 377:217088, corruption starts at 24762
>> [    9.297900] UBIFS error (ubi0:0 pid 1): ubifs_scanned_corruption:
>> corruption at LEB 377:241850
>> [    9.306536] UBIFS error (ubi0:0 pid 1): ubifs_scanned_corruption:
>> first 8192 bytes from LEB 377:241850
>> [    9.315870] 00000000: ffffffef ffffffff ffffffff ffffffff ffffffff
>> ffffffff ffffffff ffffffff  ................................
>> [    9.327374] 00000020: ffffffff ffffffff ffffffff ffffffff ffffffff
>> ffffffff ffffffff ffffffff  ................................
>> [    9.338883] 00000040: ffffffff ffffffff ffffffff ffffffff ffffffff
>> ffffffff ffffffff ffffffff  ................................
>> [    9.350389] 00000060: ffffffff ffffffff ffffffff ffffffff ffffffff
>> ffffffff ffffffff ffffffff  ................................
>> ...
>> [    9.352755] 00001fc0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff f
>> fffffff ffffffff  ................................
>> [    9.352765] 00001fe0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff f
>> fffffff ffffffff  ................................
>> [    9.352770] UBIFS error (ubi0:0 pid 1): ubifs_recover_leb: LEB 377 scanning f
>> ailed
>> [   12.271485] VFS: Cannot open root device "ubi0:rootfs" or unknown-block(0,0):
>>  error -117
>>
>> Thus far we have encountered this with a 16Gb MT29F16G08 and 'not'
>> with a 2Gb MT29F2G08. The two parts have different geometries and the
>> 16Gb part has a much larger block erase time (2ms) compared to the 2Gb
>> (700us).
>
> gpmi-nand is not able to correct bit flips on erased pages.
> This is why UBI is facing uncorrectable ECC errors and UBIFS gives up.
> In March there was an attempt to fix that in software.
> But no mainline ready solution was presented so far:
> http://lists.infradead.org/pipermail/linux-mtd/2014-March/052521.html
>
> It is not clear whether to implement this directly in gpmi-nand or MTD core.
> Currently UBIFS assumes that empty spaces must contain only 0xff octets.
> A naive approach would be removing that check from UBIFS, bit this can have
> disastrous consequences as UBIFS's recovery algorithm relies on that.

Hello,

it has been pointed out that this assumption on the part of UBI that
erased pages are composed of 0xff bytes is just wrong.

Here it is wrong in the sense that the pages are not bit-perfect but
there are other reasons why it may go wrong.

- if the nand controller uses randomization layer the pages are 0xff
bytes transformed by the randomization layer

- if MTD grows full-disk encryption then reading a page of 0xff bytes
will yield what this page decrypts to using current encryption scheme

The layering is wrong here. The MTD core should provide a function to
check if a physical page is empty and the driver should provide
driver-specific implementation if needed.

Thanks

Michal
