Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17qUFz-0005rz-00
	for <linux-mtd@lists.infradead.org>; Sun, 15 Sep 2002 08:55:52 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020915010056.GA916@buici.com> 
References: <20020915010056.GA916@buici.com>  <20020914235138.GA28771@bombadil.xmldesign.de> 
To: Marc Singer <elf@buici.com>
Cc: Erich Schubert <erich@debian.org>, linux-mtd@lists.infradead.org
Subject: Re: recommended Filesystem for DoC? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sun, 15 Sep 2002 08:55:44 +0100
Message-ID: <21231.1032076544@redhat.com>
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

elf@buici.com said:
>  I've been looking into something similar.  Presently, I use ext3
> because I have enough space space for a 1M journal.  However, I don't
> recommend this.  I've been considering using cloop (KNOPPIX) because
> it doesn't require a ramdisk and then installing JFFS as the root
> filesystem.  This means that the static part is always compressed and
> mounted at boot time.

Yeah. Using a journalling pseudo-filesystem to emulate a block device, and 
having to set aside a hunk of the space it provides for journalling of a
'normal' file system, is crazy. IMHO, you only have an excuse for pretending
that flash is a block device if you're still running DOS.

The JFFS2 NAND support is almost complete -- just a few corner cases to be 
fixed up. AFAIK it should work on DoC without too much trouble -- after 
all, a DoC is just a bunch of NAND flash chips.

--
dwmw2
