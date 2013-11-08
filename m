Received: from mail-vb0-x22e.google.com ([2607:f8b0:400c:c02::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VetBv-0005Jt-4x
 for linux-mtd@lists.infradead.org; Fri, 08 Nov 2013 21:02:07 +0000
Received: by mail-vb0-f46.google.com with SMTP id 10so1745576vbe.33
 for <linux-mtd@lists.infradead.org>; Fri, 08 Nov 2013 13:01:45 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20131108175119.GA20061@ld-irv-0074.broadcom.com>
References: <1383817597-31992-1-git-send-email-b32955@freescale.com>
 <20131108175119.GA20061@ld-irv-0074.broadcom.com>
Date: Fri, 8 Nov 2013 19:01:44 -0200
Message-ID: <CAOMZO5COzPn6ZHgkoPP8T5fJ=-1=jNV+WOkb8OcpMdHJkG9VQA@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd: gpmi: fix the NULL pointer
From: Fabio Estevam <festevam@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: Huang Shijie <b32955@freescale.com>, David Woodhouse <dwmw2@infradead.org>,
 stable@vger.kernel.org,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Nov 8, 2013 at 3:51 PM, Brian Norris
<computersforpeace@gmail.com> wrote:

> I agree with Fabio; we don't actually need the +1. (Of course, saving 1
> byte is not that much of a problem. But making the code more
> straightforward is.) If you "ack" I'll just drop the +1 myself.

You can also add my:

Tested-by: Fabio Estevam <fabio.estevam@freescale.com>

Thanks,

Fabio Estevam
