Received: from imladris.infradead.org
	([194.205.184.45] helo=infradead.org ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14uGAC-0002Yd-00
	for <linux-mtd@lists.infradead.org>; Mon, 30 Apr 2001 17:04:41 +0100
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14uG9W-0000A1-00
	for mtd-list@infradead.org; Mon, 30 Apr 2001 17:03:58 +0100
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14uG9U-00009u-00
	for mtd@infradead.org; Mon, 30 Apr 2001 17:03:57 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <NEBBIDMHCLDPHDHEGDMLGEFCCBAA.jasonw@uswo.net> 
References: <NEBBIDMHCLDPHDHEGDMLGEFCCBAA.jasonw@uswo.net> 
To: "Jason Walker" <jasonw@uswo.net>
Cc: "MTD Mailing List" <mtd@infradead.org>
Subject: Re: MTD and 2.4 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 30 Apr 2001 17:03:45 +0100
Message-ID: <2834.988646625@redhat.com>
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

jasonw@uswo.net said:
> This is a DiskOnChip Millenium chip, btw.  If I need to post error
> messages or my kernel config, that is fine.. Any help would be
> appreciated. thank! 

Enable the #define DOC_SINGLE_DRIVER in docprobe.c and make sure you've 
enabled CONFIG_MTD_DOC2001. If it still doesn't work, show us the startup 
messages.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
