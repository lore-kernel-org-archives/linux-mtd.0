Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17ZhfM-0005Yw-00
	for <linux-mtd@lists.infradead.org>; Wed, 31 Jul 2002 01:48:40 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <FA06AA2C99BCD511951200005A99441001E3ECC7@irvexch1.sextantifs.com> 
References: <FA06AA2C99BCD511951200005A99441001E3ECC7@irvexch1.sextantifs.com> 
To: "Curtis, Allen" <Allen.Curtis@Thales-IFS.com>
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: jffs2_scan_eraseblock() - errors 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 31 Jul 2002 01:48:37 +0100
Message-ID: <17606.1028076517@redhat.com>
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

Allen.Curtis@Thales-IFS.com said:
>  THX, anything like that for JFFS? Unfortunately that is what we are
> shipping now and it gets VERY slow, even with our GCD nice level
> modification. 

Dunno. You could try increasing JFFS_HASH_SIZE but it may not be a 
bottleneck there -- it's been a very long time since I've looked seriously 
at JFFS1 code. Again, profile data are useful.

--
dwmw2
