Received: from mail-pa0-f49.google.com ([209.85.220.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TipCD-000490-1h
 for linux-mtd@lists.infradead.org; Wed, 12 Dec 2012 16:30:09 +0000
Received: by mail-pa0-f49.google.com with SMTP id bi1so705179pad.36
 for <linux-mtd@lists.infradead.org>; Wed, 12 Dec 2012 08:30:07 -0800 (PST)
Date: Wed, 12 Dec 2012 08:30:00 -0800
From: Greg KH <gregkh@linuxfoundation.org>
To: richard -rw- weinberger <richard.weinberger@gmail.com>
Subject: Re: [RFC/PATCH v2] ubi: Add ubiblock read-write driver
Message-ID: <20121212163000.GA4848@kroah.com>
References: <1355314912-9321-1-git-send-email-elezegarcia@gmail.com>
 <CAFLxGvw9fL_U-KT9sysdyZOLry5skNWR6AUt_XNT10op38e+Gg@mail.gmail.com>
 <CADx9zJDhV9+1hZWd8TPqNg7fs38qpY=wmp6yh3a4iLdeOtegPA@mail.gmail.com>
 <CAFLxGvyQ5q3T7JfsY3fqiEB1DKiEBj=jWZEEfJpApc0fuNv2AA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFLxGvyQ5q3T7JfsY3fqiEB1DKiEBj=jWZEEfJpApc0fuNv2AA@mail.gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Ezequiel Garcia <elezegarcia@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 Ezequiel Garcia <ezequiel@free-electrons.com>, linux-mtd@lists.infradead.org,
 Tim Bird <tim.bird@am.sony.com>, Gregory CLEMENT <gclement00@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Dec 12, 2012 at 05:14:41PM +0100, richard -rw- weinberger wrote:
> On Wed, Dec 12, 2012 at 4:50 PM, Gregory CLEMENT <gclement00@gmail.com> wrote:
> > 2012/12/12 richard -rw- weinberger <richard.weinberger@gmail.com>:
> >> Hi!
> >>
> >> A few comments...
> >>
> >> On Wed, Dec 12, 2012 at 1:21 PM, Ezequiel Garcia <elezegarcia@gmail.com> wrote:
> >>> --- /dev/null
> >>> +++ b/drivers/mtd/ubi/ubiblock.c
> >>> @@ -0,0 +1,830 @@
> >>> +/*
> >>> + * Copyright (c) 2012 Ezequiel Garcia
> >>> + * Copyright (c) 2011 Free Electrons
> >>> + *
> >>> + * This program is free software; you can redistribute it and/or modify
> >>> + * it under the terms of the GNU General Public License as published by
> >>> + * the Free Software Foundation; either version 2 of the License, or
> >>> + * (at your option) any later version.
> >>
> >> Linux is GPLv2 and not v2 or any later version...
> >
> > I think it is more complicate than this.
> > In the kernel you have code under GPLv2, GPLv2+ and even BSD licenses.
> > All these licenses are compatible but if you want to distribute all the sources
> > of the kernel then you are under the more restrictive license: GPLv2.
> > So we can say that kernel is GPLv2, but it doesn't prevent to submit code
> > under GPLv2+.
> 
> The kernel is GPLv2. period.

The overall kernel is, yes, but individual files can also have
additional licenses on them.

> > There seems to have a couple of files under GPLv2:
> > git grep "(at your option) any later version" | wc -l
> > 6800
> 
> These lines are wrong.

Not true at all, please consult a lawyer if you are unsure.

greg k-h
