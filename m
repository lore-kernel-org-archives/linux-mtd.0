Received: from mail-vb0-x22d.google.com ([2607:f8b0:400c:c02::22d])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V94jS-0003al-AM
 for linux-mtd@lists.infradead.org; Tue, 13 Aug 2013 02:53:15 +0000
Received: by mail-vb0-f45.google.com with SMTP id e15so6302062vbg.32
 for <linux-mtd@lists.infradead.org>; Mon, 12 Aug 2013 19:52:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <52099B72.8080102@freescale.com>
References: <1376286173-12581-1-git-send-email-b32955@freescale.com>
 <1376286173-12581-3-git-send-email-b32955@freescale.com>
 <20130813005234.GE7267@brian-ubuntu>
 <52099B72.8080102@freescale.com>
Date: Mon, 12 Aug 2013 19:52:49 -0700
Message-ID: <CAN8TOE9pfiymDET0duYFcx4=Da-4L6q-vyoQp_sGzEGCVZZCUw@mail.gmail.com>
Subject: Re: [PATCH 02/10] mtd: add a helper to check the SLC/MLC nand chip
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 12, 2013 at 7:35 PM, Huang Shijie <b32955@freescale.com> wrote:
> =D3=DA 2013=C4=EA08=D4=C213=C8=D5 08:52, Brian Norris =D0=B4=B5=C0:
>>>
>>> -       if (denali->nand.cellinfo&  NAND_CI_CELLTYPE_MSK&&
>>> >  +    if (!nand_is_slc(&denali->nand)&&
>>
>> According to my recommendations in patch 1, this would only need to be:
>>
>>    if (denali->nand.bits_per_cell>  1&&  ...)
>>
>>
>> IMO, that is plenty readable, then we don't need the helper.
>
> The drivers may also check the SLC/MLC.
>
> IMO, using a helper is more readable :)

OK, the helper is still fine. I just thought that bits_per_cell has
direct meaning in itself (whereas "cellinfo & NAND_CI_CELLTYPE_MSK"
doesn't).

Brian
