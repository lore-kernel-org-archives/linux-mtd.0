Received: from avtrex.com ([216.102.217.178])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BNLJQ-0000B7-Gt
	for linux-mtd@lists.infradead.org; Tue, 11 May 2004 01:40:01 +0100
Message-ID: <40A020AB.5050101@avtrex.com>
Date: Mon, 10 May 2004 17:39:07 -0700
From: David Daney <ddaney@avtrex.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: struct mtd_info and struct mtd_info_user not compatable...
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In the current cvs sources struct mtd_info has a member called oobavail 
in the spot that mtd_info_user has ecctype.

This causes mtd_debug to print incorrect information.

David Daney.
