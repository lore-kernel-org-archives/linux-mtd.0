Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gacUN-0001Tr-Hj
 for linux-mtd@lists.infradead.org; Sat, 22 Dec 2018 08:18:29 +0000
Received: by mail-wr1-x434.google.com with SMTP id p4so7391348wrt.7
 for <linux-mtd@lists.infradead.org>; Sat, 22 Dec 2018 00:18:14 -0800 (PST)
MIME-Version: 1.0
References: <E1gaMcy-000082-OR@filer.kenjo.org>
In-Reply-To: <E1gaMcy-000082-OR@filer.kenjo.org>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sat, 22 Dec 2018 09:18:01 +0100
Message-ID: <CAFLxGvx-uzrgnktn4hYU0S9Hkay7KYR+LMOuipEr350i34HX5g@mail.gmail.com>
Subject: Re:
To: kenneth johansson <kenjo@kenjo.org>
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Dec 21, 2018 at 4:24 PM kenneth johansson <kenjo@kenjo.org> wrote:
>
> From 9815710fa078241c683de1b49d9a0c9631502e17 Mon Sep 17 00:00:00 2001
> From: Kenneth Johansson <kenjo@kenjo.org>
> Date: Fri, 21 Dec 2018 15:46:24 +0100
> Subject: [PATCH] mtd: rawnand: nandsim: Add support to disable subpage writes.
> X-IMAPbase: 1545405463 2
> Status: O
> X-UID: 1
>
> This is needed if you try to use an already existing ubifs image that
> is created for hardware that do not support subpage write.
>
> It is not enough that you can select what nandchip to emulate as the
> subpage support might not exist in the actual nand driver.

Is this really needed? Usually using ubiattach's -O parameter does the trick.

-- 
Thanks,
//richard
