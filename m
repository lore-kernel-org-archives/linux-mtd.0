Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 166VLf-0001Nb-00
	for <linux-mtd@lists.infradead.org>; Wed, 21 Nov 2001 11:15:23 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3BFBDB54.C02EBE28@sasken.com> 
References: <3BFBDB54.C02EBE28@sasken.com> 
To: Ashok M Padmanaban <ashokmp@sasken.com>
Cc: MTD for Linux <linux-mtd@lists.infradead.org>,
    JFFS mailing list <jffs-dev@axis.com>
Subject: Re: Flash Partitons 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 21 Nov 2001 11:25:51 +0000
Message-ID: <9111.1006341951@redhat.com>
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

ashokmp@sasken.com said:
>  But having the config files and user data in the same partition
> .......will it be safe? Like while manipulating the user data, is
> there any chance that config files may be corrupted...while GC. is
> running and the power goes down.......) 

It ought to be safe. It's designed that way and perhaps more importantly,
we've actually done power-fail testing on active JFFS2 filesystems and
observed that it's fine. You can do your own testing to make sure it's
reliable to your own standards.

The 5 blocks of GC reserved space is also fixable. We'll reduce it if and
when I'm sufficiently convinced that it's safe to do so.

--
dwmw2
