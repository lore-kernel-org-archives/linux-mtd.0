Received: from mail-wm0-x231.google.com ([2a00:1450:400c:c09::231])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bfi0d-0003L1-Lk
 for linux-mtd@lists.infradead.org; Fri, 02 Sep 2016 06:31:28 +0000
Received: by mail-wm0-x231.google.com with SMTP id v143so14852071wmv.0
 for <linux-mtd@lists.infradead.org>; Thu, 01 Sep 2016 23:31:07 -0700 (PDT)
Content-Type: text/plain; charset=windows-1252
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: Micron qspi nor flash and UBIFS
From: Andras Szemzo <szemzo.andras@gmail.com>
In-Reply-To: <3806eb18-1939-567d-6006-ae02ecbf14a4@nod.at>
Date: Fri, 2 Sep 2016 08:31:04 +0200
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Message-Id: <46A42314-D21B-41DF-B087-998D4485E4DB@gmail.com>
References: <EB1698FB-FF63-4FC1-A706-A81DB9E655DD@gmail.com>
 <CAFLxGvzmRPaNFqzYubCo2_mB9W4inja_J9YM7rUay_9TpJBmCA@mail.gmail.com>
 <CB87F86A-3E14-4091-B669-6C325085F397@gmail.com>
 <3806eb18-1939-567d-6006-ae02ecbf14a4@nod.at>
To: Richard Weinberger <richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard,

> This proves my assumption.
> spi-nor.c warns as soon you write with an offset to a page.
> So, it will warn for *every* non-trivial user.

Thanks for your very quick help!

Andras
