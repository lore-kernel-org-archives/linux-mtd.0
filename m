Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17ZhBz-0005Vm-00
	for <linux-mtd@lists.infradead.org>; Wed, 31 Jul 2002 01:18:19 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <FA06AA2C99BCD511951200005A99441001E3ECC5@irvexch1.sextantifs.com> 
References: <FA06AA2C99BCD511951200005A99441001E3ECC5@irvexch1.sextantifs.com> 
To: "Curtis, Allen" <Allen.Curtis@Thales-IFS.com>
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: jffs2_scan_eraseblock() - errors 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 31 Jul 2002 01:18:17 +0100
Message-ID: <16996.1028074697@redhat.com>
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
>  After being used, usage = 41%: JFFS2	real	1m3.583	(4X increase) 

Btw, the most useful thing you can give here is profiling information. If 
you still have INOCACHE_HASHSIZE set to 1 in include/linux/jffs2_fs_sb.h 
then I can guess what's at the top of your profile. Increase it to 14 or 
128 or something for an instant win.

--
dwmw2
