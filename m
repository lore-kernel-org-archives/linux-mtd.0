Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P6daK-0001sn-Rf
	for linux-mtd@lists.infradead.org; Fri, 15 Oct 2010 06:16:09 +0000
Received: by bwz7 with SMTP id 7so1250482bwz.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 14 Oct 2010 23:16:04 -0700 (PDT)
Subject: Re: ubifs: sync() causes writes even if nothing is changed
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Hans J. Koch" <hjk@linutronix.de>
In-Reply-To: <20101013163005.GB1889@silverbox.local>
References: <20101013163005.GB1889@silverbox.local>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 15 Oct 2010 09:13:01 +0300
Message-ID: <1287123181.18576.1.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-mtd@lists.infradead.org, Adrian Hunter <adrian.hunter@nokia.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-10-13 at 18:30 +0200, Hans J. Koch wrote:
> Running this command:
> 
> # while true ; do sync; sleep 1; done
> 
> causes two eraseblocks being erased every second, although there
> are no writes to the ubifs filesystem. I hacked some printks into
> my NAND driver that print page_address and column for each erase.
> With that, I get this output every second:
> 
> ...
> [   63.701765] erase p=0x0000ae40 c=0xffffffff
> [   63.706534] erase p=0xffffffff c=0xffffffff
> [   63.725492] erase p=0x0000ae80 c=0xffffffff
> [   63.730260] erase p=0xffffffff c=0xffffffff
> ...
> 
> From a quick glance at the ubifs code, this might come out of the
> garbage collector that is triggered on every sync() and writes
> something even if nothing has changed.
> 
> Is that really needed?

Hi, no, it is not. I'll look at this as soon as I have some time. There
is already Matthieu's issue waiting in my queue, though. Thanks for
reporting.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
