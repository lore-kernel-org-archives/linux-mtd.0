Received: from mail-yb0-x244.google.com ([2607:f8b0:4002:c09::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fb6cE-0001TK-35
 for linux-mtd@lists.infradead.org; Thu, 05 Jul 2018 15:56:19 +0000
Received: by mail-yb0-x244.google.com with SMTP id y11-v6so3393578ybm.7
 for <linux-mtd@lists.infradead.org>; Thu, 05 Jul 2018 08:56:05 -0700 (PDT)
MIME-Version: 1.0
Sender: keescook@google.com
In-Reply-To: <20180705090312.1ca9ed5a@xps13>
References: <20180704172759.GA33591@beast> <20180705090312.1ca9ed5a@xps13>
From: Kees Cook <keescook@chromium.org>
Date: Thu, 5 Jul 2018 08:56:03 -0700
Message-ID: <CAGXu5j+U67bo0fKf=75yi+X48bqydoq6CeYTJh5_o=rZpgUXZQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: spinand: Use 2-factor allocator calls
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 Peter Pan <peterpandong@micron.com>,
 Linux mtd <linux-mtd@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jul 5, 2018 at 12:03 AM, Miquel Raynal
<miquel.raynal@bootlin.com> wrote:
> Hello,
>
> Kees Cook <keescook@chromium.org> wrote on Wed, 4 Jul 2018 10:27:59
> -0700:
>
>> As already done treewide, switch from open-coded multiplication to using
>> 2-factor allocator helpers.
>>
>> Signed-off-by: Kees Cook <keescook@chromium.org>
>> ---
>
> Indeed, we'll be more careful about this in the future.
>
> As this code has not been merged upstream yet, do you mind if I
> squash this with the initial patch?

Totally fine by me! Thanks! :)

-Kees


-- 
Kees Cook
Pixel Security
