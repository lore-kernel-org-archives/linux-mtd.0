Received: from relais.progression.net ([207.253.63.13])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18ECMB-0003bt-00
	for <linux-mtd@lists.infradead.org>; Tue, 19 Nov 2002 17:40:16 +0000
Received: from envitech.com (usrppp145.progression.net [207.253.63.145])
	by relais.progression.net (8.9.3/8.9.3) with ESMTP id NAA13836
	for <linux-mtd@lists.infradead.org>; Tue, 19 Nov 2002 13:10:41 -0500
Message-ID: <3DDA7F28.8030309@envitech.com>
Date: Tue, 19 Nov 2002 13:12:56 -0500
From: Richard Brunelle <rbrunelle@envitech.com>
Reply-To: rbrunelle@envitech.com
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: BBRAM
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi, I have a question concerning a BBRAM from ST, the M48Z512A.

I'm using the BBRAM mapped at 0xE0000 on a single board computer from 
VersaLogic. This BBRAM is pageable through access of a special register 
on the single board computer. I want to map the BBRAM as part of the 
file system.

As I understand MTD is appropriate for this purpose, am I right?

If yes, what are the options in the kernel configuration I need to 
enable to let the system access the device?

My guess is CONFIG_MTD_MTDRAM with the appropriate position set to 
0xE0000. In this case, what type of device should I see in /dev/?

Thanks.

Richard Brunelle
