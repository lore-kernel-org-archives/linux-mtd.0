Received: from s018.panelboxmanager.com ([72.55.186.38])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LKjfy-0000fD-2O
	for linux-mtd@lists.infradead.org; Thu, 08 Jan 2009 01:27:10 +0000
Received: from [24.139.16.154] (helo=[192.168.42.37])
	by s018.panelboxmanager.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.69) (envelope-from <lists@logicaloutcome.ca>)
	id 1LKjfx-0001fZ-63
	for linux-mtd@lists.infradead.org; Wed, 07 Jan 2009 20:27:09 -0500
Message-Id: <CCD96CEE-EA39-4B40-A26E-3B5ADE8B9802@logicaloutcome.ca>
From: Glenn Henshaw <lists@logicaloutcome.ca>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (Apple Message framework v930.3)
Subject: DQ5 Checks in mtd drivers
Date: Wed, 7 Jan 2009 20:25:47 -0500
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

  I have just managed to update a system from an older 2.4 kernel to  
the most recent 2.4.34.5-uc0 version. It looks like there were some  
checks added to the AMD FLASH drivers that totally break SST FLASH  
devices.

  1) Where is the best place to complain? Was the old functionality  
hidden somewhere?
  2) Where is the best place to submit the patch to support SST  
39VF320x and 39VF640x devices?

   ... Glenn

-- 
Glenn Henshaw                     Logical Outcome Ltd.
e: lists@logicaloutcome.ca     w: www.logicaloutcome.ca
