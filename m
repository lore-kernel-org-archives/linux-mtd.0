Received: from eu1sys200aog109.obsmtp.com ([207.126.144.127])
	by bombadil.infradead.org with smtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O9AoC-0006mb-NS
	for linux-mtd@lists.infradead.org; Tue, 04 May 2010 05:36:41 +0000
Received: from zeta.dmz-eu.st.com (ns2.st.com [164.129.230.9])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E1AC2E5
	for <linux-mtd@lists.infradead.org>;
	Tue,  4 May 2010 05:36:33 +0000 (GMT)
Received: from mail2.dlh.st.com (mail2.dlh.st.com [10.199.8.22])
	by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C3EC51449
	for <linux-mtd@lists.infradead.org>;
	Tue,  4 May 2010 05:36:32 +0000 (GMT)
Message-ID: <4BDFB25F.8050305@st.com>
Date: Tue, 04 May 2010 11:06:31 +0530
From: Shiraz HASHIM <shiraz.hashim@st.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [Query] Serial Memory Interface Controller interface
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I am working on ST's SMI controller for Serial NOR flashes. This controller is a
special controller build specifically for serial memories (spi based).
It has certain features directly catering to serial memories such as mapping of
memory directly on the bus so that it can be directly accessed/addressed.

Now the problem is that this controller cannot be exactly mapped in to SPI
framework due to its features. What should be the best approach

1. To write serial nor flash drivers accessing smi controller (instead of SPI
framework APIs)
2. To use some tricks and fit SMI controller into SPI framework itself.

thanks for help

regards
Shiraz
