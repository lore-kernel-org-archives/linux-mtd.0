Received: from patan.sun.com ([192.18.98.43])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15LDhm-0002us-00
	for <linux-mtd@lists.infradead.org>; Sat, 14 Jul 2001 01:54:46 +0100
Message-ID: <3B4F9B50.5DFAB105@sun.com>
Date: Fri, 13 Jul 2001 18:07:28 -0700
From: Tim Hockin <thockin@sun.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: linux-mtd@lists.infradead.org
Subject: Re: module names in request_module()
References: <3B4F3ABA.2EFCAB42@sun.com>  <3B4E5085.62422401@sun.com> <24251.995007133@redhat.com> <15106.995048244@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

David Woodhouse wrote:
> 
> thockin@sun.com said:
> >  So we have three options:
> >       1) rename files to match their probe names
> >       2) rename probe names to match module names
> >       3) use modules.conf to give external fixes for internal flaws
> > I'm leaning towards #2.  Comments?
> 
> Fine.

in CVS now.  Will this be propogated to 2.4.7 or should I send it to Linus
also?

-- 
Tim Hockin
Systems Software Engineer
Sun Microsystems, Cobalt Server Appliances
thockin@sun.com
