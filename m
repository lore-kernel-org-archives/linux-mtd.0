Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18YRzv-00013N-00
	for <linux-mtd@lists.infradead.org>; Tue, 14 Jan 2003 14:25:00 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <000201c2bb7e$ff1e89a0$80d1a8c0@synso.com.tw> 
References: <000201c2bb7e$ff1e89a0$80d1a8c0@synso.com.tw> 
To: "Steve Tsai" <startec@ms11.hinet.net>
Cc: "Linux MTD mailing list" <linux-mtd@lists.infradead.org>
Subject: Re: Display Unchecked space... 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 14 Jan 2003 14:55:18 +0000
Message-ID: <14587.1042556118@passion.cambridge.redhat.com>
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

startec@ms11.hinet.net said:
> kernel BUG at gc.c:136! Checked all inodes but still 0x6a0 bytes of
> unchecked space?

We think this is fixed. cvs up and try again.

--
dwmw2
