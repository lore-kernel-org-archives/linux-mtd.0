Received: from mail-ve0-f179.google.com ([209.85.128.179])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UCboy-0006lP-Fv
 for linux-mtd@lists.infradead.org; Mon, 04 Mar 2013 20:17:17 +0000
Received: by mail-ve0-f179.google.com with SMTP id da11so5182204veb.10
 for <linux-mtd@lists.infradead.org>; Mon, 04 Mar 2013 12:17:15 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1362395027-6513-1-git-send-email-dedekind1@gmail.com>
References: <1362395027-6513-1-git-send-email-dedekind1@gmail.com>
Date: Mon, 4 Mar 2013 12:17:15 -0800
Message-ID: <CAN8TOE_QuG+Ff-+HhsPPLDyRHp8+LeZ8SB9AuunnUUAzYXojWA@mail.gmail.com>
Subject: Re: [PATCH] NAND table: alternate row colors
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: MTD Maling List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Mar 4, 2013 at 3:03 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
>
> The truly great NAND table that we have is rather difficult to follow because
> it is big. Make this a bit easier by applying different background colors to
> different rows. Alternate the colors with period = 4.
>
> Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Thanks, I agree that it can be difficult to follow as-is. I primarily
deal with it using spreadsheet software, so I have helpful aids there
:)

Your color scheme can clash a bit with foreground blue/red text (for
"unsupported" chips), but hey, I'm not a web designer, and I think
this is an improvement.

Acked-by: Brian Norris <computersforpeace@gmail.com>
