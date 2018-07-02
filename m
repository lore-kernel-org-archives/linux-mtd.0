Received: from mail-yw0-x243.google.com ([2607:f8b0:4002:c05::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fa6ca-0004Jt-26
 for linux-mtd@lists.infradead.org; Mon, 02 Jul 2018 21:44:33 +0000
Received: by mail-yw0-x243.google.com with SMTP id 139-v6so1849969ywg.12
 for <linux-mtd@lists.infradead.org>; Mon, 02 Jul 2018 14:44:21 -0700 (PDT)
MIME-Version: 1.0
Sender: keescook@google.com
In-Reply-To: <5400614.4lJzJ1gdXR@blindfold>
References: <20180701212051.29486-1-richard@nod.at>
 <2073665.T6vW7v0NJO@blindfold>
 <CAGXu5jJabYkC06ZGa1X2HweY8idyDR8a2y805btY5jKMHKbSuA@mail.gmail.com>
 <5400614.4lJzJ1gdXR@blindfold>
From: Kees Cook <keescook@chromium.org>
Date: Mon, 2 Jul 2018 14:44:19 -0700
Message-ID: <CAGXu5j+YroAA935Pa+X+evxM2Nj_ocFRNkDegOYS_a9gceGrVw@mail.gmail.com>
Subject: Re: [PATCH 1/2] Revert "UBIFS: Fix potential integer overflow in
 allocation"
To: Richard Weinberger <richard@nod.at>
Cc: Linux mtd <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Silvio Cesare <silvio.cesare@gmail.com>, "# 3.4.x" <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jul 2, 2018 at 2:41 PM, Richard Weinberger <richard@nod.at> wrote:
> Am Montag, 2. Juli 2018, 20:27:00 CEST schrieb Kees Cook:
>> > Let's queue another patch for the next merge window which converts
>> > kmalloc() -> kmalloc_array().
>>
>> I'd prefer to leave it as-is for 4.18 because it would be the only
>> unconverted kmalloc()-with-multiplication in the entire tree. We did
>> treewide conversions and a revert would be undoing that here. (The
>> scripts that check for this case would run "clean" for 4.18.)
>>
>> So, this gets back to the question of the int vs u32: if you just
>> didn't revert this patch, then the kmalloc_array() would stand too.
>> Easy! :)
>
> I can queue the kmalloc_array() conversion on top of the revert.
> But TBH, using kmalloc_array() here is just ridiculous, we allocate
> dn->size times 2 where dn->size is at most 4k.

Right, I don't think this spot still suddenly become vulnerable again,
but it'll generate the same machine code (since one arg is a constant
value), and then static checkers never have to flag on it again. :)

Thanks!

-Kees

-- 
Kees Cook
Pixel Security
