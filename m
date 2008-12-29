Received: from aibo.runbox.com ([87.238.52.70])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LHKlL-0002Nj-Om
	for linux-mtd@lists.infradead.org; Mon, 29 Dec 2008 16:14:40 +0000
Received: from [10.9.9.160] (helo=penny.runbox.com)
	by greyhound.runbox.com with esmtp (Exim 4.50) id 1LHKRn-0000zC-BZ
	for linux-mtd@lists.infradead.org; Mon, 29 Dec 2008 16:54:27 +0100
Received: from [74.94.155.203] (helo=[192.168.12.139])
	by penny.runbox.com with esmtpsa (uid:263104 )
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA:32) (Exim 4.50) id 1LHKRm-0008U3-TD
	for linux-mtd@lists.infradead.org; Mon, 29 Dec 2008 16:54:27 +0100
Message-ID: <4958F2AF.8060606@runbox.com>
Date: Mon, 29 Dec 2008 10:54:23 -0500
From: Cal Page <pagcal@runbox.com>
MIME-Version: 1.0
To: ubifs <linux-mtd@lists.infradead.org>
Subject: ubifs: partition won't mount: duplicate sqnum in replay ???
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

How do I get past this UBIFS mount failure:

UBIFS error (pid XXX): insert_node: duplicate sqnum in replay.

UBIFS DBG (pid XXX): ubifs_bp_thread: background thread "ubifs_bht0_1" stops

Cal Page
