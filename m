Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15uDCz-00062v-00
	for <linux-mtd@lists.infradead.org>; Thu, 18 Oct 2001 14:27:37 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3BCED9DB.28F7D365@uniquemodem.com> 
References: <3BCED9DB.28F7D365@uniquemodem.com>  <3BCD84E1.4DD484A6@uniquemodem.com> <25716.1003325012@redhat.com> 
To: data <data@uniquemodem.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: mtdblock.c cannot compile under Linux 2.2.x 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 18 Oct 2001 14:36:47 +0100
Message-ID: <29521.1003412207@redhat.com>
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

data@uniquemodem.com said:
>  Thanks for your reply. However, I don't quite catch your meaning for
> don't apply the patch which adds the init calls. Could you please
> elaborate further?

You applied a patch which added calls to init_jffs_fs() and init_mtd()? 
Revert it. Otherwise, it may be the compatibility module_init() stuff going 
wrong. 

> Secondly, I have encountered another error in mtdblock.c for subscribt
> out of range. Could you please het me to have a look.

Looks broke. Should be obvious if you go and poke around at the 
compatibility macros. 

--
dwmw2
