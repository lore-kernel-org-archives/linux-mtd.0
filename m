Received: from ihug-mail.icp-qv1-irony5.iinet.net.au ([203.59.1.199]
	helo=mail-ihug.icp-qv1-irony5.iinet.net.au)
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GKyDY-0004Qd-Hz
	for linux-mtd@lists.infradead.org; Wed, 06 Sep 2006 15:17:30 +0100
Message-ID: <44FED831.60704@redfish-group.com>
Date: Thu, 07 Sep 2006 00:16:17 +1000
From: Justin Clacherty <justin@redfish-group.com>
MIME-Version: 1.0
To: Nils Faerber <nils.faerber@kernelconcepts.de>
Subject: Re: Intel P30, locked sectors?
References: <44FED214.7090309@kernelconcepts.de>
In-Reply-To: <44FED214.7090309@kernelconcepts.de>
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
> I had hoped that the P30 chips would be supported now, but it seems they
> are not fully. How can I unlock the sectors, if that is really the issue
> here.
>   
P30 flash is supported in that it supports CFI.  You can read and write 
to it as long as it's unlocked.  CFI does not support automatic 
unlocking, it assumes if it's locked, it's locked for a reason.  The 
bootloader has to ensure that the sectors occupied by the rootfs are 
unlocked before mounting the filesystem.  We're using P30 here without 
problems.

Justin.
