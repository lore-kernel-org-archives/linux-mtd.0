Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15o0fX-0008HE-00
	for <linux-mtd@lists.infradead.org>; Mon, 01 Oct 2001 11:51:28 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.33.0110011244210.527-100000@lisa.rhpk.springfield.inwind.it> 
References: <Pine.LNX.4.33.0110011244210.527-100000@lisa.rhpk.springfield.inwind.it> 
To: Cristiano Paris <c.paris@libero.it>
Cc: linux-mtd@lists.infradead.org
Subject: Re: MTD newbie 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 01 Oct 2001 12:00:29 +0100
Message-ID: <952.1001934029@redhat.com>
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

c.paris@libero.it said:
>  I'm wondering if something like /dev/loop or /dev/ram can be used. At
> first I decided to write an MTD interface to a virtual MTD device, but
> I don't want to re-invent the wheel. Is anything like this out there ?
> 

CONFIG_MTD_MTDRAM

--
dwmw2
