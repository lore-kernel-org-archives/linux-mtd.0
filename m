Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Xlai-0001f1-00
	for <linux-mtd@lists.infradead.org>; Thu, 25 Jul 2002 17:35:52 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3D401D1E.2DD54BF@sgi.com> 
References: <3D401D1E.2DD54BF@sgi.com>  <20020725131457.GA19796@wohnheim.fh-wedel.de> <3D3FEE24.49D26D61@sgi.com> <600.1027603720@redhat.com> 
To: Steven Hein <ssh@sgi.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Integrating new MTD/jffs2 into 2.4.18 kernel 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 25 Jul 2002 17:35:49 +0100
Message-ID: <17917.1027614949@redhat.com>
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

ssh@sgi.com said:
>  5) in linux/fs/jffs2/file.c, there is a reference to PageUptodate()
>    that must be changed to Page_Uptodate()   (looks like this syntax
>    changed from 2.4 to 2.5 kernel....) 

Copy CVS:mtd/include/linux/mtd/compatmac.h to linux/include/mtd/compatmac.h


--
dwmw2
