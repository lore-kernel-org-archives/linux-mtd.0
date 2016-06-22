Received: from mail-oi0-x22e.google.com ([2607:f8b0:4003:c06::22e])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bFj7C-0006k5-3X
 for linux-mtd@lists.infradead.org; Wed, 22 Jun 2016 14:26:50 +0000
Received: by mail-oi0-x22e.google.com with SMTP id f189so24315335oig.3
 for <linux-mtd@lists.infradead.org>; Wed, 22 Jun 2016 07:26:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <tencent_7F3FDDEB204356DB76EC1298@qq.com>
References: <tencent_7F3FDDEB204356DB76EC1298@qq.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Wed, 22 Jun 2016 16:26:28 +0200
Message-ID: <CAFLxGvyDNusLoxBA4iehy6YtWmbFtm_H2muBpS-mO-7-y8W4_A@mail.gmail.com>
Subject: Re: ubifs:questions about this filesystem
To: =?UTF-8?B?6L6J5bCR?= <wang502742203@qq.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

On Wed, Jun 22, 2016 at 4:13 PM, =E8=BE=89=E5=B0=91 <wang502742203@qq.com> =
wrote:
> Hi,MTD lists
> I've got two questions about ubifs listed below,
> 1. If I write a file to the filesystem, dose it go to a new block or the =
same block last written file goes?

UBIFS tries to fill up LEBs as much as possible. Allocating a new LEB
for every new file would be deadly.

> 2. What's the priority of GC thread? If GC thread is working background, =
what effect will it bring to other working threads in my embedded system? C=
an other threads be blocked?

Strictly speaking there is only a background thread to do many things.
GC can happen in many contexts.
The background thread is kthread with default priority.

--=20
Thanks,
//richard
