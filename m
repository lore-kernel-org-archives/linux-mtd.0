Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16Sn5E-0006bt-00
	for <linux-mtd@lists.infradead.org>; Mon, 21 Jan 2002 22:38:32 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3C487D9A.D85DDC3D@comdev.cc> 
References: <3C487D9A.D85DDC3D@comdev.cc>  <3C48504B.68F8FE7F@comdev.cc> <20020118010528.A22777@swing.comdev.cc> <28158.1011372920@redhat.com> 
To: Adam Wozniak <adam.wozniak@comdev.cc>
Cc: linux-mtd@lists.infradead.org
Subject: Re: optimum geometry 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 21 Jan 2002 22:49:33 +0000
Message-ID: <4896.1011653373@redhat.com>
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

adam.wozniak@comdev.cc said:
>  I'm beginning to fear that this is far from optimum.  What is an
> optimum erase block size?

As small as possible. The free space required by JFFS2 is measured in 
blocks. It could probably be reduced to 2 or 3 blocks from the current 5/6 
but will always be a straight multiple of blocksize, I think.

> I could drop back and rewrite the MTD driver to address each chip
> seperately, but I'm concerned that would be both messy and tough on
> performance. 

By treating them as two pairs, you'll halve the write performance and also
halve the amount of wasted space. It's a tradeoff which you have to decide
on.

--
dwmw2
