Received: from dsl-210-15-203-90-static.qld.netspace.net.au ([210.15.203.90]
	helo=mars.redfish-group.com)
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GJzbQ-0006ey-M3
	for linux-mtd@lists.infradead.org; Sun, 03 Sep 2006 22:34:06 +0100
Message-ID: <44FB4A1F.4040806@redfish-group.com>
Date: Mon, 04 Sep 2006 07:33:19 +1000
From: Justin Clacherty <justin@redfish-group.com>
MIME-Version: 1.0
To: Nils Faerber <nils.faerber@kernelconcepts.de>
Subject: Re: Problem with strata flash in 2 x 16bit config
References: <44F81C58.1030203@kernelconcepts.de>
	<44F85663.7090401@redfish-group.com>
	<44FB3931.6040605@kernelconcepts.de>
In-Reply-To: <44FB3931.6040605@kernelconcepts.de>
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
> But I would expect that BLOB has already unlocked the complete 16MB for
> writing the image.
>   
Not sure how blob works with this, I'm using u-boot.
> And even if some are still locked, how do I unlock them?
>   
This would need to be done in blob so that it's available to the kernel 
for mounting.

When I get in to work this morning I'll try mounting flash with it 
locked to see if that is the error I was receiving.

Justin.
