Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1616yd-00081g-00
	for <linux-mtd@lists.infradead.org>; Tue, 06 Nov 2001 14:13:19 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3BE7ED58.EEB937BA@iese.fhg.de> 
References: <3BE7ED58.EEB937BA@iese.fhg.de> 
To: Alexander Kubicki <kubicki@iese.fhg.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: PCMCIA linear Flash (5V read/write) 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 06 Nov 2001 14:22:29 +0000
Message-ID: <22539.1005056549@redhat.com>
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

PCMCIA cards aren't yet supported by the Linux MTD code, they're still 
driven by the original PCMCIA flash code. It shouldn't be too difficult for 
you to make a proper MTD driver, and then you ought to be able to use 
PCMCIA flash just like any other flash devices.

--
dwmw2
