Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17HX9k-0006yx-00
	for <linux-mtd@lists.infradead.org>; Mon, 10 Jun 2002 22:56:56 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1023727479.20089.26.camel@geb> 
References: <1023727479.20089.26.camel@geb> 
To: Chris AtLee <catlee@canada.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2 on 2.2.18 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 10 Jun 2002 22:56:40 +0100
Message-ID: <4337.1023746200@redhat.com>
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

catlee@canada.com said:
> I've had some success getting MTD and JFFS (v1) working on my 2.2.18
> system.  I've been trying over the past few weeks to get JFFS2 up and
> running.  I've got it to the point where the kernel can read a jffs2
> partition, but I really have no idea how to get writing to work.  The
> mechanism for writing seems completely different in 2.2.x than in
> 2.4.x

> Any pointers?  Is anyone else working on this? 

I know of nobody else working on a 2.2 backport. Worst case, you should be 
able to ditch the page-based write code and call jffs2_write_file_range() 
from a jffs2_file_write() which you provide instead of 
generic_file_write(), surely?

--
dwmw2
