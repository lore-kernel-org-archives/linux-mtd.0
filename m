Received: from mail-vc0-x231.google.com ([2607:f8b0:400c:c03::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WWC9z-0000Ax-7t
 for linux-mtd@lists.infradead.org; Fri, 04 Apr 2014 22:00:28 +0000
Received: by mail-vc0-f177.google.com with SMTP id if17so3607139vcb.36
 for <linux-mtd@lists.infradead.org>; Fri, 04 Apr 2014 15:00:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <533B8FE1.7050408@list.ru>
References: <533A8749.4050802@list.ru>
 <20140401182350.GS2775@book.gsilab.sittig.org>
 <533B8FE1.7050408@list.ru>
Date: Sat, 5 Apr 2014 00:00:00 +0200
Message-ID: <CAFLxGvz_KQBq5zqm1zyQVgM5asW93vgQ9+CjRtDHfsSHv8ST7A@mail.gmail.com>
Subject: Re: nandwrite and contiguous space
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Stas Sergeev <stsp@list.ru>
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: quoted-printable
Cc: Gerhard Sittig <gsi@denx.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Apr 2, 2014 at 6:19 AM, Stas Sergeev <stsp@list.ru> wrote:
> 01.04.2014 22:23, Gerhard Sittig =D0=C9=DB=C5=D4:
>>
>> If you want a sequence of good blocks, this very much sounds like
>>
>> the LEBs which UBI provides.  Aren't you asking for an UBI
>> volume?  What am I missing?
>
> Is is possible to configure ubi leb size to be multiple
> physically contiguous eraseblocks? With some googling
> it seems not, or what am I missing?

No, this is not possible.

--=20
Thanks,
//richard
