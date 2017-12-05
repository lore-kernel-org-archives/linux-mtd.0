MIME-Version: 1.0
In-Reply-To: <20171205125711.74158b3b@bbrezillon>
References: <1512463636-28934-1-git-send-email-yamada.masahiro@socionext.com>
 <1512463636-28934-3-git-send-email-yamada.masahiro@socionext.com>
 <CAK7LNATKBO=eNHdL_P2MOh7+uRcCjkq+v8+O3DXC5UF3-NGh2Q@mail.gmail.com>
 <20171205125711.74158b3b@bbrezillon>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 5 Dec 2017 21:28:55 +0900
Message-ID: <CAK7LNAQken7cQEPJEyL107pLbVJ9rPc+zZoPh4CA8D+CiKZz4g@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] mtd: nand: squash struct nand_buffers into struct
 nand_chip
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Kamal Dasu <kdasu.kdev@gmail.com>, Richard Weinberger <richard@nod.at>,
 Han Xu <han.xu@nxp.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Broadcom Kernel Feedback List <bcm-kernel-feedback-list@broadcom.com>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

2017-12-05 20:57 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
>>
>>
>> Sorry, I missed to update omap2.c
>>
>> I will send v3.
>
> No need to send a v3, I already fixed it when applying [1].
>
> [1]https://github.com/bbrezillon/linux-0day/commit/59a7bfff7103d48713b2125c3844400301a3d028
>

Thank you for your kind help!


-- 
Best Regards
Masahiro Yamada
