Received: from mail-vb0-x236.google.com ([2607:f8b0:400c:c02::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VHIAp-0005YC-40
 for linux-mtd@lists.infradead.org; Wed, 04 Sep 2013 18:51:27 +0000
Received: by mail-vb0-f54.google.com with SMTP id q14so449097vbe.13
 for <linux-mtd@lists.infradead.org>; Wed, 04 Sep 2013 11:51:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <521EE131.8070105@freescale.com>
References: <1377509808-29363-1-git-send-email-b32955@freescale.com>
 <1377509808-29363-7-git-send-email-b32955@freescale.com>
 <521D69B6.7070504@gmail.com> <521D9FCC.5010104@freescale.com>
 <521DA6B3.9080003@gmail.com> <20130829012403.GA4254@gmail.com>
 <521ED69F.5080203@gmail.com> <521EDD7F.2010103@freescale.com>
 <521EE131.8070105@freescale.com>
Date: Wed, 4 Sep 2013 11:51:01 -0700
Message-ID: <CAN8TOE9=D_WmFD4RBf1OihVHv_oacxWwTh2a4owSwYD5QNmfTA@mail.gmail.com>
Subject: Re: [PATCH v3 06/10] mtd: fix the wrong mtd->type for nand chip
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: quoted-printable
Cc: Huang Shijie <shijie8@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Aug 28, 2013 at 10:50 PM, Huang Shijie <b32955@freescale.com> wrote=
:
> =D3=DA 2013=C4=EA08=D4=C229=C8=D5 13:34, Huang Shijie =D0=B4=B5=C0:
>> =D3=DA 2013=C4=EA08=D4=C229=C8=D5 13:05, Brian Norris =D0=B4=B5=C0:
>>>
>>> This patch (patch 6) changes the mtd->type for MLC NAND. And mtd->type =
is
>>> exposed to user-space via ioctl(MEMGETINFO), and (as of this patch), it=
 is
>>> exposed as "unknown" in sysfs.
>>
>> thanks.
>>
>> this patch changes the mtd->type for the jffs2, and the jffs2 can uses t=
he
>> mtd->type to do the sanity check.

But the key point is that not only does this change mtd->type for
JFFS2, but it also exports this new mtd->type to user-space.

>> If without this patch, how the jffs2 can distinguish a SLC or a MLC?

You could precede this patch with one that prevents exporting
MTD_MLCNANDFLASH in mtd_type_show() and in ioctl(MEMGETINFO). I'm not
saying you *must* do this, but that this side effect must be
acknowledged and explained better, or else it seems that you don't
understand the ramifications of your proposed changes.

> hi Brian:
>
> I find a method to distinguish the SLC/MLC for jffs2, we can add the code
> for jffs2:
>   -------------------------------------------------------
>      if (mtd->flags =3D=3D MTD_CAP_NANDFLASH) {
>
>              struch nand_chip *chip =3D c->mtd->priv;
>              if (!nand_is_slc)
>                 return -EINVAL;
>      }
>
>
>   ------------------------------------------------------
>
> If you think this code is okay, we can abandon serveral patches.

No, we don't want to leak the mtd_info and nand_chip abstractions that
far. I think the MTD_MLCNANDFLASH type is the right way to do this for
the in-kernel MTD API, but it is a bigger step to automatically leak
that to user-space.

Brian
