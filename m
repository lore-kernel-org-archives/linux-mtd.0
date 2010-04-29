Received: from mail-out.m-online.net ([212.18.0.9])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O7UUX-0002hU-UH
	for linux-mtd@lists.infradead.org; Thu, 29 Apr 2010 14:13:27 +0000
Date: Thu, 29 Apr 2010 16:13:20 +0200
From: Anatolij Gustschin <agust@denx.de>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH v2] mtdchar: allow mmap() on MTD RAM/ROM char devices
Message-ID: <20100429161320.3b179f6c@wker>
In-Reply-To: <1272471640-27073-1-git-send-email-agust@denx.de>
References: <1272461518.7750.31.camel@localhost>
	<1272471640-27073-1-git-send-email-agust@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

On Wed, 28 Apr 2010 18:20:40 +0200
Anatolij Gustschin <agust@denx.de> wrote:

> Signed-off-by: Anatolij Gustschin <agust@denx.de>
> ---
> v1 -> v2:
>  - Fixed compilation breakage on x86_64 while compiling
>    as module, since on x86_64 phys_mem_access_prot() is
>    not exported. Sorry for the breakage.
> 
>  drivers/mtd/mtdchar.c |   30 +++++++++++++++++++++++++++++-
>  1 files changed, 29 insertions(+), 1 deletions(-)

Is this patch ok now?

Thanks,
Anatolij
