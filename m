Received: from cpsmtpb-ews03.kpnxchange.com ([213.75.39.6])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V2J4m-0005am-Ts
 for linux-mtd@lists.infradead.org; Thu, 25 Jul 2013 10:47:18 +0000
Message-ID: <1374749192.29835.48.camel@x61.thuisdomein>
Subject: Re: [PATCH] mtd: remove obsolete JEDEC mapping drivers
From: Paul Bolle <pebolle@tiscali.nl>
To: David Woodhouse <dwmw2@infradead.org>
Date: Thu, 25 Jul 2013 12:46:32 +0200
In-Reply-To: <1368456039.1350.53.camel@x61.thuisdomein>
References: <1368456039.1350.53.camel@x61.thuisdomein>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2013-05-13 at 16:40 +0200, Paul Bolle wrote:
> JEDEC device support was removed in v2.6.22. (It had been marked as
> BROKEN (indirectly) since at least v2.6.12.)
> 
> When it was removed the two JEDEC mapping drivers that depended on it
> should have been removed too. Do so now.
> 
> Signed-off-by: Paul Bolle <pebolle@tiscali.nl>
> ---
> 0) Untested.
> 
> 1) These two [seem] to have been missed in Artem's recent cleaning up
> effort. Or is a comparable patch queued somewhere?

Did anyone had a chance to look at this patch? Or has this code already
been removed?

>  drivers/mtd/maps/Kconfig        |  18 ---
>  drivers/mtd/maps/Makefile       |   2 -
>  drivers/mtd/maps/octagon-5066.c | 246 ----------------------------------------
>  drivers/mtd/maps/vmax301.c      | 196 --------------------------------
>  4 files changed, 462 deletions(-)
>  delete mode 100644 drivers/mtd/maps/octagon-5066.c
>  delete mode 100644 drivers/mtd/maps/vmax301.c

[...]


Paul Bolle
