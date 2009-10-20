Received: from smtp-vbr13.xs4all.nl ([194.109.24.33])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1N0HBT-0003hz-EP
	for linux-mtd@lists.infradead.org; Tue, 20 Oct 2009 16:03:43 +0000
Received: from mail3.aimsys.nl (a80-127-156-242.adsl.xs4all.nl
	[80.127.156.242])
	by smtp-vbr13.xs4all.nl (8.13.8/8.13.8) with ESMTP id n9KG3axu086849
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-mtd@lists.infradead.org>;
	Tue, 20 Oct 2009 18:03:36 +0200 (CEST)
	(envelope-from nvbolhuis@aimvalley.nl)
Message-ID: <4ADDDF57.4050602@aimvalley.nl>
Date: Tue, 20 Oct 2009 18:03:35 +0200
From: Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
MIME-Version: 1.0
To: Mtd List <linux-mtd@lists.infradead.org>
Subject: should/can we do ubidetach on reboot
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


I guess it's safe/normal to detach an MTD device from UBI before rebooting ?

I'm asking because detaching is the only way to shut down the UBI
background task (ubi_bgt0d). I do not want this task to start a flash erase
operation or whatsoever just before the actual reboot takes place.
