Received: from mail-wi0-f171.google.com ([209.85.212.171])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zn1zM-0003TH-VG
 for linux-mtd@lists.infradead.org; Fri, 16 Oct 2015 10:11:53 +0000
Received: by wicll6 with SMTP id ll6so2869772wic.0
 for <linux-mtd@lists.infradead.org>; Fri, 16 Oct 2015 03:11:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20151015084727.GG14475@jhogan-linux.le.imgtec.org>
References: <1444148837-10770-1-git-send-email-harvey.hunt@imgtec.com>
 <1444148837-10770-4-git-send-email-harvey.hunt@imgtec.com>
 <20151015084727.GG14475@jhogan-linux.le.imgtec.org>
Date: Fri, 16 Oct 2015 11:11:29 +0100
Message-ID: <CAOFt0_D5mO-7_cnpvm_MwvsZNv1yCFynbeA3dSw=H5hVyQbgTA@mail.gmail.com>
Subject: Re: [PATCH v7,3/3] MIPS: dts: jz4780/ci20: Add NEMC, BCH and NAND
 device tree nodes
From: Alex Smith <alex@alex-smith.me.uk>
To: James Hogan <james.hogan@imgtec.com>
Cc: Harvey Hunt <harvey.hunt@imgtec.com>, linux-mtd@lists.infradead.org,
 Alex Smith <alex.smith@imgtec.com>,
 Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Paul Burton <paul.burton@imgtec.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips <linux-mips@linux-mips.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi James,

On 15 October 2015 at 09:47, James Hogan <james.hogan@imgtec.com> wrote:
>> diff --git a/arch/mips/boot/dts/ingenic/ci20.dts b/arch/mips/boot/dts/ingenic/ci20.dts
>> index 9fcb9e7..453f1d3 100644
>> --- a/arch/mips/boot/dts/ingenic/ci20.dts
>> +++ b/arch/mips/boot/dts/ingenic/ci20.dts
>> @@ -42,3 +42,57 @@
>>  &uart4 {
>>       status = "okay";
>>  };
>> +
>> +&nemc {
>> +     status = "okay";
>> +
>> +     nand: nand@1 {
>> +             compatible = "ingenic,jz4780-nand";
>
> Isn't the NAND a micron part? This doesn't seem right. Is the device
> driver and binding already accepted upstream with that compatible
> string?

This is the compatible string for the JZ4780 NAND driver, this patch
is part of the series adding that. Detection of the NAND part is
handled by the MTD subsystem.

Thanks,
Alex
