Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NF2eD-0000T0-Vj
	for linux-mtd@lists.infradead.org; Mon, 30 Nov 2009 09:34:26 +0000
Subject: Re: [PATCH] mtd/nandsim: add support for 4KiB pages
From: Artem Bityutskiy <dedekind@infradead.org>
To: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
In-Reply-To: <20091129180757.GA30617@Chamillionaire.breakpoint.cc>
References: <20091129180757.GA30617@Chamillionaire.breakpoint.cc>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 30 Nov 2009 11:34:00 +0200
Message-Id: <1259573640.7518.75.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2009-11-29 at 19:07 +0100, Sebastian Andrzej Siewior wrote:
> I was going to play with a faulty nand image from real flash and noticed
> that nandsim does not work with:
> first_id_byte=0xec second_id_byte=0xd5 third_id_byte=0x51 fourth_id_byte=0xa6
> 
> This patch seems to fix it.
> 
> Signed-off-by: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
> ---
>  drivers/mtd/nand/nandsim.c |    7 +++++--
>  1 files changed, 5 insertions(+), 2 deletions(-)

Pushed this patch to my l2 tree, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
