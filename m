Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14vpqH-0003VH-00
	for <linux-mtd@lists.infradead.org>; Sat, 05 May 2001 01:22:37 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <NEBBIDMHCLDPHDHEGDMLOEGKCBAA.jasonw@uswo.net> 
References: <NEBBIDMHCLDPHDHEGDMLOEGKCBAA.jasonw@uswo.net> 
To: "Jason Walker" <jasonw@uswo.net>
Cc: "MTD Mailing List" <linux-mtd@lists.infradead.org>
Subject: Re: MTD and 2.4 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sat, 05 May 2001 01:23:00 +0100
Message-ID: <32275.989022180@redhat.com>
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
> request_module[block-major-100]: root fs not mounted cannot open root
> device 6401 blah blah blah 

Quite why someone felt it necessary to register block major 100 for the 
strangely named 'fla' device, when there was already a perfectly usable 
major assigned for NFTL, I have no idea.

Switching your root device to /dev/nftla1 should fix it.

--
dwmw2
