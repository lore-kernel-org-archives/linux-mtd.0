Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MIjJc-0000fa-NV
	for linux-mtd@lists.infradead.org; Mon, 22 Jun 2009 13:12:11 +0000
Subject: Re: [PATCH] [UBI] Volume table update fix
From: Artem Bityutskiy <dedekind@infradead.org>
To: Brijesh Singh <brij.singh@samsung.com>
In-Reply-To: <6b5362aa0906220414s7b79011akd181adbedb322ea7@mail.gmail.com>
References: <6b5362aa0906190401l51bcf28bg44b9a7a9f49aa773@mail.gmail.com>
	<1245655796.9487.29.camel@localhost.localdomain>
	<1245656068.9487.31.camel@localhost.localdomain>
	<6b5362aa0906220414s7b79011akd181adbedb322ea7@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 22 Jun 2009 16:11:54 +0300
Message-Id: <1245676314.9487.37.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: brijesh.s.singh@gmail.com, linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2009-06-22 at 16:44 +0530, Brijesh Singh wrote:
> Hi Artem,
>     Thanks for the comments.Sending the cleaned up patch.
> 
>     This patch fixes the consistency problem during volume update.
> UBI writes two copies of vtbl during volume update. If the first  copy  was
> successfully written, and second copy fails, UBI returns failure. But UBI
> recovers updated vtbl during next mount. So it should have returned success.
> It should go to read only mode to avoid further failures.
> 
> Signed-off-by: Brijesh Singh <brij.singh@samsung.com>

Applied with minor amendments, thanks.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
