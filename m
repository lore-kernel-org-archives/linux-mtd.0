Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17XhA4-0001Bj-00
	for <linux-mtd@lists.infradead.org>; Thu, 25 Jul 2002 12:52:04 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3D3FE49D.2BED07CE@sgi.com> 
References: <3D3FE49D.2BED07CE@sgi.com> 
To: Steven Hein <ssh@sgi.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: CVS access working? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 25 Jul 2002 12:51:54 +0100
Message-ID: <24747.1027597914@redhat.com>
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
> Does anyone know if CVS access (as documented on the main linux-mtd
> page) is currently working?

T'was broke, because upgrading to Red Hat 7.3 removed the 'anoncvs' which 
I'd added to /etc/services, for the benefit of xinetd. I've fixed it now -- 
thanks.



--
dwmw2
