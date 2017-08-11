Received: from mail-pg0-x22a.google.com ([2607:f8b0:400e:c05::22a])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dg8Wb-0000Xt-4G
 for linux-mtd@lists.infradead.org; Fri, 11 Aug 2017 11:54:46 +0000
Received: by mail-pg0-x22a.google.com with SMTP id v189so14754656pgd.2
 for <linux-mtd@lists.infradead.org>; Fri, 11 Aug 2017 04:54:24 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CANr77M27AkvoKo8_WGstSOC9Lw89FuDi0bzwf0ddrkr8=G7NnA@mail.gmail.com>
References: <CANr77M27AkvoKo8_WGstSOC9Lw89FuDi0bzwf0ddrkr8=G7NnA@mail.gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Fri, 11 Aug 2017 13:54:23 +0200
Message-ID: <CAFLxGvyWTYj_8Kj0Fpww5B93P=eNDox1srgcmvx4XjVO-q+BKw@mail.gmail.com>
Subject: Re: Correct way to flash an MTD partition using mtd-utils
To: Matthew Stanger <matthew_stanger@trimble.com>
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

Matthew,

On Thu, Aug 10, 2017 at 5:42 PM, Matthew Stanger
<matthew_stanger@trimble.com> wrote:
> Hi all,
>
> I'm hoping someone would be able to tell me the correct way to backup
> a mtd partition. Right now I'm cleaning up some code that would run
> nanddump and pipe it to ubiformat, to dump a RFS from one primary
> partition to an identically sized backup partition. The overlaying
> filesystem being UBIFS. The issue is if the backup partition has an
> extra badblock, than the source, then there isn't enough room. I'm not
> an expert in this space so I'm hoping someone can clarify what the
> correct way is to do this; I'm pretty sure this method isn't right? Is
> using 'mkfs.ubifs' to copy the RFS at the UBIFS layer they way to go
> and then restore it with 'ubinize'? Is there a better, faster way?
> Thanks for any tips.

What exactly do you want to backup?
If you want to backup/restore UBIFS, dd from /dev/ubiX_Y and restore using
ubiupdatevol.

-- 
Thanks,
//richard
