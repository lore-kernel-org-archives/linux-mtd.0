Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghw8n-0000ts-B6
 for linux-mtd@lists.infradead.org; Fri, 11 Jan 2019 12:42:27 +0000
Received: by mail-lj1-x233.google.com with SMTP id n18-v6so12823539lji.7
 for <linux-mtd@lists.infradead.org>; Fri, 11 Jan 2019 04:42:24 -0800 (PST)
MIME-Version: 1.0
References: <CAGu8XfRpjW9hv918BOoh6jEA1rZ9v-Dngra7cjMi3KegyXOvSQ@mail.gmail.com>
 <CAFLxGvwy7cNdjEqFujHX5LY-42A3V-Moogxj3NNyguPQp_ijEg@mail.gmail.com>
In-Reply-To: <CAFLxGvwy7cNdjEqFujHX5LY-42A3V-Moogxj3NNyguPQp_ijEg@mail.gmail.com>
From: Shibin George <george.shibin1993@gmail.com>
Date: Fri, 11 Jan 2019 18:12:11 +0530
Message-ID: <CAGu8XfQ_iVh-5zb_h5FAi=wHifC+Drf1CPZbdiAzCXtjOoQmXg@mail.gmail.com>
Subject: Re: gluebi vs. ubi-volume mapping
To: Richard Weinberger <richard.weinberger@gmail.com>
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

On Fri, Jan 11, 2019 at 3:23 PM Richard Weinberger
<richard.weinberger@gmail.com> wrote:
>
> On Fri, Jan 11, 2019 at 7:36 AM Shibin George
> <george.shibin1993@gmail.com> wrote:
> >
> > Hi,
> >
> > I am using the gluebi driver to emulate mtd block devices on top of
> > which I use squashfs.
> > I understand that calling ubiattach will result in a gluebi device
> > getting created for each  volume on that ubi device. But is there any
> > way to figure out which gluebi device was created for which particular
> > ubi volume?
> > /proc/mtd does show the mtd device with the name of the ubi volume but
> > I have multiple volumes across different ubi devices with the same
> > volume_name hence the dilemma.
> >
> > Is there already a way to figure out, for a given "ubi-device+volume",
> > which gluebi device was created? Thanks in advance..
>
> AFAIK we have currently no good way to find this relation.
> Except the volume name. If the UBI volume has name "foo", the MTD device
> will use the same.
Got it. Guess I will have to resort to using unique ubi-volume names..
>
> BTW: Why are you using glubi+mtdblock at all? To support squashfs we
> have ubiblock.
> That way you can use read-only block-based filesystems directly on top
> of UBI without glubi
> and mtdblock.
ubiblock, being read-only, didn't satisfy my requirement.
The device I am working on needs to have block-level software upgrade
capability.
So gluebi was the best solution that I could find that can run block-based
filesystem.
>
> --
> Thanks,
> //richard

Regards,
Shibin George
george.shibin1993@gmail.com
