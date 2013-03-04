Received: from mail-ve0-f182.google.com ([209.85.128.182])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UCNtp-0003bk-5j
 for linux-mtd@lists.infradead.org; Mon, 04 Mar 2013 05:25:21 +0000
Received: by mail-ve0-f182.google.com with SMTP id ox1so4387452veb.13
 for <linux-mtd@lists.infradead.org>; Sun, 03 Mar 2013 21:23:10 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1362038541-22406-2-git-send-email-shc_work@mail.ru>
References: <1362038541-22406-1-git-send-email-shc_work@mail.ru>
 <1362038541-22406-2-git-send-email-shc_work@mail.ru>
Date: Sun, 3 Mar 2013 21:23:08 -0800
Message-ID: <CAN8TOE8LZKj0KSZHpWhbfh6-2LtPaQfuZvrL+QSFtWs9iNVtuQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] mtd: nand_base: Removed unnecessary cleaning
 "onfi_version" variable
From: Brian Norris <computersforpeace@gmail.com>
To: Alexander Shiyan <shc_work@mail.ru>
Content-Type: text/plain; charset=ISO-8859-1
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Feb 28, 2013 at 12:02 AM, Alexander Shiyan <shc_work@mail.ru> wrote:
> Variable "onfi_version" is already set to zero before nand_flash_detect_onfi()
> call, so additional cleaning is not necessary.
>
> Signed-off-by: Alexander Shiyan <shc_work@mail.ru>

Acked-by: Brian Norris <computersforpeace@gmail.com>
