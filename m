Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17L6ER-0008Dt-00
	for <linux-mtd@lists.infradead.org>; Thu, 20 Jun 2002 19:00:31 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020620184631.A14004@wohnheim.fh-wedel.de> 
References: <20020620184631.A14004@wohnheim.fh-wedel.de> 
To: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 cannot even initialize 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 20 Jun 2002 19:00:29 +0100
Message-ID: <398.1024596029@redhat.com>
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
> After merging current JFFS2 with our kernel again, I tripped over the
> first sanity check in super-v24.c. Here is the dmesg: JFFS2 error:
> struct jffs2_sb_info (376 bytes) doesn't fit in the super_block union
> (272 bytes)

> Is this a known issue? What do I do? 

You need to make sure the jffs2_sb is included in the super_block union in 
include/linux/fs.h, like all the other filesystems' sb_infos are.

If you're using a kernel after 2.4.10, it should be there already. If not, 
why not?

--
dwmw2
