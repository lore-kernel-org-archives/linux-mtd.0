Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16s9Rk-0001x7-00
	for <linux-mtd@lists.infradead.org>; Mon, 01 Apr 2002 22:34:36 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <000501c1d996$da814030$87657bc8@athlon> 
References: <000501c1d996$da814030$87657bc8@athlon> 
To: "Derek Ross" <dross@iders.ca>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Can JFFS be placed in middle of flash? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 01 Apr 2002 22:34:15 +0100
Message-ID: <30861.1017696855@redhat.com>
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

dross@iders.ca said:
> Can a JFFS file system be placed in the middle area of flash? (We will
> be using the beginning and end areas for other things). 

Yes, we do it all the time. Look at the partitioning stuff in most of the 
'map' drivers.

--
dwmw2
