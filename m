Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1POYHq-0005t4-Rg
	for linux-mtd@lists.infradead.org; Fri, 03 Dec 2010 16:15:07 +0000
Received: by bwz5 with SMTP id 5so8811707bwz.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 03 Dec 2010 08:15:05 -0800 (PST)
Subject: Re: bud_replay size question
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Steve Iribarne <siribarne@grid-net.com>
In-Reply-To: <1291392477.2365.64.camel@localhost>
References: <4CF691F0.9010607@grid-net.com>
	<1291392477.2365.64.camel@localhost>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 03 Dec 2010 18:14:34 +0200
Message-ID: <1291392874.2365.67.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-12-03 at 18:07 +0200, Artem Bityutskiy wrote:
> Alternatively, you can try to look at all UBIFS allocations. I will not
> be surprized if it allocates some buffers which are not really neaded in
> R/O mode, although we did do some work to allocate less resources when
> we are in R/O mode. You can experiment in Linux, because it is easier,
> and if you find unneeded buffers, fix this, and then port your changes
> to u-boot.

And you can try to look at UBI - in R/O mode we probably need less than
we allocate, but again dunno for sure, should be checke.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
