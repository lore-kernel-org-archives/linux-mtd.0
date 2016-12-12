Received: from smtp06.smtpout.orange.fr ([80.12.242.128]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cGTXd-0004hO-C6
 for linux-mtd@lists.infradead.org; Mon, 12 Dec 2016 16:33:30 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: arvind Yadav <arvind.yadav.cs@gmail.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>, dwmw2@infradead.org,
 computersforpeace@gmail.com, marek.vasut@gmail.com, richard@nod.at,
 cyrille.pitchen@atmel.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [V2] mtd: devices: docg3:- Handle return value of devm_ioremap.
References: <1481511604-6116-1-git-send-email-arvind.yadav.cs@gmail.com>
 <20161212094218.2d29b34a@bbrezillon>
 <80fc935a-39aa-eaca-e75c-02078c3dab05@gmail.com>
Date: Mon, 12 Dec 2016 17:32:58 +0100
In-Reply-To: <80fc935a-39aa-eaca-e75c-02078c3dab05@gmail.com> (arvind Yadav's
 message of "Mon, 12 Dec 2016 21:33:05 +0530")
Message-ID: <8760mp151h.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

arvind Yadav <arvind.yadav.cs@gmail.com> writes:

> There is problem, if you will use devm_ioremap_resource instead of devm_ioremap,
> than devm_ioremap_resource will call request_mem_region().
> request_mem_region() allows to tell the kernel that this driver is going to use
> this range of I/O addresses, which will prevent other drivers to make an
> overlapping call to request_mem_region If other driver want to use same address
> space to access then it will not allow. Means we can not share same address
> space
> between two driver.

Hi,

You're right Arvind, and still, it's worth noticing that the docg3 access
semantics imply a "reserved" resource path (see how doc_register_readb() does a
write and how this cannot be shared with another driver).

Therefore I'll be willing to ack a mix of your both patches, the
devm_ioremap_resource() from Boris and the error message from your patch.

Cheers.

--
Robert
