Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Zs8K-0006b0-00
	for <linux-mtd@lists.infradead.org>; Wed, 31 Jul 2002 12:59:16 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020731115703.GB28984@wohnheim.fh-wedel.de> 
References: <20020731115703.GB28984@wohnheim.fh-wedel.de>  <20020731103419.GA23749@wohnheim.fh-wedel.de> <FA06AA2C99BCD511951200005A99441001E3ECBE@irvexch1.sextantifs.com> <14572.1028067711@redhat.com> <2881.1028115952@redhat.com> 
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2_scan_eraseblock() - errors 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 31 Jul 2002 12:59:09 +0100
Message-ID: <4164.1028116749@redhat.com>
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
>  And this marking as obsolete is done how? Does is involve writes to
> the flash node, after it has already been written?

> Sorry for me being clueless. 

Yep. There's a bit in the node type field which we clear to mark the node 
obsolete. And I've been very strict about making sure it's an optimisation 
_only_, and we never actually rely on being able do to it.

Deletion of directory entries, for example, could perhaps have been done 
just by marking the original as obsolete, but instead we do it by writing a 
new dirent with the same name and inode #0. 

--
dwmw2
