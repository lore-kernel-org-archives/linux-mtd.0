Received: from blood.actrix.co.nz ([203.96.16.160])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Ag6Yu-0003kT-Bz
	for linux-mtd@lists.infradead.org; Mon, 12 Jan 2004 18:13:16 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Charles Manning <manningc2@actrix.gen.nz>
To: luoxiao@roxus.net, linux-mtd@lists.infradead.org
Date: Tue, 13 Jan 2004 07:17:51 +1300
References: <20040109150723.M52805@roxus.net>
In-Reply-To: <20040109150723.M52805@roxus.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20040112181058.8A0ED5447@blood.actrix.co.nz>
Subject: Re: best nand flash fs for 2.0.38 kernel?
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 09 January 2004 20:07, luoxiao wrote:
> Hi, all
>
> I'm currently trying to add nand flash file system support for the linux
> 2.0.38 porting on my company's product. I choosed the JFFS but the JFFS2
> because it fits the old 2.0.x kernel. In the processing of porting I met a
> lot of troubles and I thought some of them are caused by bugs of JFFS code
> rather by my porting. So a question is: is the JFFS stable enough for
> product usage? I saw it is still in the fs/ directory of the brand-new
> 2.6.0 kernel. Does this fact mean that the version of JFFS in the 2.6.0
> kernel is stable enough to use? I've searched the docs and mail archive but
> it seems that no one is using JFFS now. So the question is: what is the
> best nand flash file system for the 2.0.x kernel?

AFAIK JFFS does not support NAND, but JFFS2 does, so does YAFFS.

"Best" is hard to define and mileage will vary. Both YAFFS and JFFS2 have 
there place in the world.

I can't speak for porting JFFS2, but I can for YAFFS.

YAFFS currently works with 2.4 and 2.6. YAFFS does not use many kernel 
features (threads etc), so I would expect porting to other Linux variants to 
be not too bad.

-- Charles
