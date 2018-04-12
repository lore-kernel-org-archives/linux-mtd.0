Received: from mail-am5eur03olkn080b.outbound.protection.outlook.com
 ([2a01:111:f400:fe08::80b]
 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f6Y19-0005RQ-RD
 for linux-mtd@lists.infradead.org; Thu, 12 Apr 2018 08:55:45 +0000
From: martin bayern <Martinbayern@outlook.com>
To: Richard Weinberger <richard.weinberger@gmail.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: power loss results in mounting failure on SLC NAND
Date: Thu, 12 Apr 2018 08:55:30 +0000
Message-ID: <CWLP265MB0721D354333D3492047D68DBD2BC0@CWLP265MB0721.GBRP265.PROD.OUTLOOK.COM>
References: <CWLP265MB0721344DBE1B7785E7D2C6A5D2DE0@CWLP265MB0721.GBRP265.PROD.OUTLOOK.COM>
 <22711116.lYnEpaWOtA@blindfold>
 <CAFLxGvzZNYiqQy2GnkyOfcZ+fnx1SVisVc=ntL90vk1gFf2YyA@mail.gmail.com>,
 <CAFLxGvxaYo9TfCMZPr4su6y7opQgeodK98r5rb5UU9O4H0Ff_Q@mail.gmail.com>,
 <CWLP265MB072103268B9C8C1834D61C8AD2A90@CWLP265MB0721.GBRP265.PROD.OUTLOOK.COM>
In-Reply-To: <CWLP265MB072103268B9C8C1834D61C8AD2A90@CWLP265MB0721.GBRP265.PROD.OUTLOOK.COM>
Content-Language: en-GB
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi, Richard=0A=
Seems it works, but I cannot much sure that.  I need more tests.=0A=
Normally, all corrupted blocks (because of power loss during erasing) will =
be re-erase during attach stage.=0A=
you know it is not easy to reproduce. the corrupted block should be behind =
first-64-PEB, also it results from=0A=
power loss during erasing. I only reproduced one-time during last two-week =
testing. Maybe because of re-flash=0A=
NAND. Anyway, as long as I have any new updates, I will touch you.=0A=
