Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Mm3cd-00039s-4B
	for linux-mtd@lists.infradead.org; Fri, 11 Sep 2009 10:44:59 +0000
Received: from epmmp2 (mailout2.samsung.com [203.254.224.25])
	by mailout1.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0KPS002ZWZ6ODJ@mailout1.samsung.com> for
	linux-mtd@lists.infradead.org; Fri, 11 Sep 2009 19:44:49 +0900 (KST)
Received: from Sarathbabu ([107.108.214.67])
	by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0KPS00HZJZ6NUR@mmp2.samsung.com> for
	linux-mtd@lists.infradead.org; Fri, 11 Sep 2009 19:44:48 +0900 (KST)
Date: Fri, 11 Sep 2009 16:13:11 +0530
From: Tadimarri Sarath Babu <sarath.babu@samsung.com>
Subject: Re: Problem with flash _info
To: Rahanesh <rahanesh@tataelxsi.co.in>, linux-mtd@lists.infradead.org
Message-id: <E8452F60DE9D4083A95641BE3B38EDA2@sisodomain.com>
Content-transfer-encoding: 7BIT
References: <4AAA230D.80603@tataelxsi.co.in>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


----- Original Message ----- 
From: "Rahanesh" <rahanesh@tataelxsi.co.in>
To: <linux-mtd@lists.infradead.org>
Sent: Friday, September 11, 2009 3:44 PM
Subject: Problem with flash _info


> Hi all,
>
> I am using flash_info command on board. i have 4 mtd devices. /dev/mtd0, /dev/mtd1, /dev/mtd2, 
> /dev/mtd3.
>
> how do i find the size of each mtd device.? I used flash_info.

  flash_info has some problem in mtd-utils. I also observed the same.
  You can try "mtd_debug" to get the size of the mtd device.
  $mtd_debug info /dev/mtd2

> But when i used that i got the following message. "Device /dev/mtd2 has 0 erase regions". It is 
> same for all the mtd devices.
>
> What might be the problem?
>
> Please help
>
> Rahanesh
> .
>
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/ 
