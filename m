Received: from ug-out-1314.google.com ([66.249.92.170])
	by bombadil.infradead.org with esmtp (Exim 4.66 #1 (Red Hat Linux))
	id 1IrYcl-0001b3-Hb
	for linux-mtd@lists.infradead.org; Mon, 12 Nov 2007 07:42:49 -0500
Received: by ug-out-1314.google.com with SMTP id 23so693743ugr
	for <linux-mtd@lists.infradead.org>;
	Mon, 12 Nov 2007 04:42:40 -0800 (PST)
Message-ID: <679044850711120442y520253feq1f97bb30d871fe31@mail.gmail.com>
Date: Mon, 12 Nov 2007 15:42:38 +0300
From: "Damir Shayhutdinov" <lost404@gmail.com>
To: joakim.tjernlund@transmode.se
Subject: Re: Kernel memleak in jffs2_erase_block() (fs/jffs2/erase.c:78)
In-Reply-To: <1194870649.4029.37.camel@gentoo-jocke.transmode.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <679044850711120239wbf9545bxf990ceb1459c3c51@mail.gmail.com>
	<1194870649.4029.37.camel@gentoo-jocke.transmode.se>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > So, sizeof(struct erase_info) + sizeof(struct erase_priv_struct) bytes
> > are leaking each time block is erased successfully.
>
> Nope, instr is freed in jffs2_erase_callback() in this case.

Oh, I missed that part. You're right. Maybe it's worth some comments
in source code?
