Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by pentafluge.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EHymx-0006oa-2b
	for linux-mtd@lists.infradead.org; Wed, 21 Sep 2005 08:13:08 +0100
Date: Wed, 21 Sep 2005 09:10:36 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: zhao forrest <zhao_fusheng@hotmail.com>
Message-ID: <20050921071036.GA9369@wohnheim.fh-wedel.de>
References: <20050920113616.GD2143@wohnheim.fh-wedel.de>
	<BAY17-F127FC28C2D9627C1F5DCC6E8940@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BAY17-F127FC28C2D9627C1F5DCC6E8940@phx.gbl>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH]Add JFFS2 eraseblock header support
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 21 September 2005 10:57:40 +0800, zhao forrest wrote:
> 
> I can understand your opinion. Your idea is that, since 1:1 mapping was 
> handled recently, the comp_flag of eraseblock_header can be set to 
> RWCOMPAT_
> DELETE for the JFFS2 code with 1:1 mapping. But for the older JFFS2 code 
> with
> 1:N mapping, the comp_flag of eraseblock_header have to be set to INCOMPAT.
> IMHO I think 1:1 mapping and eraseblock_header should be added to JFFS2 at 
> the same time. But the current situation is that 1:1 mapping patch was 
> checked into CVS earlier than eraseblock_header. 
> So I still agree that "old JFFS2 binaries reject mounting new JFFS2 
> images".

Are you saying that the current way to handle 1:1 mapping is bullocks?

Jörn

-- 
/* Keep these two variables together */
int bar;
