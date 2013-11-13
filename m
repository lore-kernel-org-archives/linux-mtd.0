Received: from mail-vb0-x233.google.com ([2607:f8b0:400c:c02::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VghL4-0004wX-5P
 for linux-mtd@lists.infradead.org; Wed, 13 Nov 2013 20:47:03 +0000
Received: by mail-vb0-f51.google.com with SMTP id w5so713359vbf.24
 for <linux-mtd@lists.infradead.org>; Wed, 13 Nov 2013 12:46:40 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAN8TOE_-O_gxM+c4k6NXvvo=7Ozp1J187=XtK9gxfLa4LGQAWQ@mail.gmail.com>
References: <1383818858-5410-1-git-send-email-b32955@freescale.com>
 <5281BBEE.7000502@freescale.com>
 <CAN8TOE_-O_gxM+c4k6NXvvo=7Ozp1J187=XtK9gxfLa4LGQAWQ@mail.gmail.com>
Date: Wed, 13 Nov 2013 12:46:40 -0800
Message-ID: <CAN8TOE8aew_Jhc7L4isgo5fZPSnP+nsuhdiFoYGPZZ3AsyY9kg@mail.gmail.com>
Subject: Re: [PATCH v3] mtd: gpmi: add a new DT property to use the
 datasheet's minimum required ECC
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Content-Type: text/plain; charset=ISO-2022-JP
Content-Transfer-Encoding: 7bit
Cc: Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>, Pawel Moll <pawel.moll@arm.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, t.figa@samsung.com,
 Stephen Warren <swarren@wwwdotorg.org>, Rob Herring <rob.herring@calxeda.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Nov 12, 2013 at 9:47 AM, Brian Norris
<computersforpeace@gmail.com> wrote:
> + DT maintainers, since they haven't responded
>
> On Mon, Nov 11, 2013 at 9:26 PM, Huang Shijie <b32955@freescale.com> wrote:
>> 于 2013年11月07日 18:07, Huang Shijie 写道:
>>
>>> In default way, we use the ecc_strength/ecc_step size calculated by
>>> ourselves
>>> and use all the OOB area.
>>>
>>> This patch adds a new property : "fsl,use-minimum-ecc"
>>>
>>> If we enable it, we will firstly try to use the datasheet's minimum
>>> required
>>> ECC provided by the MTD layer (the ecc_strength_ds/ecc_step_ds fields
>>> in the nand_chip{}). So we may have free space in the OOB area by using
>>> the
>>> minimum ECC, and we may support JFFS2 with some SLC NANDs, such as
>>> Micron's
>>> SLC NAND.
>>>
>>> If we fail to use the minimum ECC, we will use the legacy method to
>>> calculate
>>> the ecc_strength and ecc_step size.
>>>
>>> Signed-off-by: Huang Shijie<b32955@freescale.com>
>>> ---
>>> v1 -->  v2: rebase this patch on the latest l2-mtd.
>>> v2 -->  v3: change the descriptions.
>>> ---
>>>   .../devicetree/bindings/mtd/gpmi-nand.txt          |    8 ++++++++
>>>   drivers/mtd/nand/gpmi-nand/gpmi-nand.c             |    3 +++
>>>   2 files changed, 11 insertions(+), 0 deletions(-)
>>
>> Is this patch ok now? I hope it can be accepted at this merge-window.
>
> The patch is OK to me, but we haven't gotten any DT review. If we
> don't get any response in a few days, I'll take it anyway.

I pushed this to l2-mtd.git/next and will get it into linux-next after
the merge window closes. Let me know if there are further comments.

> I'm not sure about taking it in 3.13 vs. 3.14, as this is
> traditionally a late merge for 3.13.

Queued for 3.14.

Thanks,
Brian
