Received: from mail-vc0-f169.google.com ([209.85.220.169])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1USx1X-0000mV-J7
 for linux-mtd@lists.infradead.org; Thu, 18 Apr 2013 22:09:48 +0000
Received: by mail-vc0-f169.google.com with SMTP id hx10so3243928vcb.0
 for <linux-mtd@lists.infradead.org>; Thu, 18 Apr 2013 15:09:45 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1366303846-20384-1-git-send-email-shc_work@mail.ru>
References: <1366303846-20384-1-git-send-email-shc_work@mail.ru>
Date: Thu, 18 Apr 2013 15:09:45 -0700
Message-ID: <CAN8TOE-9Gd4OJwr0t9WRrUjSvRMJpfz=OG37huh0BGj7h5Tovw@mail.gmail.com>
Subject: Re: [PATCH RESEND v2] mtd: nand_base: Use io{read,write}*_rep
 functions for transfer
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

On Thu, Apr 18, 2013 at 9:50 AM, Alexander Shiyan <shc_work@mail.ru> wrote:
> This patch replaces the usage of loops in the nand_base code with
> io{read,write}{8,16}_rep calls instead.
>
> Signed-off-by: Alexander Shiyan <shc_work@mail.ru>

Looks good. Thanks.

Acked-by: Brian Norris <computersforpeace@gmail.com>
