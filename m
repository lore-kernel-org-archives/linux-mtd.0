Received: from mail-ve0-x233.google.com ([2607:f8b0:400c:c01::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VePXf-0006wK-4c
 for linux-mtd@lists.infradead.org; Thu, 07 Nov 2013 13:22:36 +0000
Received: by mail-ve0-f179.google.com with SMTP id cz12so375859veb.10
 for <linux-mtd@lists.infradead.org>; Thu, 07 Nov 2013 05:22:12 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1383817597-31992-2-git-send-email-b32955@freescale.com>
References: <1383817597-31992-1-git-send-email-b32955@freescale.com>
 <1383817597-31992-2-git-send-email-b32955@freescale.com>
Date: Thu, 7 Nov 2013 11:22:12 -0200
Message-ID: <CAOMZO5AohNc7Z41AApMHugsApQxS3J+1jUZyFrjjAJ8PXuB_aQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd: gpmi: only scan two chips for imx6
From: Fabio Estevam <festevam@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Content-Type: text/plain; charset=UTF-8
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 7, 2013 at 7:46 AM, Huang Shijie <b32955@freescale.com> wrote:
> We cannot scan two chips for imx23 and imx28:
>   imx23: the Ready-Busy1 line is not connected for some board.
>   imx28: we do not set the pinctrl for Ready-Busy1
>
> So we only scan two chips for imx6.

What happens if Ready-Busy1 line is not connected on some mx6 board?
You cannot assume that all boards
have this line connected and configured in pinctrl just like you
mentioned for mx23 and mx28.

Regards,

Fabio Estevam
