Received: from mail-qk0-x232.google.com ([2607:f8b0:400d:c09::232])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dgDBU-0000e7-QX
 for linux-mtd@lists.infradead.org; Fri, 11 Aug 2017 16:53:18 +0000
Received: by mail-qk0-x232.google.com with SMTP id d145so23593206qkc.2
 for <linux-mtd@lists.infradead.org>; Fri, 11 Aug 2017 09:52:56 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAFLxGvyWTYj_8Kj0Fpww5B93P=eNDox1srgcmvx4XjVO-q+BKw@mail.gmail.com>
References: <CANr77M27AkvoKo8_WGstSOC9Lw89FuDi0bzwf0ddrkr8=G7NnA@mail.gmail.com>
 <CAFLxGvyWTYj_8Kj0Fpww5B93P=eNDox1srgcmvx4XjVO-q+BKw@mail.gmail.com>
From: Matthew Stanger <matthew_stanger@trimble.com>
Date: Fri, 11 Aug 2017 10:52:51 -0600
Message-ID: <CANr77M0u3ZduU-6dEjrdPKrESj7o8LePncKeM3GT-Vh+GYH=BQ@mail.gmail.com>
Subject: Re: Correct way to flash an MTD partition using mtd-utils
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thanks Richard,

That worked perfect for me.

Cheers,

On Fri, Aug 11, 2017 at 5:54 AM, Richard Weinberger
<richard.weinberger@gmail.com> wrote:
> Matthew,
>
> On Thu, Aug 10, 2017 at 5:42 PM, Matthew Stanger
> <matthew_stanger@trimble.com> wrote:
>> Hi all,
>>
>> I'm hoping someone would be able to tell me the correct way to backup
>> a mtd partition. Right now I'm cleaning up some code that would run
>> nanddump and pipe it to ubiformat, to dump a RFS from one primary
>> partition to an identically sized backup partition. The overlaying
>> filesystem being UBIFS. The issue is if the backup partition has an
>> extra badblock, than the source, then there isn't enough room. I'm not
>> an expert in this space so I'm hoping someone can clarify what the
>> correct way is to do this; I'm pretty sure this method isn't right? Is
>> using 'mkfs.ubifs' to copy the RFS at the UBIFS layer they way to go
>> and then restore it with 'ubinize'? Is there a better, faster way?
>> Thanks for any tips.
>
> What exactly do you want to backup?
> If you want to backup/restore UBIFS, dd from /dev/ubiX_Y and restore using
> ubiupdatevol.
>
> --
> Thanks,
> //richard
