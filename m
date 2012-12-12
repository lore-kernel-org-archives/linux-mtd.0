Received: from mail-ie0-f177.google.com ([209.85.223.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TipHg-0004uQ-E3
 for linux-mtd@lists.infradead.org; Wed, 12 Dec 2012 16:35:48 +0000
Received: by mail-ie0-f177.google.com with SMTP id k13so2247714iea.36
 for <linux-mtd@lists.infradead.org>; Wed, 12 Dec 2012 08:35:47 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CALF0-+Uy5Cc5DDT_80ArK8r7BE5fg9YgxKGoJ34Q3LzT_jhL+g@mail.gmail.com>
References: <1355314912-9321-1-git-send-email-elezegarcia@gmail.com>
 <CAFLxGvw9fL_U-KT9sysdyZOLry5skNWR6AUt_XNT10op38e+Gg@mail.gmail.com>
 <CALF0-+Uy5Cc5DDT_80ArK8r7BE5fg9YgxKGoJ34Q3LzT_jhL+g@mail.gmail.com>
Date: Wed, 12 Dec 2012 13:35:46 -0300
Message-ID: <CALF0-+WzXEbzfZfnkM7eX53JENDSPQoO5-qYiwX593pM_jwW1g@mail.gmail.com>
Subject: Re: [RFC/PATCH v2] ubi: Add ubiblock read-write driver
From: Ezequiel Garcia <elezegarcia@gmail.com>
To: richard -rw- weinberger <richard.weinberger@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 Ezequiel Garcia <ezequiel@free-electrons.com>, linux-mtd@lists.infradead.org,
 Tim Bird <tim.bird@am.sony.com>, gregkh <gregkh@linuxfoundation.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Dec 12, 2012 at 1:18 PM, Ezequiel Garcia <elezegarcia@gmail.com> wrote:
> Hi Richard,
>
> Thanks for the feedback.
> Yeah I forgot the remove some clumsy or work-in-progress code. Shame on me :-(
>
> Anyway, I wanted to post the new cache shape and the new module parameter
> to get some feedback. I'd like to decide if write support is useful or not.
>
> On Wed, Dec 12, 2012 at 12:21 PM, richard -rw- weinberger
> <richard.weinberger@gmail.com> wrote:
>> Hi!
>>
>> A few comments...
>>
>> On Wed, Dec 12, 2012 at 1:21 PM, Ezequiel Garcia <elezegarcia@gmail.com> wrote:
>>> --- /dev/null
>>> +++ b/drivers/mtd/ubi/ubiblock.c
>>> @@ -0,0 +1,830 @@
>>> +/*
>>> + * Copyright (c) 2012 Ezequiel Garcia
>>> + * Copyright (c) 2011 Free Electrons
>>> + *
>>> + * This program is free software; you can redistribute it and/or modify
>>> + * it under the terms of the GNU General Public License as published by
>>> + * the Free Software Foundation; either version 2 of the License, or
>>> + * (at your option) any later version.
>>
>> Linux is GPLv2 and not v2 or any later version...
>>
>
> True.
>

On a second thought and considering this code is originally
copyrighted by Free Electrons,
I'd guess I need their permission to make a license change (right?).

So considering Greg's comments, I'll leave it as it is and let Free
Electrons decide.

Thanks,

    Ezequiel
