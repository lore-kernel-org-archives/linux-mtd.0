Received: from [213.86.99.237] (helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18dVaN-0003xQ-00
	for <linux-mtd@lists.infradead.org>; Tue, 28 Jan 2003 13:15:31 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20030128132344.GA7618@wohnheim.fh-wedel.de> 
References: <20030128132344.GA7618@wohnheim.fh-wedel.de>  <200301280956.04411.phil@river-bank.demon.co.uk> <1043752216.30159.2.camel@henrik.marasystems.com> <200301281235.27066.phil@river-bank.demon.co.uk> 
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
Cc: Phil Thompson <phil@river-bank.demon.co.uk>,
    Henrik Nordstrom <hno@marasystems.com>,
    linux-mtd@lists.infradead.org
Subject: Re: JFFS2 Format Documentation? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 28 Jan 2003 13:44:46 +0000
Message-ID: <9649.1043761486@passion.cambridge.redhat.com>
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

phil@river-bank.demon.co.uk said:
> David's paper is a good start but I was after a lower level of detail.
> I need  something from which I can implement a JFFS2 reader from
> scratch (ie. without  any GPL code). 

The on-medium format is very simple. The actual layout of the existing node 
types is detailed in full in include/linux/jffs2.h. In conjunction with the 
theory of operation described in the paper, these should be perfectly 
sufficient.

What exactly are you trying to achieve? Simple read-only operation or a 
fully-functional compatible file system?

--
dwmw2
