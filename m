Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghwKb-0006Uo-0m
 for linux-mtd@lists.infradead.org; Fri, 11 Jan 2019 12:54:38 +0000
Received: by mail-lj1-x22c.google.com with SMTP id t9-v6so12859606ljh.6
 for <linux-mtd@lists.infradead.org>; Fri, 11 Jan 2019 04:54:35 -0800 (PST)
MIME-Version: 1.0
References: <CAGu8XfRpjW9hv918BOoh6jEA1rZ9v-Dngra7cjMi3KegyXOvSQ@mail.gmail.com>
 <CAFLxGvwy7cNdjEqFujHX5LY-42A3V-Moogxj3NNyguPQp_ijEg@mail.gmail.com>
 <CAGu8XfQ_iVh-5zb_h5FAi=wHifC+Drf1CPZbdiAzCXtjOoQmXg@mail.gmail.com>
 <1835331.mx3o4XuZP5@blindfold>
In-Reply-To: <1835331.mx3o4XuZP5@blindfold>
From: Shibin George <george.shibin1993@gmail.com>
Date: Fri, 11 Jan 2019 18:24:22 +0530
Message-ID: <CAGu8XfShQkmshMMgP24ee_Csf6rcdEoG4p2o1kLhAW8JL+CX-w@mail.gmail.com>
Subject: Re: gluebi vs. ubi-volume mapping
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jan 11, 2019 at 6:14 PM Richard Weinberger <richard@nod.at> wrote:
>
> > ubiblock, being read-only, didn't satisfy my requirement.
> > The device I am working on needs to have block-level software upgrade
> > capability.
> > So gluebi was the best solution that I could find that can run block-based
> > filesystem.
>
> Usually you don't want such a deep stacking on an embedded system.
> But you are aware of ubiupdatevol?

Yes, ubiupdatevol was one of the candidates. However, I needed the capability
to upgrade software incrementally instead of packing the entire ubifs image
(This is because I can't afford to reserve storage for large software-upgrade
packages).
I had posted this query about ubiupdatevol @
https://stackoverflow.com/questions/50699945/apply-incremental-patches-on-ubifs-volume
and finally had to discard ubifs for my purpose for the same reason.
That and the fact the current software-upgrade solution that I have works well
with block-based filesystems.

> Thanks,
> //richard
>
>
>

Regards,

Shibin George
george.shibin1993@gmail.com
