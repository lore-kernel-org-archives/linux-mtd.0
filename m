Received: from motgate7.mot.com ([129.188.136.7])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1C3ERp-0004hi-A0
	for linux-mtd@lists.infradead.org; Fri, 03 Sep 2004 09:49:50 -0400
Received: from az33exr01.mot.com (az33exr01.mot.com [10.64.251.231])
	by motgate7.mot.com (Motorola/Motgate7) with ESMTP id i83Dh9rK008745
	for <linux-mtd@lists.infradead.org>;
	Fri, 3 Sep 2004 06:43:09 -0700 (MST)
Received: from ex-deu-munich02.force.de (ex-deu-munich02.ea.mot.com
	[10.254.2.10])
	by az33exr01.mot.com (Motorola/az33exr01) with ESMTP id i83DfkTQ031152
	for <linux-mtd@lists.infradead.org>; Fri, 3 Sep 2004 08:41:47 -0500
Message-ID: <903E17B6FF22A24C96B4E28C2C0214D7025D7FAA@sr-bng-exc01.ap.mot.com>
From: "Kodandaram, Harish" <Harish.Kodandaram@fci.com>
To: "Linux-mtd (E-mail)" <linux-mtd@lists.infradead.org>
Date: Fri, 3 Sep 2004 19:19:44 +0530 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: problem with high memory support
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello all,

I have x86 based board with 1GB RAM, a 16MB TE28F128J3C flash and  I am
implementing flash driver for the same.
If I disable CONFIG_HIGHMEM_4G option my driver works correctly. But with
CONFIG_HIGHMEM_4G option enabled i'm facing problem while mounting
filesystem. 

First I want know whether it's advised to enable CONFIG_HIGHMEM support with
1 GB RAM? If Yes, then do we have to perform any additional tasks,
especially when IO devices address high memory through PCI space.

Thanking You in advance

Regards
Harish
