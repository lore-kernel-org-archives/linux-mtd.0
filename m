Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15L7Pk-0002Yg-00
	for <linux-mtd@lists.infradead.org>; Fri, 13 Jul 2001 19:11:44 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3B4F3ABA.2EFCAB42@sun.com> 
References: <3B4F3ABA.2EFCAB42@sun.com>  <3B4E5085.62422401@sun.com> <24251.995007133@redhat.com> 
To: Tim Hockin <thockin@sun.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: module names in request_module() 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 13 Jul 2001 19:17:24 +0100
Message-ID: <15106.995048244@redhat.com>
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

thockin@sun.com said:
>  So we have three options:
> 	1) rename files to match their probe names
> 	2) rename probe names to match module names
> 	3) use modules.conf to give external fixes for internal flaws
> I'm leaning towards #2.  Comments?  

Fine.

--
dwmw2
