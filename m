Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17mCoe-0007bX-00
	for <linux-mtd@lists.infradead.org>; Tue, 03 Sep 2002 13:29:56 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <541025071C7AC24C84E9F82296BB9B952D23@OPTEX1.optex.local> 
References: <541025071C7AC24C84E9F82296BB9B952D23@OPTEX1.optex.local> 
To: "John Hall" <John.Hall@optionexist.co.uk>
Cc: "Linux MTD list (E-mail)" <linux-mtd@lists.infradead.org>
Subject: Re: Stable cvs version for 2.4 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 03 Sep 2002 13:29:51 +0100
Message-ID: <16232.1031056191@redhat.com>
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

John.Hall@optionexist.co.uk said:
>  We're currently using ARM Linux 2.4.18-rmk7, and following the 2.4
> series of the kernel for our product that we're developing. I've been
> using cvs versions of the mtd subsystem since I've needed jffs2 on
> NAND flash, and I currently have code dating back to June. I've just
> done an update since there seem to be a lot of jffs2 changes.

The head of CVS as of yesterday (cvs up -D yesterday) should be fine. 
Don't use the stuff I committed at 1 o'clock this morning without testing it. 
That would not be advisable :)

--
dwmw2
