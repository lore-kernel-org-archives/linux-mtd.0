Received: from smtp.ctimail.com ([203.186.94.58] helo=smtpo.ctimail.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19kkd8-0001U2-8d
	for <linux-mtd@lists.infradead.org>; Thu, 07 Aug 2003 14:16:34 +0100
Message-ID: <3F3250E5.90403@alumni.cuhk.net>
Date: Thu, 07 Aug 2003 21:15:17 +0800
From: Selwyn Tang <cyberdoc@alumni.cuhk.net>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
References: <3F320400.3000002@hectrix.com>
	<1060253236.25209.44.camel@passion.cambridge.redhat.com>
In-Reply-To: <1060253236.25209.44.camel@passion.cambridge.redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: "init not found" after booting GRUB on DOC
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse wrote:
> Sounds like a problem with the _contents_ of your file system. Does it
> boot if you use 'init=/bin/sh', and if so, can you then run /sbin/init?

I figured out what's the problem: Since I wanted to try out booting with
DOC first, I didn't prepare the C library. But my busybox was compiled
with dynamically linking, it's init could not be started and resulted in
the kernel panic.

Now I compiled busybox with static linking and it works.

Thanks for your help!

Selwyn
