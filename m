Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d96DG-0003uV-0b
 for linux-mtd@lists.infradead.org; Fri, 12 May 2017 08:46:15 +0000
Subject: Re: [PATCH] mtd: nand: add option to erase NAND blocks even if
 detected as bad.
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <20170512053957.10426-1-mrugiero@gmail.com>
 <CAFLxGvyTvqY69AeoSrKWNjea-8u5YxKEBOznpUj9g==_UDnLew@mail.gmail.com>
 <CAKKQwLTGFY+bfFCoPNtvpFK-w-3SnNc_G2xDd_xip3iiwVDM4A@mail.gmail.com>
 <20170512102407.217b805a@bbrezillon>
 <ecb9a289-cac4-d7b1-1897-ed52553407e3@nod.at>
 <20170512104404.6416cc11@bbrezillon>
Cc: Mario Rugiero <mrugiero@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
From: Richard Weinberger <richard@nod.at>
Message-ID: <e2740ff4-d611-bb45-185c-ac7e58a11462@nod.at>
Date: Fri, 12 May 2017 10:45:51 +0200
MIME-Version: 1.0
In-Reply-To: <20170512104404.6416cc11@bbrezillon>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Boris,

Am 12.05.2017 um 10:44 schrieb Boris Brezillon:
>> Do this only if you *really* know what you are doing.
> 
> I'm clearly not encouraging people to use nand.scrub, it's just that
> sometime you don't have a choice, and this is the case here:
> Allwinner is putting non-FF data in the BBM region, and when we switch
> from an Allwinner kernel to a mainline kernel, the mainline kernel
> considers all programmed blocks as bad.

This is the "...only if you *really* know what you are doing" part. :-)

Thanks,
//richard
