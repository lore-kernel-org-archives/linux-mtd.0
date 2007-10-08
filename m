Received: from smtp.nokia.com ([131.228.20.171] helo=mgw-ext12.nokia.com)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IenQ7-00086P-H9
	for linux-mtd@lists.infradead.org; Mon, 08 Oct 2007 08:52:59 +0100
Message-ID: <4709DF8E.1030707@nokia.com>
Date: Mon, 08 Oct 2007 10:43:10 +0300
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: dwmw2@infradead.org
Subject: JFFS2 deadlock in erase callback
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "Bityutskiy Artem \(Nokia-M/Helsinki\)" <Artem.Bityutskiy@nokia.com>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

We were planning to revert the following:

    commit d364fb18cd991734eb54aa8840e70030b0c9f699
    Author: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
    Date:   Wed Jun 27 01:24:09 2007 +0200

       [JFFS2] Reduce time for which erase_free_sem is held during erase.
    
       With current desing erase_free_sem is locked every time the flash
       block is being erased. For NOR flashes - ~1 second is needed to erase
       single flash block. In the worst case scenario erase_free_sem may be
       locked for a couple of seconds when the number of blocks is being
       erased (e.g. after large file was removed). When erase_free_sem is
       locked all read/write operations for given JFFS2 partition are locked
       too - in effect from time to time access to the JFFS2 partition is
       locked for a number of seconds. This fix makes critical section in
       flash erasing procedure shorter - now erase_free_sem is locked around
       erase_completion_lock spinlock only.
    
       Originally from Radoslaw Bisewski
       Signed-off-by: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
       Signed-off-by: David Woodhouse <dwmw2@infradead.org>


because of the deadlock it caused via the erase callback.  Artem, who is away, said you were against moving the callback, but I see you have now done that with the following patch:

    commit 49defc015ff58fda46a3afa3462dfdfa69bc8401
    Author: David Woodhouse <dwmw2@infradead.org>
    Date:   Sat Oct 6 15:01:59 2007 -0400

        [MTD] [NAND] Avoid deadlock in erase callback; release chip lock first.
    
        When the erase callback performs some other action on the flash, it's
        highly likely to deadlock unless we actually release the chip lock
        before calling it.
    
        Signed-off-by: David Woodhouse <dwmw2@infradead.org>


Can you confirm, that adding the "Avoid deadlock..." patch is better than reverting "Reduce time..." patch.

Note the "Avoid deadlock..." change is needed for OneNAND also.


Regards
Adrian Hunter
