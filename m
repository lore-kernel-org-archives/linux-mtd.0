Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16kpDg-00071l-00
	for <linux-mtd@lists.infradead.org>; Tue, 12 Mar 2002 16:33:48 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <200203121640.g2CGeRg28441@vindaloo.ras.ucalgary.ca> 
References: <200203121640.g2CGeRg28441@vindaloo.ras.ucalgary.ca>  <200203121605.g2CG54o27683@vindaloo.ras.ucalgary.ca> <32074.1015924653@redhat.com> <6849.1015949674@redhat.com> 
To: Richard Gooch <rgooch@ras.ucalgary.ca>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Administrivia. 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 12 Mar 2002 16:45:11 +0000
Message-ID: <15927.1015951511@redhat.com>
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

rgooch@ras.ucalgary.ca said:
>  Hm. I note that formail tends to look at the From: address, which
> IMHO is the correct thing to do.

No. The From address is not the SMTP reverse-path. This message, for 
example, has a From address dwmw2@infradead.org but the SMTP reverse-path, 
to which errors should go, is dwmw2@redhat.com. (Unless it goes through 
the list, in which case the reverse-path gets changed to linux-mtd-admin@, 
so that errors in list delivery go to the list admin, not the original 
sender.)


> > At least tell us what kind of crap you've seen...  >
> http://lists.infradead.org/pipermail/linux-mtd/2002-March/004413.html

> Huh? This virus scanner is looking at the To: address?!? 

Or something equally stupid. Hence abuse@ their ISP getting CC'd on the 
complaint.


--
dwmw2
