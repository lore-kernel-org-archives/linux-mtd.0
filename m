Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15We6i-0002Vs-00
	for <linux-mtd@lists.infradead.org>; Tue, 14 Aug 2001 14:19:44 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <9A1957CB9FC45A4FA6F35961093ABB8403E63FB2@srvmail-mtl.ubisoft.qc.ca> 
References: <9A1957CB9FC45A4FA6F35961093ABB8403E63FB2@srvmail-mtl.ubisoft.qc.ca> 
To: Patrick Allaire <pallaire@gameloft.com>
Cc: Vipin Malik <Vipin.Malik@daniel.com>, linux-mtd@lists.infradead.org
Subject: Re: Applying MTD to 2.2.x kernel, with more info 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 14 Aug 2001 14:25:36 +0100
Message-ID: <9656.997795536@redhat.com>
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

pallaire@gameloft.com said:
>  I am not sure I understand what you are telling me ... I am currently
> compiling on 2.2.18 so I dont need the patch to call init_mtd ? So
> whot do I need to change in mtdcore.c ?

You shouldn't need to change anything in mtdcore.c.
The module_init(init_mtd) line at the end should make sure it gets 
initialised.

--
dwmw2
