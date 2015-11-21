Received: from mail-ob0-x243.google.com ([2607:f8b0:4003:c01::243])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a0A6b-0001u7-AT
 for linux-mtd@lists.infradead.org; Sat, 21 Nov 2015 15:29:38 +0000
Received: by obbbj7 with SMTP id bj7so9692777obb.3
 for <linux-mtd@lists.infradead.org>; Sat, 21 Nov 2015 07:29:15 -0800 (PST)
MIME-Version: 1.0
Sender: kalluripunnaiahchoudary@gmail.com
In-Reply-To: <20151120193342.GX64635@google.com>
References: <1446742735-20824-1-git-send-email-punnaia@xilinx.com>
 <20151120193342.GX64635@google.com>
Date: Sat, 21 Nov 2015 20:59:15 +0530
Message-ID: <CAGnW=BZzoo1YFyAYx+oKkCPBOCTSz_KYY+t0=2wh4Fscx7e0eg@mail.gmail.com>
Subject: Re: [PATCH] mtd: Expand the ecc placement locations to 1216
From: punnaiah choudary kalluri <punnaia@xilinx.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>,
 David Woodhouse <dwmw2@infradead.org>,
 "michals@xilinx.com" <michals@xilinx.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-api@vger.kernel.org, Punnaiah Choudary <kpc528@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Nov 21, 2015 at 1:03 AM, Brian Norris
<computersforpeace@gmail.com> wrote:
> On Thu, Nov 05, 2015 at 10:28:55PM +0530, Punnaiah Choudary Kalluri wrote:
>> Device like MT29F32G08ABCDBJ4 have a writesize/oobsize of 16K/1216 Bytes.
>> So, increasing the maximum ecc placement locations to 1216
>
> I'd really prefer not increasing the size of the internal arrays any
> more. The structures should be rewritten to be dynamic.

Ok. I have seen the comment "nand_ecclayout should be expandable in the
future simply by the above macros" and so increased the macro sizes.
As you said, it is ideal to have memory allocated dynamically for eccpos and
oobfree fields.

>
>> Signed-off-by: Punnaiah Choudary Kalluri <punnaia@xilinx.com>
>> ---
>>  include/linux/mtd/mtd.h    | 2 +-
>>  include/uapi/mtd/mtd-abi.h | 4 ++--
>>  2 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
>> index f17fa75..1fd3cc6 100644
>> --- a/include/linux/mtd/mtd.h
>> +++ b/include/linux/mtd/mtd.h
>> @@ -95,7 +95,7 @@ struct mtd_oob_ops {
>>  };
>>
>>  #define MTD_MAX_OOBFREE_ENTRIES_LARGE        32
>> -#define MTD_MAX_ECCPOS_ENTRIES_LARGE 640
>> +#define MTD_MAX_ECCPOS_ENTRIES_LARGE 1216
>>  /*
>>   * Internal ECC layout control structure. For historical reasons, there is a
>>   * similar, smaller struct nand_ecclayout_user (in mtd-abi.h) that is retained
>> diff --git a/include/uapi/mtd/mtd-abi.h b/include/uapi/mtd/mtd-abi.h
>> index 763bb69..c4d592c 100644
>> --- a/include/uapi/mtd/mtd-abi.h
>> +++ b/include/uapi/mtd/mtd-abi.h
>> @@ -220,8 +220,8 @@ struct nand_oobfree {
>>       __u32 length;
>>  };
>>
>> -#define MTD_MAX_OOBFREE_ENTRIES      8
>> -#define MTD_MAX_ECCPOS_ENTRIES       64
>> +#define MTD_MAX_OOBFREE_ENTRIES      32
>> +#define MTD_MAX_ECCPOS_ENTRIES       1216
>
> NAK. This is part of the ABI, and changing this will break user space.
> If you actually bothered to read code, you might understand why there
> are now internal and external versions of this struct. The external
> (user space) version cannot be changed. The internal version can be
> refactored, as long as the external version still maintains some sanity,
> at least for old/small devices.

Sorry, I am confused here.
Arasan nand controller supports 24 bit ecc and uses BCH algorithm. So,
it requires
672 ecc positions. in this case, how the user space know which are the free
slots available in spare area?
because as per the above definitions only 64 positions can be defined.

Regards,
Punnaiah

>
>>  /*
>>   * OBSOLETE: ECC layout control structure. Exported to user-space via ioctl
>>   * ECCGETLAYOUT for backwards compatbility and should not be mistaken as a
>
> Brian
