Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17h68T-0005qI-00
	for <linux-mtd@lists.infradead.org>; Tue, 20 Aug 2002 11:21:17 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <007201c247e0$1022fcd0$a15f040f@SNAGGLE> 
References: <007201c247e0$1022fcd0$a15f040f@SNAGGLE> 
To: "Christopher Hoover" <ch@murgatroid.com>
Cc: "'Conn Clark'" <clark@esteem.com>,
    =?iso-8859-1?Q?'J=F6rn_Engel'?= <joern@wohnheim.fh-wedel.de>,
    "'MTD Mailing List'" <linux-mtd@lists.infradead.org>
Subject: Re: How does one mount an existing jffs2 partition so it is writeable? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 20 Aug 2002 11:21:05 +0100
Message-ID: <32719.1029838865@redhat.com>
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

ch@murgatroid.com said:
>  Do you need to unlock your flash before you can write to it?  That's
> not done automatically by mtd or jffs2.  There's a diff in the ARM
> patch system by me that might be applicable. 

I'm beginning to wonder if we should make JFFS2 unlock automatically if it 
finds at least some JFFS2 nodes. Or put in the 'is_flash_locked' method and 
make JFFS2 notice that it's locked _before_ trying to write to it, and 
print an appropriate message and mount in read-only mode so it doesn't even 
let you _try_ to write to it.

--
dwmw2
