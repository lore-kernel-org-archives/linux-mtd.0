Received: from dsl-210-15-203-90-static.qld.netspace.net.au ([210.15.203.90]
	helo=mars.redfish-group.com)
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GJBGx-00033w-3m
	for linux-mtd@lists.infradead.org; Fri, 01 Sep 2006 16:49:38 +0100
Message-ID: <44F85663.7090401@redfish-group.com>
Date: Sat, 02 Sep 2006 01:48:51 +1000
From: Justin Clacherty <justin@redfish-group.com>
MIME-Version: 1.0
To: Nils Faerber <nils.faerber@kernelconcepts.de>
Subject: Re: Problem with strata flash in 2 x 16bit config
References: <44F81C58.1030203@kernelconcepts.de>
In-Reply-To: <44F81C58.1030203@kernelconcepts.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Nils Faerber wrote:
> Node CRC 00800080 != calculated CRC 4bf2ff8d for node at 000d4704
> -sh: dmesg: Input/output error
Is it P30 flash?  I've seen something similar if you don't unlock the flash.

Justin.
