Received: from sp604001mt.neufgp.fr ([84.96.92.60] helo=Smtp.neuf.fr)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HLxRK-0001Az-Gr
	for linux-mtd@lists.infradead.org; Tue, 27 Feb 2007 03:12:07 -0500
Received: from [172.20.2.179] ([88.138.62.111]) by sp604001mt.gpm.neuf.ld
	(Sun Java System Messaging Server 6.2-5.05 (built Feb 16 2006))
	with ESMTP id <0JE400JU93XAFQ00@sp604001mt.gpm.neuf.ld> for
	linux-mtd@lists.infradead.org; Tue, 27 Feb 2007 09:07:59 +0100 (CET)
Date: Tue, 27 Feb 2007 09:07:47 +0100
From: Matthieu CASTET <matthieu.castet@parrot.fr>
Subject: Re: Maturity of JFFS2 + MTD NAND Flash Support?
In-reply-to: <1172528274.3560.5.camel@shinybook.infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
Message-id: <45E3E6D3.8090701@parrot.fr>
MIME-version: 1.0
Content-type: text/plain; charset=ISO-8859-1; format=flowed
Content-transfer-encoding: 8BIT
References: <B1EDF20A6EAAD74EA65E46F774F17845E9329B@orsmsx413.amr.corp.intel.com>
	<1172528274.3560.5.camel@shinybook.infradead.org>
Cc: linux-mtd@lists.infradead.org, "Johnson,
	Charles F" <charles.f.johnson@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse a écrit :
> On Mon, 2007-02-26 at 12:07 -0800, Johnson, Charles F wrote:
>> I've been browsing the mailing list archives and trying to determine
>> maturity of JFFS2 + MTD NAND Flash support.  Particularlly with the
>> latest 2.6.x Linux kernels.  (I think 2.6.x is the only kernel where
>> NAND is supported, correct ?) 
> 
> Effectively, yes.

AFAIK, jffs2 doesn't handle correctly bit flip on read : it won't try to 
  copy the data on another block while the data can still be recovered 
by ecc.

I believe it could be a big issue for commercial product where no 
corruption should happen.


Matthieu
