Received: from mail-vb0-x234.google.com ([2607:f8b0:400c:c02::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V950P-0003mk-Mp
 for linux-mtd@lists.infradead.org; Tue, 13 Aug 2013 03:10:46 +0000
Received: by mail-vb0-f52.google.com with SMTP id f12so6312753vbg.11
 for <linux-mtd@lists.infradead.org>; Mon, 12 Aug 2013 20:10:24 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <520997F3.4010202@freescale.com>
References: <1376286173-12581-1-git-send-email-b32955@freescale.com>
 <1376286173-12581-9-git-send-email-b32955@freescale.com>
 <20130813010502.GF7267@brian-ubuntu>
 <520997F3.4010202@freescale.com>
Date: Mon, 12 Aug 2013 20:10:24 -0700
Message-ID: <CAN8TOE91kY+adwv_zVYikPx_sT1OyOPe+NH9Ddw4cznBMTaRiQ@mail.gmail.com>
Subject: Re: [PATCH 08/10] mtd: add MTD_MLCNANDFLASH case for mtd_type_show()
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: quoted-printable
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 12, 2013 at 7:20 PM, Huang Shijie <b32955@freescale.com> wrote:
> =D3=DA 2013=C4=EA08=D4=C213=C8=D5 09:05, Brian Norris =D0=B4=B5=C0:
>
>> The current convention uses lower-case, single-word names. And your
>> selection isn't very consistent with the SLC NAND case (but I see that
>> you're trying to change the SLC NAND case). I'd go with "mlc-nand" or
>> just "mlc".
>>
>> But more importantly, this is probably a break in ABI. At a minimum,
>> this needs documentation here in Documentation/ABI. I know tools which
>> currently check only for "nand", and if the name suddely becomes
>> different for MLC, that is a breakage.
>
> thanks for pointing this. If the tool may check the "nand", I prefer to d=
o
> not change the ABI.

OK. And I guess for a tool that wants to check the type for SLC vs.
MLC from userspace, they can still use ioctl(MEMGETINFO) which has
always documented the MTD_MLCNANDFLASH type (we just didn't use it
right).

>> But really, does user-space need to know SLC vs. MLC? If so, this needs
>
> I expose it to user-space only for mtd-info.
> But if these two patches will break current tools (not the mtd-info), i
> will abandon these two patches.

I think the "nand" to "SLC nand" patch should be dropped, but this
patch is a different story. Without this patch, MLC NAND will be
exported as "unknown". So you need a new patch which will combine the
'switch (mtd->type)' cases for MTD_NANDFLASH and MTD_MLCNANDFLASH.
Otherwise, your patch set leaves MLC exported as "unknown" (a
definite, undesirable breakage).

[Side note: onenand already uses MTD_MLCNANDLFASH, so this is already
exported as "unknkown" in the current upstream. I assume no one cares
about this entry for MLC onenand, if such a thing exists.]

>> a clear argument for why in the patch description. Perhaps to
>> differentiate whether or not JFFS2 support is even possible? I'm not
>> opposed to adding a new name, especially since the MTD_MLCNANDFLASH
>> macro has existed in mtd/mtd-abi.h for a long time (but it was rotten).
>> Just do it sensibly (i.e., better name string, proper ABI documentation
>> inlcuded in this patch, explain the reason for the ABI addition in this
>> patch, etc.).

Regards,
Brian
