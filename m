Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Zh9c-0005VO-00
	for <linux-mtd@lists.infradead.org>; Wed, 31 Jul 2002 01:15:52 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <FA06AA2C99BCD511951200005A99441001E3ECC5@irvexch1.sextantifs.com> 
References: <FA06AA2C99BCD511951200005A99441001E3ECC5@irvexch1.sextantifs.com> 
To: "Curtis, Allen" <Allen.Curtis@Thales-IFS.com>
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: jffs2_scan_eraseblock() - errors 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 31 Jul 2002 01:15:50 +0100
Message-ID: <16950.1028074550@redhat.com>
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
> Has anyone characterized the performance of the JFFS* file-systems
> over time? Our initial tests indicated that JFFS2 was faster than
> JFFS. After using the JFFS2 file-system and maintaining a relatively
> consistent utilization there was a 4X increase in the time required to
> complete a mount operation. Is this expected? Is there a worse case?
> See below for some measurements. 

It's expected. See the TODO file for notes on how we intend to fix it. 

--
dwmw2
