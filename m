Received: from mail-lb0-x22a.google.com ([2a00:1450:4010:c04::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YJ2U2-0003mW-UW
 for linux-mtd@lists.infradead.org; Wed, 04 Feb 2015 16:07:19 +0000
Received: by mail-lb0-f170.google.com with SMTP id w7so2332976lbi.1
 for <linux-mtd@lists.infradead.org>; Wed, 04 Feb 2015 08:06:55 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAHgCKdX=KbWcZDuHK2pH_P5kfvstH6AYCO3Ox43TbcdbEGyGhw@mail.gmail.com>
References: <CAHgCKdX=KbWcZDuHK2pH_P5kfvstH6AYCO3Ox43TbcdbEGyGhw@mail.gmail.com>
Date: Wed, 4 Feb 2015 17:06:55 +0100
Message-ID: <CACna6ryGUQmkxYEa_T-5AVT15xQBwFi2qoy_yd1+LEXX0ZpG+w@mail.gmail.com>
Subject: Re: [PATCH] m25p80, spi-nor: add SFDP detect method
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Jim-Ting Kuo <jimtingkuo@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: Marek Vasut <marex@denx.de>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Paul Gortmaker <paul.gortmaker@windriver.com>,
 Ben Hutchings <ben@decadent.org.uk>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Huang Shijie <b32955@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 4 February 2015 at 16:50, Jim-Ting Kuo <jimtingkuo@gmail.com> wrote:
> The serial flash discoverable parameters (SFDP) is needed to
> spi nor devices for some specific features. I added some sfdp
> structure and detect method. And I hope the method will be
> useful in the future.
>
> The code have been tested on lower version Linux and can
> successfully work with Macronix chips. So I also modified the
> chip support list of Macronix.

Please resend without broken white spaces, so we can review/apply it.
