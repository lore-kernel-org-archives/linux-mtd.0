Received: from wohnheim.fh-wedel.de ([195.37.86.122])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19SbAK-0000mU-VK
	for <linux-mtd@lists.infradead.org>; Wed, 18 Jun 2003 12:31:49 +0100
Date: Wed, 18 Jun 2003 13:32:09 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Ken Gordon <kengordon@magneticscrolls.com>
Message-ID: <20030618113209.GA26603@wohnheim.fh-wedel.de>
References: <004101c33586$cb802a90$1207a8c0@kenlap>
	<1055933659.2233.98.camel@passion.cambridge.redhat.com>
	<004a01c3358c$8e522eb0$1207a8c0@kenlap>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <004a01c3358c$8e522eb0$1207a8c0@kenlap>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
cc: David Woodhouse <dwmw2@infradead.org>
Subject: Re: Getting a mtd_info with a valid map.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 18 June 2003 12:27:08 +0100, Ken Gordon wrote:
> 
> >From cfi_cmdset_0001.c

Good.  And now look into devices/*.c and figure out, what mtd->priv
means for those.  Why again do you think, it was called priv and not
map?

Jörn

-- 
To announce that there must be no criticism of the President, or that we
are to stand by the President, right or wrong, is not only unpatriotic
and servile, but is morally treasonable to the American public.
-- Theodore Roosevelt, Kansas City Star, 1918
