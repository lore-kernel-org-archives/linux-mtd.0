Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RFP89-0000OX-NJ
	for linux-mtd@lists.infradead.org; Sun, 16 Oct 2011 11:43:54 +0000
Received: by bkbc12 with SMTP id c12so6475997bkb.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 16 Oct 2011 04:43:47 -0700 (PDT)
Subject: Re: Need to recover from corruption
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Steve Iribarne <siribarne@grid-net.com>
Date: Sun, 16 Oct 2011 14:43:20 +0300
In-Reply-To: <4E975135.9090702@grid-net.com>
References: <4E975135.9090702@grid-net.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1318765406.2935.7.camel@sauron>
Mime-Version: 1.0
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

On Thu, 2011-10-13 at 13:59 -0700, Steve Iribarne wrote:
> I work on a system where we need to be as 100% uptime as possible.  The 
> other day we had an issue here where one of our applications was 
> crashing while a write to one of the partitions was happening.
> 
> I then turned on UBIFS debugging in u-boot and I have a bunch of info 
> but I have no idea what is going on.

Well, judging from the log UBIFS went nuts for some reason (negative
free space). I've never seen this before.

Could you please write some more information about your system, flash,
kernel version, etc. Please, follow these instructions:
http://www.linux-mtd.infradead.org/faq/ubifs.html#L_how_send_bugreport

> Here is the output after (at the u-boot) prompt I do:
> 
> ubi part nand0,1
> ubifsmount boot-info

So this problem happens all the time when you boot? Or how reproducible
is it?

If this problem is reproducible, make a dump of your flash to save it
for further investigations.

-- 
Best Regards,
Artem Bityutskiy
