Received: from rcmenter.iserver.net ([192.41.35.12])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14zimB-00081T-00
	for <linux-mtd@lists.infradead.org>; Tue, 15 May 2001 18:38:27 +0100
Message-ID: <3B016AAD.9DE2AE13@asu.edu>
Date: Tue, 15 May 2001 10:43:09 -0700
From: Russ Dill <Russ.Dill@asu.edu>
MIME-Version: 1.0
To: "Bao C. Ha" <baoha@sensoria.com>
CC: "'David Woodhouse'" <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: Re: Booting from JFFS2
References: <000001c0dd5f$0d818ec0$326c020a@SENSORIA>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

>> makes in more interesting to flash it though

The Flashing takes place only once for JFFS2.
Then it will be just like a normal mounted
filesystem.

Right?

Bao

right, as long as you don't need to flash it all at once while booted
