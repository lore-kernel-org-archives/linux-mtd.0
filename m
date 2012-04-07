Received: from mail-gx0-f177.google.com ([209.85.161.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SGJsq-0008Ii-PU
 for linux-mtd@lists.infradead.org; Sat, 07 Apr 2012 00:52:05 +0000
Received: by ggnk1 with SMTP id k1so1602601ggn.36
 for <linux-mtd@lists.infradead.org>; Fri, 06 Apr 2012 17:52:01 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <071A08F2C6A57E4E94D980ECA553F8745EEA99@039-SN1MPN1-005.039d.mgd.msft.net>
References: <071A08F2C6A57E4E94D980ECA553F8745E82D5@039-SN1MPN1-005.039d.mgd.msft.net>
 <CAN8TOE-0GPgbfgrps-ieQb9NYnOFv79TZdxhTyd_ydPboP_8Pg@mail.gmail.com>
 <071A08F2C6A57E4E94D980ECA553F8745EEA99@039-SN1MPN1-005.039d.mgd.msft.net>
Date: Fri, 6 Apr 2012 17:52:01 -0700
Message-ID: <CAN8TOE9P9NvD+sRB8MurCkETDKmKUmvkq_M-3kCF+0zaZgsjTg@mail.gmail.com>
Subject: Re: Query mtd-utils v1.4.9 : flash_erase.c
From: Brian Norris <computersforpeace@gmail.com>
To: Kushwaha Prabhakar-B32579 <B32579@freescale.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Wood Scott-B07421 <B07421@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Mike Frysinger <vapier.adi@gmail.com>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Apr 5, 2012 at 5:44 PM, Kushwaha Prabhakar-B32579
<B32579@freescale.com> wrote:
>> -----Original Message-----
>> From: Brian Norris [mailto:computersforpeace@gmail.com]
>>
>> On Thu, Apr 5, 2012 at 2:21 AM, Kushwaha Prabhakar-B32579 <B32579@freesc=
ale.com> wrote:
>> > =A0I checked latest mtd-utils ver 1.4.9 for file flash_erase.c.
>> >
>> > It usage MEMGETOOBSEL ioctl to get OOB information from the driver. Bu=
t
>> this ioctl may returns error for big NAND chips.
>> > The reason of failure would be the following condition at
>> > linux/driver/mtd/mtdchar.c
>> > =A0if (mtd->ecclayout->eccbytes > ARRAY_SIZE(oi.eccpos))
>> >
>> > MEMGETOOBSEL has been obsolete. then Why mtd-utils still using it.
>>
>> A few reasons:
>> (1) There is no replacement interface and there is no plan for a
>> replacement AFAIK (unless you count MTD_OOB_AUTO within the kernel, as
>> you mention).
>> (2) It's only used for the legacy option JFFS2 format option (-j or --
>> jffs2). JFFS2 isn't supported much anymore, and it probably is not worth
>> using on "big NAND chips." On some systems, ECC does not even leave
>> enough room in OOB for JFFS2.
>
> Looks like mtd-utils is no more interested in supporting jffs2 for big NA=
ND chips.
>
> Going forward, =A0ubifs is the File system for NAND chips supported by mt=
d-utils??

Personally, I only work with UBIFS.

>> > Also, I don't think flash_erase.c supports MTD_OOB_AUTO. Although its
>> support is already part of Linux kernel.
>>
>> What do you mean by "support MTD_OOB_AUTO" (this is actually renamed
>> MTD_OPS_AUTO_OOB, btw)? If you're speaking of the -j option still, then
>> it's probably because nobody has bothered supporting old features on new
>> userspace tools with new (large-OOB) chips. This would require a
>> developer who cares about JFFS2 to compare the various versions of
>> "autoplace." It wouldn't be too hard to make this use MTD_OPS_AUTO_OOB; =
I
>> just haven't studied auto/jffs2 much...
>
> Means, If I want to use, I have to make local changes in mtd-utils :(

Not exactly. If you are such a developer who cares about JFFS2 and
will do a little bit of necessary work, then we can integrate your
"local changes" into mtd-utils (provided, of course, they pass some
amount of review). This is open source! As I said, I could probably
write such patches, but I'm not testing JFFS2.

> Is there any plan to support MTD_OPS_AUTO_OOB in future in-case somebody =
send patch?

At this point, I'd hope others might speak up. Personally, I don't see
why we couldn't accept patch(es) if they are reviewed and tested
properly. I don't know of a "plan."

Brian
