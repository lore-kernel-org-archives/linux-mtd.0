Received: from [2002:c1ed:8229::1] (helo=baythorne.infradead.org)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AsPhg-0000En-0Q
	for linux-mtd@lists.infradead.org; Sun, 15 Feb 2004 17:05:12 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Marc Singer <elf@buici.com>
In-Reply-To: <20040215165455.GA31480@buici.com>
References: <20040215095325.GA27531@buici.com>
	 <1076843296.4484.2.camel@imladris.demon.co.uk>
	 <20040215165455.GA31480@buici.com>
Content-Type: text/plain
Message-Id: <1076864709.6883.6.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Sun, 15 Feb 2004 17:05:09 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Can 256K erase blocks work with JFFS2?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2004-02-15 at 08:54 -0800, Marc Singer wrote:
>   mkfs.jffs2 revision 1.19
> 
> This version appears to have the code that understands that 256 means
> KiB.

I don't think so. That wasn't added till v1.23, in March 2002.

> And, it still produces an image that is substantially larger that the
> source data as well as being larger than the total available flash.
> 
>   elf@florence ~...coastal/arm > mkfs.jffs2 -e 256kb -r root -o toucan.jffs

The -e option takes only numbers; the defaults in the help text do seem
to imply otherwise -- I should probably fix that. But even if I _did_
fix it to understand KiB/MiB, you're actually telling it above that you
want an erasesize of 256000 bits :)

Try '-e 262144' or '-e 0x40000'

-- 
dwmw2
