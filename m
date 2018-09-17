Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g1v5s-0001fx-Kl
 for linux-mtd@lists.infradead.org; Mon, 17 Sep 2018 15:05:50 +0000
Date: Mon, 17 Sep 2018 17:05:22 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: naga suresh kumar <nagasureshkumarrelli@gmail.com>
Cc: nagasure@xilinx.com, cyrille.pitchen@wedev4u.fr, marek.vasut@gmail.com,
 dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, linux-mtd@lists.infradead.org
Subject: Re: [RFC PATCH 0/5] RFC for Zynq QSPI
Message-ID: <20180917170522.0312ae8c@bbrezillon>
In-Reply-To: <CALgLF9K=rZxVx_QXvV_LH3OhidTcguZ=K=p=Lf9AfFbk4H+8Zw@mail.gmail.com>
References: <1521807722-21626-1-git-send-email-nagasure@xilinx.com>
 <BY2PR02MB14115B9E46B35A59AC6505D9AFB00@BY2PR02MB1411.namprd02.prod.outlook.com>
 <CALgLF9K=rZxVx_QXvV_LH3OhidTcguZ=K=p=Lf9AfFbk4H+8Zw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Naga,

On Mon, 17 Sep 2018 16:08:26 +0530
naga suresh kumar <nagasureshkumarrelli@gmail.com> wrote:

> Hi all,
> 
> Can i write the Zynq QSPI driver under the new spi/mem framework?

Yes, you should.

> As i said, it needs tweaking the mtd->size and spi read/write addresses.

Can you elaborate a bit on why you think this is needed? Did you look
at [1]? Maybe it will prevent us from exposing the flash size at the
spi-mem level.

> Can somebody share your thoughts on this(Adding Zynq QSPI Dual parallel and
> stacked)?

I always have a hard time with this naming. I guess stacked is when you
have 2 chips sharing the same I/O bus, and parallel is when you have 2
chips with one taking all of the I/O and the other taking the other
half. Is that correct?

If it is, then stacked mode should be easy to support (it's just a
matter of patching the spi layer to allow passing several CS lines to a
single device (in case of DT parsing, it means reg = <0 1> implies CS 0
and 1 are assigned to the same device. For the parallel, I don't have a
solution yet.

Anyway, I'd suggest that you start with something simple (a spi-mem
driver supporting ->exec_op() in Single/Dual/Quad mode), and build on
top of that for the advanced features you're mentioning here.

Regards,

Boris

[1]http://lists.infradead.org/pipermail/linux-mtd/2018-June/081460.html
