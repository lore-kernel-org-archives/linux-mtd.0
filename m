Received: from [2002:d592:9a28::1] (helo=pentafluge.infradead.org)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BvbDr-0007SI-2K
	for linux-mtd@lists.infradead.org; Fri, 13 Aug 2004 08:31:51 -0400
From: David Woodhouse <dwmw2@infradead.org>
To: Stefan =?ISO-8859-1?Q?St=FCrke?= <sst@pandatel.com>
In-Reply-To: <loom.20040813T140134-351@post.gmane.org>
References: <loom.20040813T140134-351@post.gmane.org>
Content-Type: text/plain; charset=UTF-8
Message-Id: <1092400305.10618.145.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Fri, 13 Aug 2004 13:31:46 +0100
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: mkfs.jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2004-08-13 at 12:02 +0000, Stefan Stürke wrote:
> My problem is, that I cannot be sure which erasesize the
> target flash will have. Because two flash types with different
> sector sizes (64k and 128k) have to be supported.
> 
> Is it possible to create a jffs2 image that can run on both flashes,
> or do I have to create two diffenent images?

You can use the smaller erasesize, as long as you don't include
cleanmarkers. 

> My current command for creating the filesystem is:
> 
> mkfs.jffs2 -b -e $erasesize -p -r $source -o fs.jffs2

Use:
 -b -e 64KiB -p -n -r $source -o fs.jffs2

-- 
dwmw2
