Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1585u6-0007uh-00
	for <linux-mtd@lists.infradead.org>; Thu, 07 Jun 2001 20:57:14 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <991934470.27485.0.camel@timmy> 
References: <991934470.27485.0.camel@timmy>  <20010607114319.A23641@crystal.2d3d.co.za> <20010607110359.A22278@crystal.2d3d.co.za> <19468.991906514@redhat.com> <23825.991907052@redhat.com> 
To: Russ Dill <Russ.Dill@asu.edu>
Cc: MTD for Linux <linux-mtd@lists.infradead.org>
Subject: Re: HELP 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 07 Jun 2001 21:01:21 +0100
Message-ID: <9968.991944081@redhat.com>
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

Russ.Dill@asu.edu said:
> . However, some drivers *cough*jffs2*cough* will make unaligned reads
> from time to time, but only rarely. In this case, the handler speeds
> things up by doing the access, instead of producing an oops. 

Actually JFFS2 does it quite a lot. I added a byte to the dirent structure 
which means the names get unaligned.

--
dwmw2
