Received: from mail-pa0-x232.google.com ([2607:f8b0:400e:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a3YVv-000413-92
 for linux-mtd@lists.infradead.org; Tue, 01 Dec 2015 00:09:47 +0000
Received: by pacdm15 with SMTP id dm15so200806733pac.3
 for <linux-mtd@lists.infradead.org>; Mon, 30 Nov 2015 16:09:26 -0800 (PST)
Date: Mon, 30 Nov 2015 16:09:23 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Nikolay Martynov <mar.kolya@gmail.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH] mtd: nand: Fix Spansion sparearea size detection
Message-ID: <20151201000923.GQ64635@google.com>
References: <1448519122-6259-1-git-send-email-mar.kolya@gmail.com>
 <20151130203518.GL64635@google.com>
 <CALGY4fv1rbzng+aUbevJQRwj5X0R3NmzZ0iXz5ZNXxya0Rx6zw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALGY4fv1rbzng+aUbevJQRwj5X0R3NmzZ0iXz5ZNXxya0Rx6zw@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Nikolay,

On Mon, Nov 30, 2015 at 06:59:32PM -0500, Nikolay Martynov wrote:
>   I'm sorry, I only have board with S34ML02G2 and I've tested by
> change on it - it works fine. But unfortunately I do not have any way
> to test S34ML01G2.
>   It looks like that logic can be simplified if just check id_data[1]
> is one of 0xda, 0xdc, 0xca, 0xcc - this should be safer option.

Possibly safer, but it's uglier, and I'd like not to have to make this
change at all, if ONFI can help it.

>   I'm sorry, I'm very new to all this. This patch made kernel boot on
> a board that I have. The kernel was 'oldish' - 3.18. So I'm not sure
> why ONFI is not used here, I will see if I can figure it out.

What NAND driver are you using? It's possible that it doesn't support
the PARAMETER READ command properly. If so, it'd be better to fix that
than to clutter the NAND core.

Regards,
Brian
