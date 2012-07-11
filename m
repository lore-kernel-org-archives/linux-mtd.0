Received: from mail-yw0-f44.google.com ([209.85.213.44])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Solxu-0001eO-Td
 for linux-mtd@lists.infradead.org; Wed, 11 Jul 2012 01:43:45 +0000
Received: by yhq56 with SMTP id 56so813366yhq.17
 for <linux-mtd@lists.infradead.org>; Tue, 10 Jul 2012 18:43:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1341305055-29218-1-git-send-email-b32955@freescale.com>
References: <1341305055-29218-1-git-send-email-b32955@freescale.com>
Date: Tue, 10 Jul 2012 18:43:18 -0700
Message-ID: <CAN8TOE9jUrfV15ddbKyWEafAObRqvFVqJ7UJvGGOkP0pug4AfQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd: replace the hard code with the proper macro
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jul 3, 2012 at 1:44 AM, Huang Shijie <b32955@freescale.com> wrote:
> Use the MTD_OPS_PLACE_OOB to replace the hard code "0".
> Make the code more readable.

I think I intentionally used 0 instead of an explicit mode, since the
mode was mostly for when oobbuf != NULL; i.e., MTD_OPS_PLACE_OOB vs.
MTD_OPS_AUTO_OOB was a don't care in this case. But now that you
mention it, this is probably more readable.

> Signed-off-by: Huang Shijie <b32955@freescale.com>

Acked-by: Brian Norris <computersforpeace@gmail.com>
