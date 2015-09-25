Received: from mail-vk0-x22a.google.com ([2607:f8b0:400c:c05::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZfXTb-0001GK-4F
 for linux-mtd@lists.infradead.org; Fri, 25 Sep 2015 18:12:07 +0000
Received: by vkfp126 with SMTP id p126so61016428vkf.3
 for <linux-mtd@lists.infradead.org>; Fri, 25 Sep 2015 11:11:45 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <56058D7B.3050005@nod.at>
References: <loom.20150918T183854-37@post.gmane.org>
 <CAFLxGvwJjy=6GLXJm=2frruO9vKqqPG_6yYxSH7HLLr47x9apg@mail.gmail.com>
 <CA+-FG628WkbiqnzT9tp4Li=SP2qHPM+Nn+KLHjQWqHN-f==+vg@mail.gmail.com>
 <55FC6BCB.1030901@nod.at>
 <CA+-FG62MN2FBLKecGJJ6YHqPDyrgrx8BkCAZGezoKbADOCm_0g@mail.gmail.com>
 <55FC6F56.4050107@nod.at>
 <CA+-FG62nCCaK_GEGSqBJ4ROvqgVPZdsh7pyEsnq2C0AXZrnkjw@mail.gmail.com>
 <55FC8712.5040905@nod.at>
 <CA+EcR23BLTvQgD36bAAiT3yULYSpE0zMiXpRm0kDGQeLOTho8w@mail.gmail.com>
 <56058D7B.3050005@nod.at>
Date: Fri, 25 Sep 2015 13:11:45 -0500
Message-ID: <CA+EcR22DEGWr8v-iMDQBf=NNL3+6SsOBDX6mX5y_O9en4FaPyQ@mail.gmail.com>
Subject: Re: UBIFS corruptions on NOR-Flash
From: Han Xu <xhnjupt@gmail.com>
To: Richard Weinberger <richard@nod.at>
Cc: Roshni Shah <roshni.shah@timesys.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "han.xu@freescale.com" <han.xu@freescale.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I thought it related to CMA but seems not. Have you ever run any data
integrity test?

On Fri, Sep 25, 2015 at 1:07 PM, Richard Weinberger <richard@nod.at> wrote:
> Am 23.09.2015 um 20:21 schrieb Han Xu:
>> Have you enabled the CONFIG_CMA in kernel setting?
>
> CMA or DMA? :)
>
> Thanks,
> //richard
