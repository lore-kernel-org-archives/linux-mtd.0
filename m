Received: from smtpoutuk02.marconi.com ([128.87.251.113])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Dhl3M-0005I5-Gv
	for linux-mtd@lists.infradead.org; Mon, 13 Jun 2005 05:16:21 -0400
Received: from cvsumailhost.marconicomms.com ([89.1.21.77])
	by smtpoutuk02.marconi.com (8.12.11/8.12.11) with ESMTP id
	j5D9GBXw007653
	for <linux-mtd@lists.infradead.org>; Mon, 13 Jun 2005 10:16:13 +0100
	(envelope-from Andreas.Engel@marconi.com)
Received: from oxia.de.marconicomms.com (oxia.de.marconicomms.com
	[172.28.41.234])
	by gw1000.de.marconicomms.com (Postfix) with ESMTP id E870C6D0D
	for <linux-mtd@lists.infradead.org>;
	Mon, 13 Jun 2005 11:16:09 +0200 (CEST)
Received: from idefix (idefix [172.28.34.108])
	by oxia.de.marconicomms.com (8.9.3/8.9.3) with ESMTP id LAA11925
	for <linux-mtd@lists.infradead.org>;
	Mon, 13 Jun 2005 11:16:09 +0200 (MEST)
Date: Mon, 13 Jun 2005 11:16:07 +0200
From: Andreas Engel <Andreas.Engel@marconi.com>
To: linux-mtd@lists.infradead.org
Message-ID: <20050613111607.00002d00@idefix>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: concat_unlock
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

has anyone successfully used locking/unlocking on a concatenated mtd
device? The function concat_unlock() calls subdev->unlock() without
checking the pointers validity first and I couldn't find out where the
pointer has been set. Do I have to provide the necessary initialization
myself?

Regards,
  Andreas
