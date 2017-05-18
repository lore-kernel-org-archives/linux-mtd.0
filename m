Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dBMV8-00023l-Az
 for linux-mtd@lists.infradead.org; Thu, 18 May 2017 14:34:03 +0000
Received: by mail-oi0-x244.google.com with SMTP id h4so7682648oib.0
 for <linux-mtd@lists.infradead.org>; Thu, 18 May 2017 07:33:41 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170518133854.20744-1-david.engraf@sysgo.com>
References: <20170518133854.20744-1-david.engraf@sysgo.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Thu, 18 May 2017 16:33:40 +0200
Message-ID: <CAFLxGvyeA5tJ+pGfiav7t3-c7omvByT1+yEy62-f3bJUrxMeHw@mail.gmail.com>
Subject: Re: [PATCH] mkfs.ubifs: Add support for symlinks in device table
To: David Engraf <david.engraf@sysgo.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Oberhollenzer <goliath@sigma-star.at>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David,

On Thu, May 18, 2017 at 3:38 PM, David Engraf <david.engraf@sysgo.com> wrote:
> It is not possible to change permissions and ownership for symlinks in the
> device table file. This patch adds support for symlinks equal to mkfs.jffs2
> and updates the sample device table file.

I'm confused, permissions of a symlink are irrelevant.
What is the usecase?

-- 
Thanks,
//richard
