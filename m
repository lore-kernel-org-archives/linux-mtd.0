Received: from ext-proxy-2.ftel.co.uk ([192.65.220.98])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Aqw7X-0001Ah-Ho
	for linux-mtd@lists.infradead.org; Wed, 11 Feb 2004 15:17:47 +0000
Received: from utility-2.ftel.co.uk (utility-2.ftel.co.uk [193.112.172.11])
	(8.12.10/8.12.9/Revision:1.91/relay-in/ssl/db) with ESMTP id
	i1BFHPMu015744
	for <linux-mtd@lists.infradead.org>; Wed, 11 Feb 2004 15:17:25 GMT
Received: from mesias.co.uk (melete.ftel.co.uk [172.16.3.21])
	ESMTP id i1BFHJEp014716
	for <linux-mtd@lists.infradead.org>; Wed, 11 Feb 2004 15:17:19 GMT
Message-ID: <402A477D.3020701@mesias.co.uk>
Date: Wed, 11 Feb 2004 15:17:17 +0000
From: Cam <camilo@mesias.co.uk>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Intel 28F640 cfi_cmdset_0001 chip is FL_STATUS after MTD_close
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I hope I have the right list for this question.

I'm looking into a problem with some Intel 28F640 flash on a powerPC 
board. I find that the cfi_cmdset_0001 code leaves the flash in the 
FL_STATUS state after MTD_close. The chips remain in this state which 
leaves the memory unreadable.

I would have expected the flash to be left in the read array state when 
not in use.

I think the chip status in the driver and that in the chip is in sync, 
ie. the driver is deliberately leaving the chip in this state.

I found a previous reference to a similar problem:

http://lists.infradead.org/pipermail/linux-mtd/2001-November/003603.html

The problem described there is more serious in that the chip and the 
driver seem to get out of step with regards to the FL_STATUS state.

Is there a reason why the chip is not left in the read array state after 
an MTD_close? My first thought is to modify cfi_intelext_sync, called by 
MTD_close so that the chip is left in the read array state after the 
sync command, but being a newcomer to this code I might be missing 
something important.

Comments?

-Cam
-- 
camilo@mesias.co.uk                                                 <--
