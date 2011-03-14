Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pz3LU-0006Ih-M4
	for linux-mtd@lists.infradead.org; Mon, 14 Mar 2011 08:41:46 +0000
Subject: Re: [PATCH 01/02] mtdswap: kill strip error handling option
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
To: Yang Ruirui <ruirui.r.yang@tieto.com>
In-Reply-To: <20110314015056.GA6819@darkstar>
References: <20110314015056.GA6819@darkstar>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 14 Mar 2011 10:39:58 +0200
Message-ID: <1300091998.2727.3.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, ext-phil.2.carmody@nokia.com,
	dwmw2@infradead.org, ruirui.r.yang@tietoenator.com,
	ext-jani.1.nikula@nokia.com
Reply-To: Artem.Bityutskiy@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-03-14 at 09:50 +0800, Yang Ruirui wrote:
> From: Yang Ruirui<ruirui.r.yang@tieto.com>
> 
> As Artem Bityutskiy's suggestion, The strict erase error handling option
> does not make much sense.

Well, I does make sense, but we just have no prove it is any useful,
this is why I suggested to kill it.

> 
> Here kill the option, and still keep the retry times as before.
> 
> Signed-off-by: Yang Ruirui<ruirui.r.yang@tieto.com>
> ---
>  drivers/mtd/Kconfig   |    8 --------
>  drivers/mtd/mtdswap.c |    8 +-------
>  2 files changed, 1 insertion(+), 15 deletions(-)

Thank, I've amended the commit message and pushed to my l2-mtd-2.6.git
tree.

Artem.
