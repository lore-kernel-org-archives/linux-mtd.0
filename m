Received: from [213.86.99.237] (helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18dY59-0004X9-00
	for <linux-mtd@lists.infradead.org>; Tue, 28 Jan 2003 15:55:27 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1043770425.5203.8.camel@henrik.marasystems.com> 
References: <1043770425.5203.8.camel@henrik.marasystems.com>  <20030128132344.GA7618@wohnheim.fh-wedel.de> <200301281235.27066.phil@river-bank.demon.co.uk> <9649.1043761486@passion.cambridge.redhat.com> <200301281411.46041.phil@river-bank.demon.co.uk> 
To: Henrik Nordstrom <hno@marasystems.com>
Cc: Phil Thompson <phil@river-bank.demon.co.uk>,
    linux-mtd@lists.infradead.org
Subject: Re: JFFS2 Format Documentation? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 28 Jan 2003 16:26:02 +0000
Message-ID: <24442.1043771162@passion.cambridge.redhat.com>
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

hno@marasystems.com said:
>  Another idea: You could do a two stage boot loader process.. the
> (non-GPL) bootloader just loads another bootloader which knows how to
> read JFFS2, or replace the bootloader entirely.. 

FWIW the eCos (and hence RedBoot) JFFS2 code was updated very recently, all 
that's preventing RedBoot from reading and writing JFFS2 file systems is 
the lack of a small wrapper to actually _ask_ it to mount/read/write from 
the RedBoot prompt. 

--
dwmw2
