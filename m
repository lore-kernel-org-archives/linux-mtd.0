Received: from mail-pl0-x22c.google.com ([2607:f8b0:400e:c01::22c])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eQZvE-0007IW-Bb
 for linux-mtd@lists.infradead.org; Sun, 17 Dec 2017 14:28:10 +0000
Received: by mail-pl0-x22c.google.com with SMTP id 62so1807967pld.7
 for <linux-mtd@lists.infradead.org>; Sun, 17 Dec 2017 06:27:52 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171217120503.GA3323@1wt.eu>
References: <20171217120503.GA3323@1wt.eu>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Sun, 17 Dec 2017 11:27:51 -0300
Message-ID: <CAAEAJfBUyhvi68A6QEJRywq9hxMBYuJ4m+O6ogBtV1nkeBR_og@mail.gmail.com>
Subject: Re: pxa3xx_nand times out in 4.14 with JFFS2
To: Willy Tarreau <w@1wt.eu>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 17 December 2017 at 09:05, Willy Tarreau <w@1wt.eu> wrote:
> Hello,
>
> I recently bought a Linksys WRT1900ACS which hosts an Armada 385 and a
> NAND flash. While I could get OpenWRT to work flawlessly on it using
> kernel 4.4, mainline 4.14.6 fails with a lot of such messages :
>
>     pxa3xx-nand f10d0000.flash: Wait time out!!!
>

Boris,

Any idea why this issue is on v4.14, but not observed on v4.4?

Also, is this somehow related to Armada 385 only?
--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
