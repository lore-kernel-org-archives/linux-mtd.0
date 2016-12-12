Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cGU2D-0001Xz-W5
 for linux-mtd@lists.infradead.org; Mon, 12 Dec 2016 17:05:06 +0000
Date: Mon, 12 Dec 2016 18:04:44 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: arvind Yadav <arvind.yadav.cs@gmail.com>
Cc: robert.jarzmik@free.fr, dwmw2@infradead.org,
 computersforpeace@gmail.com, marek.vasut@gmail.com, richard@nod.at,
 cyrille.pitchen@atmel.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [V2] mtd: devices: docg3:- Handle return value of devm_ioremap.
Message-ID: <20161212180444.22a1f4ff@bbrezillon>
In-Reply-To: <80fc935a-39aa-eaca-e75c-02078c3dab05@gmail.com>
References: <1481511604-6116-1-git-send-email-arvind.yadav.cs@gmail.com>
 <20161212094218.2d29b34a@bbrezillon>
 <80fc935a-39aa-eaca-e75c-02078c3dab05@gmail.com>
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

Hi Arvind,

On Mon, 12 Dec 2016 21:33:05 +0530
arvind Yadav <arvind.yadav.cs@gmail.com> wrote:

> There is problem, if you will use devm_ioremap_resource instead of 
> devm_ioremap,
> than devm_ioremap_resource will call request_mem_region().
> request_mem_region() allows to tell the kernel that this driver is going 
> to use
> this range of I/O addresses, which will prevent other drivers to make an
> overlapping call to request_mem_region If other driver want to use same 
> address
> space to access then it will not allow. Means we can not share same 
> address space
> between two driver.

The question is, is it required here? In general, allowing 2 different
drivers from touching the same iomem region is a bad idea, so, if
there's a reason to allow that here, I'd like to know more about it.

Thanks,

Boris
