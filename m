Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TRPxW-00083a-Jy
 for linux-mtd@lists.infradead.org; Thu, 25 Oct 2012 16:07:03 +0000
Received: by mail-pb0-f49.google.com with SMTP id xa7so1959325pbc.36
 for <linux-mtd@lists.infradead.org>; Thu, 25 Oct 2012 09:07:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1350272844-21866-1-git-send-email-shijie8@gmail.com>
References: <1350272844-21866-1-git-send-email-shijie8@gmail.com>
Date: Thu, 25 Oct 2012 09:07:00 -0700
Message-ID: <CAN8TOE9BAHUFZf0pW7RvE4B0gbQgXNywQi9mvRgP_f3MKMmtuA@mail.gmail.com>
Subject: Re: [PATCH] mtd: use the NAND_STATUS_FAIL to replace the hardcode
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <shijie8@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

FWIW

On Sun, Oct 14, 2012 at 8:47 PM, Huang Shijie <shijie8@gmail.com> wrote:
> Use the NAND_STATUS_FAIL to replace the hardcode "0x01",
> which make the code more readable.
>
> Signed-off-by: Huang Shijie <shijie8@gmail.com>

Acked-by: Brian Norris <computersforpeace@gmail.com>
