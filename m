Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15lzcH-0005Nw-00
	for <linux-mtd@lists.infradead.org>; Tue, 25 Sep 2001 22:19:45 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20010925142549.A22356@recycle.lbl.gov> 
References: <20010925142549.A22356@recycle.lbl.gov>  <20010925134029.A22314@recycle.lbl.gov> <24339.1001451631@redhat.com> 
To: Larry Doolittle <ldoolitt@recycle.lbl.gov>
Cc: linux-mtd@lists.infradead.org
Subject: Re: problems with 28F320B still 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 25 Sep 2001 22:28:48 +0100
Message-ID: <25195.1001453328@redhat.com>
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

Ideally, this would be done by implementing a new probe routine which can 
detect these chips, make up a fake CFI structure, and pass control to the 
normal cfi_cmdset_000x back end. 

Alternatively, a patch was posted to the mailing list recently which 
contained a standalone driver for these chips alone. 

--
dwmw2
