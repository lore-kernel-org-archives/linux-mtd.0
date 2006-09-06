Received: from customer-domains.icp-qv1-irony8.iinet.net.au ([203.59.1.133])
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GKz6L-0004S5-5E
	for linux-mtd@lists.infradead.org; Wed, 06 Sep 2006 16:14:08 +0100
Message-ID: <44FEE573.5060707@redfish-group.com>
Date: Thu, 07 Sep 2006 01:12:51 +1000
From: Justin Clacherty <justin@redfish-group.com>
MIME-Version: 1.0
To: Nils Faerber <nils.faerber@kernelconcepts.de>
Subject: Re: Intel P30, locked sectors?
References: <44FED214.7090309@kernelconcepts.de>	<44FED831.60704@redfish-group.com>
	<44FED8D4.6080505@kernelconcepts.de>
In-Reply-To: <44FED8D4.6080505@kernelconcepts.de>
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
> Just in theory, can one write to a locked sector?
>   
No.
> I ask because I flashed the very same rootfs to the chip using the
> bootloader. The bootloader, which is BLOB BTW, seems to be able to write
> to the chips and the contents written also seems to be OK (since I can
> boot and mount the rootfs).
>   
Not sure how blob works, maybe it unlocks, writes, then relocks...
