Received: from [212.58.137.10] (helo=trajan.ag-netcom.net)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1ACzlr-0005up-QI
	for <linux-mtd@lists.infradead.org>; Fri, 24 Oct 2003 12:06:19 +0100
Received: from 192.168.0.4 (dsl-217-155-44-202.zen.co.uk [217.155.44.202])
	h9OB6TRs004645	for <linux-mtd@lists.infradead.org>;
	Fri, 24 Oct 2003 12:06:29 +0100 (BST)
	(envelope-from david@avoncliff.com)
From: david stevenson <david@avoncliff.com>
To: linux-mtd@lists.infradead.org
Date: Fri, 24 Oct 2003 12:05:06 +0100
References: <200310232040.23006.david@avoncliff.com>
	<1066981807.29915.597.camel@hades.cambridge.redhat.com>
In-Reply-To: <1066981807.29915.597.camel@hades.cambridge.redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <200310241205.06646.david@avoncliff.com>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: Re: 2.2.18 status + jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 24 October 2003 8:50 am, David Woodhouse wrote:
> I'd be reluctant to talk to you if it was 2.4.18 you were using.
> 2.2.18 is just too old.
>
> Someone did work on backporting JFFS2 to the 2.2 kernel a couple of
> years ago. If I recall correctly, last time I asked, he'd abandoned the
> effort since it no longer made any sense to be using 2.2.
>
> Update your kernel.

OK, not the reply I had hoped for but understood.

Can I propose the documentation needs updating to this status.
In ftp.infradead.org/pub/mtd/patches a readme to say the 2.2.x is no longer 
supported. And changes to the mtd-jffs-HOWTO.txt where specific instructions 
how to use 2.2.18 are given.
David
