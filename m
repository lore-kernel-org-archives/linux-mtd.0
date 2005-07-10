Received: from e31.co.us.ibm.com ([32.97.110.129])
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1DrdZp-0003x0-IK
	for linux-mtd@lists.infradead.org; Sun, 10 Jul 2005 11:18:48 -0400
Received: from westrelay02.boulder.ibm.com (westrelay02.boulder.ibm.com
	[9.17.195.11])
	by e31.co.us.ibm.com (8.12.10/8.12.9) with ESMTP id j6AFIaeL094478
	for <linux-mtd@lists.infradead.org>; Sun, 10 Jul 2005 11:18:36 -0400
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by westrelay02.boulder.ibm.com (8.12.10/NCO/VER6.6) with ESMTP id
	j6AFIa2D409878
	for <linux-mtd@lists.infradead.org>; Sun, 10 Jul 2005 09:18:36 -0600
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.12.11/8.13.3) with ESMTP id
	j6AFIari020559
	for <linux-mtd@lists.infradead.org>; Sun, 10 Jul 2005 09:18:36 -0600
From: Josh Boyer <jdub@us.ibm.com>
To: HS8JCV <hs8jcv@gmail.com>
In-Reply-To: <7febb0a105070915119abbc0c@mail.gmail.com>
References: <7febb0a105070915119abbc0c@mail.gmail.com>
Content-Type: text/plain
Date: Sun, 10 Jul 2005 10:18:30 -0500
Message-Id: <1121008710.23030.5.camel@windu.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: How to config file for jffs2.?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2005-07-10 at 05:11 +0700, HS8JCV wrote:
> Hi all
> Now.
> I have at91rm9200dk board.
> This board have SDRAM 32 MByte and Nor Flash 4 Mbyte(SST39VF32010).
> I port kernel 2.4.27-vrs1.
> I will save data to nor flash on board.
> I know. I should be use jffs2.
> But.I never use it.
> Please suggest me for use it.
> 
> How many files in kernel source code(linux-2.4.27-vrs1) for config it.?
> Which files for config it?

Do you have MTD configured in your kernel?  If not you'll need enable
that first.  Then an option for JFFS2 will be present (CONFIG_JFFS2_FS).

But you'll need either a board map driver or to use the physmap device
driver so that the flash is mapped to an MTD device.

josh
