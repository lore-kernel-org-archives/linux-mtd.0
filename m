Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16Sxut-0007GB-00
	for <linux-mtd@lists.infradead.org>; Tue, 22 Jan 2002 10:12:35 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020122112104.C27725@wohnheim.fh-wedel.de> 
References: <20020122112104.C27725@wohnheim.fh-wedel.de>  <3C487D9A.D85DDC3D@comdev.cc> <3C48504B.68F8FE7F@comdev.cc> <20020118010528.A22777@swing.comdev.cc> <28158.1011372920@redhat.com> <3C487D9A.D85DDC3D@comdev.cc> <4896.1011653373@redhat.com> 
To: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
Cc: Adam Wozniak <adam.wozniak@comdev.cc>, linux-mtd@lists.infradead.org
Subject: Re: optimum geometry 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 22 Jan 2002 10:23:36 +0000
Message-ID: <2181.1011695016@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

joern@wohnheim.fh-wedel.de said:
>  I partially disagree. You are absolutely right about the "unused"
> blocks. But with mkfs.jffs2, I create smaller images with a blocksize
> of 128k, than with a blocksize of 64k. This makes sense, as jffs[12]
> must store some information per eraseblock, so fewer eraseblocks mean
> less overhead. In effect, there is an optimal erase block size,
> depending on the size of your filesystem, where the sum of both
> effects is minimal. But in most currently practical cases, the
> smallest possible is still the best. 

Yes, you're right. The overhead per-block is 12 bytes, but probably more
important than that is the fact that more nodes have to be split up between
blocks rather than being written out in one go - meaning an extra 70-odd 
byte header, and worse compression.

--
dwmw2
