Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z2p3l-0006b8-N7
 for linux-mtd@lists.infradead.org; Wed, 10 Jun 2015 23:05:27 +0000
Message-ID: <5578C299.2010200@nod.at>
Date: Thu, 11 Jun 2015 01:04:57 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: cyl <cyl665236@126.com>
Subject: Re: ubifs problem
References: <2b88f8ae.15caa.14ddab0368e.Coremail.cyl665236@126.com>
 <557791DF.9040501@huawei.com>
 <CAFLxGvz4QX=C34eWYF-dV+7TzkKLe0ckETyCNiwPLky1UKQqOg@mail.gmail.com>
 <4849a0b5.1368.14ddfb33013.Coremail.cyl665236@126.com>
In-Reply-To: <4849a0b5.1368.14ddfb33013.Coremail.cyl665236@126.com>
Content-Type: text/plain; charset=gbk
Content-Transfer-Encoding: 7bit
Cc: mtd mailing list <linux-mtd@lists.infradead.org>,
 Sheng Yong <shengyong1@huawei.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 11.06.2015 um 00:59 schrieb cyl:
> The default flash of the development board is a 128M "SLC" nand which is mx30lf4g28ab , I want a bigger one so I changed it to K9G8G08U0M which is a "MLC" flash. Does UBIFS support
> MLC nandflash not good as supporting SLC nandflash? Will it be better if I use a SLC nand? 

UBIFS was designed with SLC NAND in mind. If you use MLC you really have to know what you're doing.

Thanks,
//richard
