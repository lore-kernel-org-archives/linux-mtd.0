Received: from mail.transmode.se ([83.241.175.147] helo=tmnt04.transmode.se)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Jk1c9-0007V1-Sj
	for linux-mtd@lists.infradead.org; Thu, 10 Apr 2008 18:35:15 +0000
From: "Joakim Tjernlund" <Joakim.Tjernlund@transmode.se>
To: "'Jean Pihet'" <jpihet@mvista.com>,
	<linux-mtd@lists.infradead.org>
References: <Pine.LNX.4.64.0804101152270.13226@pentafluge.infradead.org>
	<200804101918.21362.jpihet@mvista.com>
In-Reply-To: <200804101918.21362.jpihet@mvista.com>
Subject: RE: [BUG] JFFS2 usage of write_begin and write_end functions
	causes	kernel panic
Date: Thu, 10 Apr 2008 20:35:07 +0200
Message-ID: <018a01c89b39$9a2b4fb0$ce81ef10$@Tjernlund@transmode.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: sv
Cc: nickpiggin@yahoo.com.au, joern@logfs.org, dwmw2@infradead.org,
	'Alexey Korolev' <akorolev@infradead.org>, akpm@linux-foundation.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> -----Original Message-----
> From: linux-mtd-bounces@lists.infradead.org [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf
> Of Jean Pihet
> Sent: den 10 april 2008 19:18
> To: linux-mtd@lists.infradead.org
> Cc: nickpiggin@yahoo.com.au; joern@logfs.org; dwmw2@infradead.org; Alexey Korolev; akpm@linux-
> foundation.org
> Subject: Re: [BUG] JFFS2 usage of write_begin and write_end functions causes kernel panic
> 
> Alexey,
> 
> Here is the patch (attached) I applied to get a stable JFFS2 filesystem.
> The changes have been cherry picked from
> http://sourceforge.net/projects/mtd-mods.
> 
> I stressed it with intensive read/write, flash fill-up and data removal. A few
> GB's of data have been transferred without any problem. I didn't try the tool
> you mentionned though.
> Tested on OMAP3 platform.
> 
> Now I am testing with PREEMPT_RT config.

Is this in Linus tree too?

    Jocke
