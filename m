Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15qWMH-000654-00
	for <linux-mtd@lists.infradead.org>; Mon, 08 Oct 2001 10:05:57 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20011005113711.A29087@recycle.lbl.gov> 
References: <20011005113711.A29087@recycle.lbl.gov> 
To: Larry Doolittle <ldoolitt@recycle.lbl.gov>
Cc: linux-mtd@lists.infradead.org
Subject: Re: minor einfo and mtd_debug improvement 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 08 Oct 2001 10:15:05 +0100
Message-ID: <13552.1002532505@redhat.com>
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

ldoolitt@recycle.lbl.gov said:
>  The following changes let einfo and mtd_debug do the right thing when
> the underlying MTD device is marked readonly.

Thanks; applied. The patch was backwards - 'cvs diff -u' would have given 
better results.

--
dwmw2
