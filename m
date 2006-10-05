Received: from 208.101.48.4-static.reverse.softlayer.com ([208.101.48.4]
	helo=chtn01.999servers.com)
	by pentafluge.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GVW8p-0001N8-O1
	for linux-mtd@lists.infradead.org; Thu, 05 Oct 2006 17:32:12 +0100
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <17701.14724.377713.929566@vaishnavi.localdomain>
Date: Thu, 5 Oct 2006 22:27:40 +0530
To: linux-mtd@lists.infradead.org
Subject: [PATCH 0/2] NAND: nandsim sector-wise allocation
From: Vijay Kumar <vijaykumar@bravegnu.org>
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The present nandsim allocates memory equal to the size of the NAND
flash during initialization in one shot. Thus it is impossible to
simulate a 256MB NAND flash on a system with 128MB RAM. 

For most testing purposes, only a part of the the NAND memory
allocated in the simulator is used. This patch set modifies the
simulator so as to allocate a NAND page when it is written to, and
deallocates the page when it is erased. With this it is possible to
simulate large NAND flash devices on computers with less RAM.

Regards,
Vijay

-- 
Free the Code, Free the User.
Website: http://www.bravegnu.org
