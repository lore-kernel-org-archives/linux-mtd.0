Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16MXM4-0003eJ-00
	for <linux-mtd@lists.infradead.org>; Fri, 04 Jan 2002 16:38:04 +0000
From: David Woodhouse <dwmw2@cambridge.redhat.com>
In-Reply-To: <GEECJDDEGDDOOCPHBELJAELHCDAA.dominic.ostrowski@3glab.com> 
References: <GEECJDDEGDDOOCPHBELJAELHCDAA.dominic.ostrowski@3glab.com> 
To: "Dominic Jan Ostrowski" <dominic.ostrowski@3glab.com>
Cc: linux-mtd@lists.infradead.org, jffs-dev@axis.com
Subject: Re: eCos port JFFS2 for Compaq Ipaq 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 04 Jan 2002 16:48:58 +0000
Message-ID: <11131.1010162938@redhat.com>
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

dominic.ostrowski@3glab.com said:
> Available from www.3glab.org
> eCos port of JFFS2 for Compaq Ipaq 

Excellent work - thanks.

>  This package is in an early stage of development and, although
> functional, has siginificant limitations - particularly in regard to
> garbage collection. 

I'll take a look and see if I can work out what's wrong with the GC, and see
what I can do to rearrange some of the JFFS2 code to be more portable (as it
should really have been in the first place), so we can start to merge this 
cleanly.

--
dwmw2
