Received: from moutvdom00.kundenserver.de ([195.20.224.149])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17AWLT-0007tV-00
	for <linux-mtd@lists.infradead.org>; Wed, 22 May 2002 14:40:04 +0100
Received: from [172.19.20.62] (helo=mrvdomng1.kundenserver.de)
	by moutvdom00.kundenserver.de with esmtp (Exim 2.12 #3)
	id 17AWLS-0004bO-00
	for linux-mtd@lists.infradead.org; Wed, 22 May 2002 15:40:02 +0200
Received: from [217.81.53.57] (helo=comm.esd-electronics.com)
	by mrvdomng1.kundenserver.de with esmtp (Exim 3.22 #2)
	id 17AWLR-0004Gd-00
	for linux-mtd@lists.infradead.org; Wed, 22 May 2002 15:40:02 +0200
From: "Stefan Roese" <stefan.roese@esd-electronics.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: <linux-mtd@lists.infradead.org>
Subject: Re: SST Flash Support (SST39VF160) 
Date: Wed, 22 May 2002 15:35:33 +0200
Message-ID: <EFEAIMDCOOOHIEPHDNFJCEMIDPAA.stefan.roese@esd-electronics.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <27222.1022057542@redhat.com>
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

> > This does not seem to be CFI compliant!!!
>
> OK. Add the device ID and size information to jedec_probe.c. That code
> should handle the 55/aa bits already.

OK, I added the defines in jedec_probe.c, but I can't get linux to use the
"jedec_probe_chip()" routine. Even with further debug code, this routine
doesn't seem to get called :-(.

Any ideas?

Best regards,
Stefan.
