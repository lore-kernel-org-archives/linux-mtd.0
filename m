Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15kJZt-0003RK-00
	for <linux-mtd@lists.infradead.org>; Fri, 21 Sep 2001 07:14:21 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3BAB1CAD.E4EDA61A@sasken.com> 
References: <3BAB1CAD.E4EDA61A@sasken.com> 
To: Ashok M Padmanaban <ashokmp@sasken.com>
Cc: MTD for Linux <linux-mtd@lists.infradead.org>,
    JFFS mailing list <jffs-dev@axis.com>
Subject: Re: paging fault while jffs2 unmount 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 21 Sep 2001 07:23:09 +0100
Message-ID: <6646.1001053389@redhat.com>
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


ashokmp@sasken.com said:
> MTD_ioctl
> Unable to handle kernel paging request at virtual address 00005401

You need to feed it through ksymoops or manually decode the offending 
addresses. 0x5401 could well be TCGETS,  although I see no reason why it 
should trying to dereference it. 

Please translate these to function names (and offsets):
> pc : [<c0143338>]    lr : [<c0143fb4>]
> Function entered at [<c014331c>] from [<c0143fb4>]
> Function entered at [<c0143be4>] from [<c0026290>]
> Function entered at [<c002625c>] from [<c00d87e8>]
> Function entered at [<c00d8744>] from [<c00585b4>]
> Function entered at [<c0058368>] from [<c001a6e0>]

--
dwmw2
