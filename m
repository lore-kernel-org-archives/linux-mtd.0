Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghtVY-0000Qg-8g
 for linux-mtd@lists.infradead.org; Fri, 11 Jan 2019 09:53:45 +0000
Received: by mail-wr1-x429.google.com with SMTP id p4so14473414wrt.7
 for <linux-mtd@lists.infradead.org>; Fri, 11 Jan 2019 01:53:43 -0800 (PST)
MIME-Version: 1.0
References: <CAGu8XfRpjW9hv918BOoh6jEA1rZ9v-Dngra7cjMi3KegyXOvSQ@mail.gmail.com>
In-Reply-To: <CAGu8XfRpjW9hv918BOoh6jEA1rZ9v-Dngra7cjMi3KegyXOvSQ@mail.gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Fri, 11 Jan 2019 10:53:30 +0100
Message-ID: <CAFLxGvwy7cNdjEqFujHX5LY-42A3V-Moogxj3NNyguPQp_ijEg@mail.gmail.com>
Subject: Re: gluebi vs. ubi-volume mapping
To: Shibin George <george.shibin1993@gmail.com>
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

On Fri, Jan 11, 2019 at 7:36 AM Shibin George
<george.shibin1993@gmail.com> wrote:
>
> Hi,
>
> I am using the gluebi driver to emulate mtd block devices on top of
> which I use squashfs.
> I understand that calling ubiattach will result in a gluebi device
> getting created for each  volume on that ubi device. But is there any
> way to figure out which gluebi device was created for which particular
> ubi volume?
> /proc/mtd does show the mtd device with the name of the ubi volume but
> I have multiple volumes across different ubi devices with the same
> volume_name hence the dilemma.
>
> Is there already a way to figure out, for a given "ubi-device+volume",
> which gluebi device was created? Thanks in advance..

AFAIK we have currently no good way to find this relation.
Except the volume name. If the UBI volume has name "foo", the MTD device
will use the same.

BTW: Why are you using glubi+mtdblock at all? To support squashfs we
have ubiblock.
That way you can use read-only block-based filesystems directly on top
of UBI without glubi
and mtdblock.

-- 
Thanks,
//richard
