Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OnW5R-0000yw-FH
	for linux-mtd@lists.infradead.org; Mon, 23 Aug 2010 12:25:14 +0000
Received: by bwz13 with SMTP id 13so5175277bwz.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 Aug 2010 05:25:12 -0700 (PDT)
Subject: Re: Mounting UBIFS readonly - is it really readonly?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Sergei Zhirikov <sfzhi@yahoo.com>
In-Reply-To: <i2namf$mj6$1@dough.gmane.org>
References: <i2namf$mj6$1@dough.gmane.org>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 23 Aug 2010 15:23:40 +0300
Message-ID: <1282566220.24044.22.camel@localhost>
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

On Tue, 2010-07-27 at 21:05 +0200, Sergei Zhirikov wrote:
> As you can see, there is "ro", which causes UBIFS to be initially
> mounted readonly. And later it is *never* remounted read-write.
> Everything seems to work as expected (I get "Read-only file system"
> error upon a write attempt) except one thing. Somehow the modification
> time of /dev/console is updated every time the system boots. Note: I'm
> not talking about the /dev/console located inside the /dev mount
> (which is tmpfs and is obvously writable), I'm talking about
> the /dev/console located on the root file system and accessed
> (probably by init) before /dev is mounted. I'm really puzzled. How is
> this possible? The root filesystem has been readonly all the time and
> still the timestamp is somehow updated. Does anyone have an idea what
> might be going on there?

Did you solve the issue, I'm just curious.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
