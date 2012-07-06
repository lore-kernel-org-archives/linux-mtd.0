Received: from mail-ob0-f177.google.com ([209.85.214.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SnBZ7-00081S-Gn
 for linux-mtd@lists.infradead.org; Fri, 06 Jul 2012 16:39:35 +0000
Received: by obbta17 with SMTP id ta17so15553056obb.36
 for <linux-mtd@lists.infradead.org>; Fri, 06 Jul 2012 09:39:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1341589908.26921.14.camel@shinybook.infradead.org>
References: <1336997687-6868-1-git-send-email-hechtb@gmail.com>
 <1336997687-6868-3-git-send-email-hechtb@gmail.com>
 <1341589908.26921.14.camel@shinybook.infradead.org>
Date: Fri, 6 Jul 2012 18:39:29 +0200
Message-ID: <CABYn4sxT0J_wWGpgN6EEdxorKyMHu-0=3OWrgHmXwSuq=KJZMw@mail.gmail.com>
Subject: Re: [PATCH v4 2/8] mtd: sh_flctl: Add support for error IRQ
From: Bastian Hecht <hechtb@googlemail.com>
To: David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Bastian Hecht <hechtb@gmail.com>, magnus.damm@gmail.com,
 linux-mtd@lists.infradead.org, laurent.pinchart@ideasonboard.com,
 linux-sh@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2012/7/6 David Woodhouse <dwmw2@infradead.org>:
> On Mon, 2012-05-14 at 14:14 +0200, Bastian Hecht wrote:
>> +       irq = platform_get_irq(pdev, 0);
>> +       if (irq < 0) {
>
> Is that correct? I know we have sometimes suffered from the insanity of
> assuming that irq 0 is *invalid*, and you're treating it as valid here.
> Did we recover from our insanity?

This is pure ignorance from me - I have no idea what is right. Might
be the lucky shot that is superior to woman's/man's craft.

> --
> dwmw2
