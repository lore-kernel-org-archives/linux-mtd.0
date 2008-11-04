Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by casper.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1KxHMU-0004Bx-P5
	for linux-mtd@lists.infradead.org; Tue, 04 Nov 2008 08:34:09 +0000
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KxHJO-0007pE-NG
	for linux-mtd@lists.infradead.org; Tue, 04 Nov 2008 08:30:54 +0000
Received: from 194.95.133.35 ([194.95.133.35])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 04 Nov 2008 08:30:54 +0000
Received: from andre.puschmann by 194.95.133.35 with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 04 Nov 2008 08:30:54 +0000
To: linux-mtd@lists.infradead.org
From: Andre Puschmann <andre.puschmann@imms.de>
Subject: Re: flash read performance
Date: Tue, 04 Nov 2008 09:30:44 +0100
Message-ID: <gep17l$qts$1@ger.gmane.org>
References: <ge6old$oo3$1@ger.gmane.org>	<20081029114256.GA2239@yoda.jdub.homelinux.org>	<gea0sh$j97$1@ger.gmane.org>	<49097176.5010506@thomson.net>	<gec051$efd$1@ger.gmane.org>	<49098716.1010404@thomson.net>
	<490F096D.5060208@imms.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
In-Reply-To: <490F096D.5060208@imms.de>
Sender: news <news@ger.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Andre Puschmann schrieb:
> Unfortunately, it uses a legacy driver which only does a
> ioremap() but no ioremap_nocache().

Sorry, there was a typo in this statement.
It should be ioremap_cached().


Regards,
Andre
