Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 189SLl-0003EF-00
	for <linux-mtd@lists.infradead.org>; Wed, 06 Nov 2002 15:44:13 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <F4608F665DF5D311B231009027B70F700131E269@MAIL> 
References: <F4608F665DF5D311B231009027B70F700131E269@MAIL> 
To: Junping Zhang <JZhang@erinc.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: seeking help on JFFS2 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 06 Nov 2002 16:14:31 +0000
Message-ID: <4556.1036599271@passion.cambridge.redhat.com>
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

JZhang@erinc.com said:
> 0xc00e0008 is in do_read_onechip (cfi_cmdset_0001.c:473).
> 473         if (!(((struct cfi_pri_intelext*)cfi->cmdset_priv)->FeatureSupport & 2))

Why didn't you say so before? :)

cvs up


--
dwmw2
