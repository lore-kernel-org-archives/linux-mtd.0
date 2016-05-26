Received: from mail-wm0-x229.google.com ([2a00:1450:400c:c09::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b616g-0000IF-Gp
 for linux-mtd@lists.infradead.org; Thu, 26 May 2016 19:38:11 +0000
Received: by mail-wm0-x229.google.com with SMTP id a136so42005243wme.0
 for <linux-mtd@lists.infradead.org>; Thu, 26 May 2016 12:37:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <7F6493595BCD744E896E5FE2800ADF6472BAAB0C@LONURLNA21.e2k.ad.ge.com>
References: <7F6493595BCD744E896E5FE2800ADF6472BAAB0C@LONURLNA21.e2k.ad.ge.com>
From: Michal Suchanek <hramrach@gmail.com>
Date: Thu, 26 May 2016 21:37:09 +0200
Message-ID: <CAOMqctRZ7JVUnp8x=-WpEYvih-B6DjqH=z6W=SZneHUWNDLiPA@mail.gmail.com>
Subject: Re: m25p80 spi32766.0: unrecognized JEDEC id bytes: 00, 0, 0
To: "Barbier, Renaud (Abaco Systems, Non-GE)" <Renaud.Barbier@ge.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

On 26 May 2016 at 19:30, Barbier, Renaud (Abaco Systems, Non-GE)
<Renaud.Barbier@ge.com> wrote:
> Hello,
> I am running Broadcom 53346 with integratedARM cpu on  Linux 4.0.0 and get the message
> m25p80 spi32766.0: unrecognized JEDEC id bytes: 00,  0,  0

This means the flash responds with all zero to an identify request.
This typically means there is no flash connected, there is bad socket
contact (if socketed) or the chip is dead. It may be also caused by
problem with setting up reset/enable/cs/.. pins.

> followed by a crash
>
> when mounting the spi nor (m25p80 spi32766.0: n25q256a)
>
> What would be the cause of this read failure?

If you depend on the flash chip containing something useful the system
would obviously crash.

HTH

Michal
