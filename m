Received: from mail-oi0-x22c.google.com ([2607:f8b0:4003:c06::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZwX5j-0005uV-6a
 for linux-mtd@lists.infradead.org; Wed, 11 Nov 2015 15:13:43 +0000
Received: by oige206 with SMTP id e206so16921633oig.2
 for <linux-mtd@lists.infradead.org>; Wed, 11 Nov 2015 07:13:19 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20151111021549.GV12143@google.com>
References: <1444914533-27782-1-git-send-email-linus.walleij@linaro.org>
 <20151111021549.GV12143@google.com>
Date: Wed, 11 Nov 2015 16:13:19 +0100
Message-ID: <CACRpkdafrinB=EdjRT2coHbG9o==QGPHqe0YNOk99gnFRkP_bg@mail.gmail.com>
Subject: Re: [PATCH 00/10] ARM MTD AFS v2 partition support
From: Linus Walleij <linus.walleij@linaro.org>
To: Brian Norris <computersforpeace@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Nov 11, 2015 at 3:15 AM, Brian Norris
<computersforpeace@gmail.com> wrote:

> Also, do you have a pointer that documents the v2 format? I can probably
> find something myself, but I'm a bit lazy, and if you have something
> easy to point me to, that'd save me some time :)

There are no documents. The documentation is the source code for
the on-board boot monitor (first thing started by the ROM) that
comes with the board on a CD/DVD. A .h file documents the struct
that is simply written to flash as footer and image info. I don't
think I may post it, the structs in the kernel correspond to these
structs.

Yours,
Linus Walleij
