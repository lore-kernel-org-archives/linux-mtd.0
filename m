Received: from mail-it0-x242.google.com ([2607:f8b0:4001:c0b::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eEHYQ-0000eH-1d
 for linux-mtd@lists.infradead.org; Mon, 13 Nov 2017 16:25:48 +0000
Received: by mail-it0-x242.google.com with SMTP id u132so10104299ita.0
 for <linux-mtd@lists.infradead.org>; Mon, 13 Nov 2017 08:25:25 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <60de6798-8ed1-5df7-3ff6-701727ac9b32@gmail.com>
References: <20171112063047.13797-1-prasannatsmkumar@gmail.com>
 <60de6798-8ed1-5df7-3ff6-701727ac9b32@gmail.com>
From: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
Date: Mon, 13 Nov 2017 21:55:24 +0530
Message-ID: <CANc+2y4uizhyEs7CPePeXTonwCECziLRzDvcWBfdtm8R0jpibQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: chips: Add PMC flash memory description
To: Marek Vasut <marek.vasut@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 cyrille.pitchen@wedev4u.fr, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Marek,

On 13 November 2017 at 19:53, Marek Vasut <marek.vasut@gmail.com> wrote:
> On 11/12/2017 07:30 AM, PrasannaKumar Muralidharan wrote:
>> Add PMC flash memory description.
>>
>> Signed-off-by: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
>> ---
>> This patch is taken from OpenWRT [1]. This is compile tested only. As
>> there is no signed off by or author info in the commit [1] I have kept
>> only my signed off by line. If this is incorrect please advice what I
>> should do.
>>
>> 1. https://git.lede-project.org/?p=source.git;a=blob;f=target/linux/adm5120/patches-3.18/102-jedec_pmc_39lvxxx_chips.patch;h=00148fa602b68c25ff8cd936924b77f6c99caa07;hb=c03d4317a6bc891cb4a5e89cbdd77f37c23aff86
>
> I'm not a big fan of adding untested stuff into the kernel.

It totally makes sense. I will see if I can find someone with the
board / openwrt to test. No guarantee that I will be able to find
someone to test. Please feel free to not consider this till someone
tests it.

Thanks,
PrasannaKumar
