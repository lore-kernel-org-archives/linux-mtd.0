Received: from mail-vc0-x229.google.com ([2607:f8b0:400c:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WaJj3-0004dD-Mn
 for linux-mtd@lists.infradead.org; Wed, 16 Apr 2014 06:53:42 +0000
Received: by mail-vc0-f169.google.com with SMTP id ik5so10724705vcb.28
 for <linux-mtd@lists.infradead.org>; Tue, 15 Apr 2014 23:53:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1395478518-22308-1-git-send-email-B48286@freescale.com>
References: <1395478518-22308-1-git-send-email-B48286@freescale.com>
Date: Tue, 15 Apr 2014 23:53:20 -0700
Message-ID: <CAN8TOE8JvG4Xmy20jEjg6rpEGk-4ATibrtr6NdDb2V1=F9XYGQ@mail.gmail.com>
Subject: Re: [v3] mtd: m25p80: Modify the name of mtd_info
From: Brian Norris <computersforpeace@gmail.com>
To: Hou Zhiqiang <B48286@freescale.com>
Content-Type: text/plain; charset=UTF-8
Cc: Scott Wood <scottwood@freescale.com>,
 "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>,
 "Mingkai.Hu@freescale.com" <mingkai.hu@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Mar 22, 2014 at 1:55 AM, Hou Zhiqiang <B48286@freescale.com> wrote:
> v3:
>         Fix a bug, matching unsigned long long with "%llx".
> v2:
>         1. Fix some code style issue.
>         2. Cast physical address to unsigned long long.

I missed v2 and v3 and commented on v1 instead, sorry. Same comments
apply here though.

Also, can you please include PATCH in the subject? (e.g., [PATCH v3])
See Documentation/SubmittingPatches, item 11.

Thanks,
Brian
