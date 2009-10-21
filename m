Received: from smtp-vbr17.xs4all.nl ([194.109.24.37])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1N0ULs-0006MS-6o
	for linux-mtd@lists.infradead.org; Wed, 21 Oct 2009 06:07:20 +0000
Received: from mail3.aimsys.nl (a80-127-156-242.adsl.xs4all.nl
	[80.127.156.242])
	by smtp-vbr17.xs4all.nl (8.13.8/8.13.8) with ESMTP id n9L67DLk025334
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-mtd@lists.infradead.org>;
	Wed, 21 Oct 2009 08:07:14 +0200 (CEST)
	(envelope-from nvbolhuis@aimvalley.nl)
Message-ID: <4ADEA511.4080307@aimvalley.nl>
Date: Wed, 21 Oct 2009 08:07:13 +0200
From: Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
MIME-Version: 1.0
CC: Mtd List <linux-mtd@lists.infradead.org>
Subject: Re: should/can we do ubidetach on reboot
References: <4ADDDF57.4050602@aimvalley.nl>
In-Reply-To: <4ADDDF57.4050602@aimvalley.nl>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Norbert van Bolhuis wrote:
> 
> I guess it's safe/normal to detach an MTD device from UBI before 
> rebooting ?
> 
> I'm asking because detaching is the only way to shut down the UBI
> background task (ubi_bgt0d). I do not want this task to start a flash erase
> operation or whatsoever just before the actual reboot takes place.
> 
> 
> 

Oh, I miss "[PATCH] MTD: Add UBI reboot notifier".
This solves the problem.
