Received: from [2002:c1ed:8229::1] (helo=baythorne.infradead.org)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AsPzz-0000O1-Ry
	for linux-mtd@lists.infradead.org; Sun, 15 Feb 2004 17:24:08 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Marc Singer <elf@buici.com>
In-Reply-To: <20040215165455.GA31480@buici.com>
References: <20040215095325.GA27531@buici.com>
	 <1076843296.4484.2.camel@imladris.demon.co.uk>
	 <20040215165455.GA31480@buici.com>
Content-Type: text/plain
Message-Id: <1076865846.6883.9.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Sun, 15 Feb 2004 17:24:06 +0000
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
>   elf@florence ~...coastal/arm > mkfs.jffs2 -e 256kb -r root -o toucan.jffs

I've just committed a change to v1.40 to accept KiB and MiB. I did
briefly make it accept 'kb' too but it was going to give you an erase
size of 256 * 1000 / 8 == 32000 bytes, which probably isn't useful... so
then I was going to have to add a warning for such erase sizes... so I
took it out again :)

 
dwmw2
