Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16awVS-0002V6-00
	for <linux-mtd@lists.infradead.org>; Wed, 13 Feb 2002 10:19:18 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020213111834.A28187@wohnheim.fh-wedel.de> 
References: <20020213111834.A28187@wohnheim.fh-wedel.de> 
To: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Compiler errors in current CVS 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 13 Feb 2002 10:30:31 +0000
Message-ID: <24565.1013596231@redhat.com>
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
> end = min_t(uint32_t, start + PAGE_CACHE_SIZE, JFFS2_F_I_SIZE(f));
>             ^^^^^^^^ The compiler gave a parse error and I cannot make
> any more sense out of it.

What kernel version?

--
dwmw2
