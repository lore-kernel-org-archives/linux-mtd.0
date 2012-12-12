Received: from mail-da0-f49.google.com ([209.85.210.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Tiohi-0000AM-OD
 for linux-mtd@lists.infradead.org; Wed, 12 Dec 2012 15:58:39 +0000
Received: by mail-da0-f49.google.com with SMTP id v40so282879dad.36
 for <linux-mtd@lists.infradead.org>; Wed, 12 Dec 2012 07:58:36 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAFLxGvw9fL_U-KT9sysdyZOLry5skNWR6AUt_XNT10op38e+Gg@mail.gmail.com>
References: <1355314912-9321-1-git-send-email-elezegarcia@gmail.com>
 <CAFLxGvw9fL_U-KT9sysdyZOLry5skNWR6AUt_XNT10op38e+Gg@mail.gmail.com>
From: Gregory CLEMENT <gclement00@gmail.com>
Date: Wed, 12 Dec 2012 16:50:18 +0100
Message-ID: <CADx9zJDhV9+1hZWd8TPqNg7fs38qpY=wmp6yh3a4iLdeOtegPA@mail.gmail.com>
Subject: Re: [RFC/PATCH v2] ubi: Add ubiblock read-write driver
To: richard -rw- weinberger <richard.weinberger@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Ezequiel Garcia <elezegarcia@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 Ezequiel Garcia <ezequiel@free-electrons.com>, linux-mtd@lists.infradead.org,
 Tim Bird <tim.bird@am.sony.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2012/12/12 richard -rw- weinberger <richard.weinberger@gmail.com>:
> Hi!
>
> A few comments...
>
> On Wed, Dec 12, 2012 at 1:21 PM, Ezequiel Garcia <elezegarcia@gmail.com> wrote:
>> --- /dev/null
>> +++ b/drivers/mtd/ubi/ubiblock.c
>> @@ -0,0 +1,830 @@
>> +/*
>> + * Copyright (c) 2012 Ezequiel Garcia
>> + * Copyright (c) 2011 Free Electrons
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License as published by
>> + * the Free Software Foundation; either version 2 of the License, or
>> + * (at your option) any later version.
>
> Linux is GPLv2 and not v2 or any later version...

I think it is more complicate than this.
In the kernel you have code under GPLv2, GPLv2+ and even BSD licenses.
All these licenses are compatible but if you want to distribute all the sources
of the kernel then you are under the more restrictive license: GPLv2.
So we can say that kernel is GPLv2, but it doesn't prevent to submit code
under GPLv2+.

There seems to have a couple of files under GPLv2:
git grep "(at your option) any later version" | wc -l
6800

Regards,
-- 
Gregory CLEMENT
