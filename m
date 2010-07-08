Received: from mail.windriver.com ([147.11.1.11])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OWl3Q-0006s5-AK
	for linux-mtd@lists.infradead.org; Thu, 08 Jul 2010 06:57:54 +0000
Message-ID: <4C3579D9.5090107@windriver.com>
Date: Thu, 08 Jul 2010 15:10:17 +0800
From: "stanley.miao" <stanley.miao@windriver.com>
MIME-Version: 1.0
To: Artem.Bityutskiy@nokia.com
Subject: Re: [PATCH v3] Fix mtd-utils bugs
References: <1277036580-3501-1-git-send-email-stanley.miao@windriver.com>
	<1278571672.12733.54.camel@localhost>
In-Reply-To: <1278571672.12733.54.camel@localhost>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Kevin Cernekee <cernekee@gmail.com>, linux-mtd@lists.infradead.org,
	Ladislav Michl <ladis@linux-mips.org>, joakim.tjernlund@transmode.se
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy wrote:
>
> Stanley,
>
> I'd like to first take patches from Kevin, which move libmtd from
> ubi-utils and make mtd utilities like flash_eraseall start using libmtd.
>
> It would be nice then if you enhanced limbtd to serve your perposes and
> also used it, instead of direct ioctl calls. libmtd should also be used
> to get information about which features are supported.
>
> Will this upset you much :-) ?
>
> You can find Kevin's patches I refer in the MTD miling list. The last
> series to the date are:
>
> [PATCHv2 1/5] mtd-utils: move libmtd source files to lib/ subdirectory
>
> Could you please take a look at them, review them, then when everyone is
> happy, we merge them to mtd-utils, then you can do your changes on top,
> and we also add the patch from Ladislav on top.
>
> Does this sound OK for you?
>   

OK, I will rebase my patch on Kevin's.

Stanley.
