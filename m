Received: from mail-wm0-x236.google.com ([2a00:1450:400c:c09::236])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dyMCp-0000Xb-D3
 for linux-mtd@lists.infradead.org; Sat, 30 Sep 2017 18:09:44 +0000
Received: by mail-wm0-x236.google.com with SMTP id k4so2029662wmc.1
 for <linux-mtd@lists.infradead.org>; Sat, 30 Sep 2017 11:09:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1506598982834.31024@nedap.com>
References: <1506598982834.31024@nedap.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sat, 30 Sep 2017 20:09:16 +0200
Message-ID: <CAFLxGvwoUoH6WDQsexM+H_gdfy3Wd75Oy2BdL8xbdC9TViPazA@mail.gmail.com>
Subject: Re: Shrink UBIFS
To: Ryan Meulenkamp <Ryan.Meulenkamp@nedap.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ryan,

On Thu, Sep 28, 2017 at 1:43 PM, Ryan Meulenkamp
<Ryan.Meulenkamp@nedap.com> wrote:
> Hi,
>
>
> I'm planning to write an ioctl for shrinking a UBIFS to be able to resize the volume its on and create another
>
> volume because it is essential for our upgrade/migration flow. Do you guys have any advice for me? The
>
> hard part is that LEB's that would fall outside the new size should be moved inside the new size. From what
>
> I read, the garbage collection code could be used to  accomplish this, but it is not really possible to define
>
> which LEB's to put where.
>
>
> Thanks in advance!

So, you want to implement _online_ shrinking?
This is a way more complicated, think of power-cuts.
I strongly suggest thinking about offline shrinking first.

You are right, the garbage collector might be useful, you could modify
it in a way
to move blocks away from to-be-removed LEBs.
But again, do you *really* need online shrinking?

-- 
Thanks,
//richard
