Received: from phoenix.infradead.org ([195.224.96.167])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 190doY-0001dz-0M
	for <linux-mtd@lists.infradead.org>; Wed, 02 Apr 2003 09:41:47 +0100
Received: from www1.indra.com ([204.144.142.3])
	by phoenix.infradead.org with esmtp (TLSv1:DES-CBC3-SHA:168)
	(Exim 4.10)
	id 1909Jn-0008OX-00
	for linux-mtd@lists.infradead.org; Tue, 01 Apr 2003 01:07:59 +0100
Message-ID: <3E88D859.6090900@embeddedminds.com>
Date: Mon, 31 Mar 2003 17:07:53 -0700
From: David Jones <david@embeddedminds.com>
MIME-Version: 1.0
To: Thayne Harbaugh <tharbaugh@lnxi.com>
References: <3E88BC6F.6080109@embeddedminds.com>
	<1049153625.25992.20.camel@tubarao>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
cc: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Re: Kernel hangs when trying to probe AM29LV160DB flash device
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


I am using a pre-packed uClinux development environment which
includes Kernel 2.4.19-uc1.  The mtd patches were already
applied so I am trying to figure out exactly what version of
mtd I have.

My understanding is that MTD is now included with the Linux kernel
source right?

David

Thayne Harbaugh wrote:
> You don't mention which kernel + patches you are using.  Lately I have
> "fixed" some device probing which is in the CVS tree - although I don't
> think this is related to the problem you are seeing.
> 

-- 
David A. Jones                  Phone:  720-971-6381
Embedded Minds Design Group     Fax:    303-926-0208
www.EmbeddedMinds.com           Email:  david@EmbeddedMinds.com
