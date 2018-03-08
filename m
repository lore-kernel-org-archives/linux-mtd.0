Received: from mail-io0-x231.google.com ([2607:f8b0:4001:c06::231])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1etvoT-00060Y-I4
 for linux-mtd@lists.infradead.org; Thu, 08 Mar 2018 13:42:32 +0000
Received: by mail-io0-x231.google.com with SMTP id d71so7091526iog.4
 for <linux-mtd@lists.infradead.org>; Thu, 08 Mar 2018 05:42:18 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20180303104554.5958-1-richard@nod.at>
References: <20180303104554.5958-1-richard@nod.at>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 8 Mar 2018 14:42:16 +0100
Message-ID: <CACRpkdYOqt4xTqGmbSwd_R84NRD8GA9TsHEk_hJ68hhxwbsL_Q@mail.gmail.com>
Subject: Re: [PATCH] ubi: Reject MLC NAND
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Mark Vasut <marek.vasut@gmail.com>,
 Boris BREZILLON <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>, tharvey@gateworks.com,
 stable <stable@vger.kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Mar 3, 2018 at 11:45 AM, Richard Weinberger <richard@nod.at> wrote:

> While UBI and UBIFS seem to work at first sight with MLC NAND, you will
> most likely lose all your data upon a power-cut or due to read/write
> disturb.
>
> In order to protect users from bad surprises, refuse to attach to MLC
> NAND.
>
> Cc: stable@vger.kernel.org
> Signed-off-by: Richard Weinberger <richard@nod.at>

I'm sorry to disturb in this interesting discussion about what
"stable" really means as in "stable kernel".  Stable for who and
in what sense, that seems to be the question.

But my main problem here is to understand who the consumers
of the MLC NAND devices really are.

I hear some talk here about lab boards. But where is this
really deployed, large-scale? And who are the people that
will have their devices potentially not booting after this patch?

I am pretty sure these people are board support or
customization consultants with work being done for some
certain products, and not hobbyists and even less end
consumers, right?

What kind of devices are MLC NANDs being deployed in?
Certainly not laptops, tablets and phones, they all use eMMC
and even start to venture into UFS (unified flash storage).

What is using these flashes? Routers and switches? NAS boxes?
Industrial control? Automotive?

Or are (God forbid, but would not surprise me) talking about a
Linux instance running inside of eMMCs or UFS devices?

Yours,
Linus Walleij
