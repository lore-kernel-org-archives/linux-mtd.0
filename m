Received: from mail-oi0-x22c.google.com ([2607:f8b0:4003:c06::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a3nS8-0006i6-Mo
 for linux-mtd@lists.infradead.org; Tue, 01 Dec 2015 16:06:54 +0000
Received: by oies6 with SMTP id s6so6532628oie.1
 for <linux-mtd@lists.infradead.org>; Tue, 01 Dec 2015 08:06:31 -0800 (PST)
MIME-Version: 1.0
Sender: kalluripunnaiahchoudary@gmail.com
In-Reply-To: <20151130211105.GO64635@google.com>
References: <1446742735-20824-1-git-send-email-punnaia@xilinx.com>
 <20151120193342.GX64635@google.com>
 <CAGnW=BZzoo1YFyAYx+oKkCPBOCTSz_KYY+t0=2wh4Fscx7e0eg@mail.gmail.com>
 <20151130211105.GO64635@google.com>
Date: Tue, 1 Dec 2015 21:36:31 +0530
Message-ID: <CAGnW=Bbcbgca4PW8aXUOoyhQxTC2qR4gJ9MSJVd2uCWzJ99r7A@mail.gmail.com>
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

Hi Brian,

On Tue, Dec 1, 2015 at 2:41 AM, Brian Norris
<computersforpeace@gmail.com> wrote:
> Hi Punnaiah,
>
> On Sat, Nov 21, 2015 at 08:59:15PM +0530, punnaiah choudary kalluri wrote:
>> On Sat, Nov 21, 2015 at 1:03 AM, Brian Norris
>> <computersforpeace@gmail.com> wrote:
>> > On Thu, Nov 05, 2015 at 10:28:55PM +0530, Punnaiah Choudary Kalluri wrote:
>> >> Device like MT29F32G08ABCDBJ4 have a writesize/oobsize of 16K/1216 Bytes.
>> >> So, increasing the maximum ecc placement locations to 1216
>> >
>> > I'd really prefer not increasing the size of the internal arrays any
>> > more. The structures should be rewritten to be dynamic.
>>
>> Ok. I have seen the comment "nand_ecclayout should be expandable in the
>> future simply by the above macros" and so increased the macro sizes.
>> As you said, it is ideal to have memory allocated dynamically for eccpos and
>> oobfree fields.
>
> Yes, it *can* be done. Previously, we couldn't do this, because any
> change there would also change the ABI, which is off limits, but I fixed
> that by separating the 'nand_ecclayout' and 'nand_ecclayout_user'
> structs. That still doesn't make it preferable. These structs are
> getting pretty big, and they hold a very low density of information...
>
>> >
>> >> Signed-off-by: Punnaiah Choudary Kalluri <punnaia@xilinx.com>
>> >> ---
>> >>  include/linux/mtd/mtd.h    | 2 +-
>> >>  include/uapi/mtd/mtd-abi.h | 4 ++--
>> >>  2 files changed, 3 insertions(+), 3 deletions(-)
>> >>
>> >> diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
>> >> index f17fa75..1fd3cc6 100644
>> >> --- a/include/linux/mtd/mtd.h
>> >> +++ b/include/linux/mtd/mtd.h
>> >> @@ -95,7 +95,7 @@ struct mtd_oob_ops {
>> >>  };
>> >>
>> >>  #define MTD_MAX_OOBFREE_ENTRIES_LARGE        32
>> >> -#define MTD_MAX_ECCPOS_ENTRIES_LARGE 640
>> >> +#define MTD_MAX_ECCPOS_ENTRIES_LARGE 1216
>> >>  /*
>> >>   * Internal ECC layout control structure. For historical reasons, there is a
>> >>   * similar, smaller struct nand_ecclayout_user (in mtd-abi.h) that is retained
>> >> diff --git a/include/uapi/mtd/mtd-abi.h b/include/uapi/mtd/mtd-abi.h
>> >> index 763bb69..c4d592c 100644
>> >> --- a/include/uapi/mtd/mtd-abi.h
>> >> +++ b/include/uapi/mtd/mtd-abi.h
>> >> @@ -220,8 +220,8 @@ struct nand_oobfree {
>> >>       __u32 length;
>> >>  };
>> >>
>> >> -#define MTD_MAX_OOBFREE_ENTRIES      8
>> >> -#define MTD_MAX_ECCPOS_ENTRIES       64
>> >> +#define MTD_MAX_OOBFREE_ENTRIES      32
>> >> +#define MTD_MAX_ECCPOS_ENTRIES       1216
>> >
>> > NAK. This is part of the ABI, and changing this will break user space.
>> > If you actually bothered to read code, you might understand why there
>> > are now internal and external versions of this struct. The external
>> > (user space) version cannot be changed. The internal version can be
>> > refactored, as long as the external version still maintains some sanity,
>> > at least for old/small devices.
>>
>> Sorry, I am confused here.
>> Arasan nand controller supports 24 bit ecc and uses BCH algorithm. So,
>> it requires
>> 672 ecc positions. in this case, how the user space know which are the free
>> slots available in spare area?
>> because as per the above definitions only 64 positions can be defined.
>
> If you actually need to know this info from user space, then you need to
> define a new interface to expose that. The existing one is legacy, and
> it is insufficient for most modern use cases. It won't work for you.
>
> Other mechanisms can already help you though. For one, auto-placed OOB
> (e.g., 'nandwrite --autoplace') can let the MTD layer automatically put
> your data into the available spare area.
>
> Why do you need to access the spare area anyway? Modern NAND filesystems
> shouldn't really be storing anything there anyway.
>

I have tested jffs2 and ubifs file system using arasan nand driver but
observed issues
with jffs2 filesystem. While debugging further found that the jffs2
file system is using
the oob area for storing the clear markers.

Not only for file system, probably one can implement application for
accessing  the
nand in raw mode and may utilize the oob area for other purposes like
storing the
encryption/decryption  key associated with the page data.

not related to this patch, request your time and help for reviewing
the arasan nand driver patch.
http://permalink.gmane.org/gmane.linux.kernel/2090815


Regards,
Punnaiah
> Brian
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
