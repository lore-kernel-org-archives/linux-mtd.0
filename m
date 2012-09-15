Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TCinM-0006vg-EW
 for linux-mtd@lists.infradead.org; Sat, 15 Sep 2012 03:11:50 +0000
Received: by lagu2 with SMTP id u2so3071826lag.36
 for <linux-mtd@lists.infradead.org>; Fri, 14 Sep 2012 20:11:41 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1347371454-17107-1-git-send-email-richard.genoud@gmail.com>
References: <1347371454-17107-1-git-send-email-richard.genoud@gmail.com>
Date: Fri, 14 Sep 2012 20:11:41 -0700
Message-ID: <CAN8TOE_adrO32vo5c8P6fadhRqchFday302fo9F=kr4njfsaoA@mail.gmail.com>
Subject: Re: [PATCH] NAND BBT: use NAND_BBT_SCAN_MAXBLOCKS
From: Brian Norris <computersforpeace@gmail.com>
To: Richard Genoud <richard.genoud@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Tue, Sep 11, 2012 at 6:50 AM, Richard Genoud
<richard.genoud@gmail.com> wrote:
> In nand_bbt.c, a hardcoded value was used instead of the define meant
> for that, so we use the define.
>
> There's no functionnal change.

s/functionnal/functional

> Signed-off-by: Richard Genoud <richard.genoud@gmail.com>

> -       .maxblocks = 4,
> +       .maxblocks = NAND_BBT_SCAN_MAXBLOCKS,

On a more important note: why was this define ever included in the
first place? It seems to have been included without a real user in
this commit:

Author: Kyungmin Park <kyungmin.park@samsung.com>
Date:   Tue Sep 27 11:26:39 2005 +0100

    [MTD] OneNAND: Add missing files

In the end, the real question is: does the macro have real value? I
suppose it makes it slightly easier to change the parameter across all
the version of the BBT (main/mirror and oob/no_oob). So I'll ack:

Acked-by: Brian Norris <computersforpeace@gmail.com>

Thanks,
Brian
