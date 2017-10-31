Received: from mail-io0-x234.google.com ([2607:f8b0:4001:c06::234])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e9ZHa-0001D6-Cz
 for linux-mtd@lists.infradead.org; Tue, 31 Oct 2017 16:20:56 +0000
Received: by mail-io0-x234.google.com with SMTP id e89so36308160ioi.11
 for <linux-mtd@lists.infradead.org>; Tue, 31 Oct 2017 09:20:33 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CANc+2y5QWNSRf_-oOuU8TYbyVHYrbPqK8+gO=Y56-MMaJp+nZQ@mail.gmail.com>
References: <20171028074351.13118-1-prasannatsmkumar@gmail.com>
 <20171030093426.30827ef5@bbrezillon>
 <CANc+2y4U+BbOnWZzEZ4+2dNfJNEA0Was+ySuJRJwyakm-GxYiA@mail.gmail.com>
 <20171030140351.16cb4461@bbrezillon>
 <CANc+2y5QWNSRf_-oOuU8TYbyVHYrbPqK8+gO=Y56-MMaJp+nZQ@mail.gmail.com>
From: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
Date: Tue, 31 Oct 2017 21:50:32 +0530
Message-ID: <CANc+2y4aLytChOjkMXBu92O+pfiZPP3AwXgu4XF1EkBsULv+2A@mail.gmail.com>
Subject: Re: [RFC] NAND: Optimize NAND_ECC_HW_OOB_FIRST read
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marek.vasut@gmail.com>,
 cyrille.pitchen@wedev4u.fr, linux-mtd@lists.infradead.org,
 open list <linux-kernel@vger.kernel.org>, Lars-Peter Clausen <lars@metafoo.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

On 30 October 2017 at 19:04, PrasannaKumar Muralidharan
<prasannatsmkumar@gmail.com> wrote:
> Hi Boris,
>
> On 30 October 2017 at 18:33, Boris Brezillon
> <boris.brezillon@free-electrons.com> wrote:
>>
>> Yep, it makes sense to have that one applied too, but this is pretty
>> much the same problem: it will conflict with the ->exec_op() rework.
>
> True. I did realise that.
>
>> Can you please send it to the ML so I can track it in patchwork and
>
> Sure.

I could not get that patch compiled yet. I will revisit it next week
and send the patch.

Regards,
PrasannaKumar
