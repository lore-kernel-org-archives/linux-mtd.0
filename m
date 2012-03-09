Received: from mail-we0-f177.google.com ([74.125.82.177])
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S5vtK-0004v5-AA
 for linux-mtd@lists.infradead.org; Fri, 09 Mar 2012 09:13:39 +0000
Received: by werp11 with SMTP id p11so1247433wer.36
 for <linux-mtd@lists.infradead.org>; Fri, 09 Mar 2012 01:13:30 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1331279109.22872.22.camel@sauron.fi.intel.com>
References: <1331216091-6560-1-git-send-email-dedekind1@gmail.com>
 <20120308180826.53123148@halley>
 <1331279109.22872.22.camel@sauron.fi.intel.com>
From: Josselin Costanzi <josselin.costanzi@mobile-devices.fr>
Date: Fri, 9 Mar 2012 10:13:10 +0100
Message-ID: <CAJA4uhcdy4QzspQy7=x1srDfvrTp-bQCA7X5u8cU5KA2UdtkWQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] UBI: allocate verification buffer on demand
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: MTD Maling List <linux-mtd@lists.infradead.org>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2012/3/9 Artem Bityutskiy <dedekind1@gmail.com>:
> On Thu, 2012-03-08 at 18:08 +0200, Shmulik Ladkani wrote:
>> On Thu, =A08 Mar 2012 16:14:50 +0200 Artem Bityutskiy <dedekind1@gmail.c=
om> wrote:
>> > From: Josselin Costanzi <josselin.costanzi@mobile-devices.fr>
>> >
>> > Remove the pre-allocated 'peb_buf2' buffer because we do not really ne=
ed it.
>> > The only reason UBI has it is to check that the data were written corr=
ectly.
>> > But we do not have to have 2 buffers for this and waste RAM - we can j=
ust
>> > compare CRC checksums instead.
>> >
>> > Artem bityutskiy: massaged the patch and commit message
>> >
>> > Signed-off-by: Josselin Costanzi <josselin.costanzi@mobile-devices.fr>
>> > Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
>>
>> Josselin's original title "allocate verification buffer on demand" does
>> no longer describe this patch.
>> Should be "Remove the pre-allocated 'peb_buf2'" or alike.
>
> Fixed as well and pushed out, thanks! Waiting for Josselin's reply
> anyway.
I will try to find time to test your patches today and will give my
feedback ASAP

> commit 43b043e78b876ce27034f167897b57fd2556ad29
> Author: Josselin Costanzi <josselin.costanzi@mobile-devices.fr>
> Date: =A0 Wed Feb 22 16:37:05 2012 +0100
>
> =A0 =A0UBI: reduce memory consumption
>
> =A0 =A0Remove the pre-allocated 'peb_buf2' buffer because we do not reall=
y need it.
> =A0 =A0The only reason UBI has it is to check that the data were written =
correctly.
> =A0 =A0But we do not have to have 2 buffers for this and waste RAM - we c=
an just
> =A0 =A0compare CRC checksums instead. This reduces UBI memory consumption=
.
>
> =A0 =A0Artem bityutskiy: massaged the patch and commit message
>
> =A0 =A0Signed-off-by: Josselin Costanzi <josselin.costanzi@mobile-devices=
.fr>
> =A0 =A0Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
>
>
> --
> Best Regards,
> Artem Bityutskiy
>



--=20
Josselin Costanzi
=A0 Embedded Linux System Engineer

T=E9l. : +33 (0) 1 42 11 93 25
Fax: +33 (0) 1 42 11 87 17


Warning
This message (and any associated files) is intended only for the use
of its intended recipient and may contain information that is
confidential, subject to copyright or constitutes a trade secret. If
you are not the intended recipient you are hereby notified that any
dissemination, copying or distribution of this message, or files
associated with this message, is strictly prohibited. If you have
received this message in error, please notify us immediately by
replying to the message and deleting it from your computer. Any views
or opinions presented are solely those of the author
josselin.costanzi@mobile-devices.fr and do not necessarily represent
those of the company. Although the company has taken reasonable
precautions to ensure no viruses are present in this email, the
company cannot accept responsibility for any loss or damage arising
from the use of this email or attachments.
