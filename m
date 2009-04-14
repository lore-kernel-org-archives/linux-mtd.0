Received: from eu1sys200aog102.obsmtp.com ([207.126.144.113])
	by bombadil.infradead.org with smtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LtgXS-0002VK-6o
	for linux-mtd@lists.infradead.org; Tue, 14 Apr 2009 11:11:09 +0000
Received: from zeta.dmz-eu.st.com (ns2.st.com [164.129.230.9])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B80B8DA78
	for <linux-mtd@lists.infradead.org>;
	Tue, 14 Apr 2009 11:09:35 +0000 (GMT)
Received: from mail1.dlh.st.com (mail1.dlh.st.com [10.199.8.21])
	by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B58894C286
	for <linux-mtd@lists.infradead.org>;
	Tue, 14 Apr 2009 11:10:44 +0000 (GMT)
Message-ID: <49E46F86.8070301@st.com>
Date: Tue, 14 Apr 2009 16:42:06 +0530
From: Vaibhav AGARWAL <vaibhav.agarwal@st.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Size of Samsung NAND id 0xD5 in nand_flash_ids[]
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I m using Samsung K9WBG08U1M NAND. And after looking at Samsung's 
product decoder sheet, I can decode it's size as 4GiB. However, on 
matching it's signature id i.e. 0xD5 in 'nand_flash_ids[]' table, I can 
see it's size defined to be 2GiB by mtd framework. Is there any specific 
reason for doing so?

Regards,
Vaibhav.
