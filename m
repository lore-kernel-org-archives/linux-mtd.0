Received: from cvs.anu.edu.au ([150.203.38.2] helo=monk.anu.edu.au)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15Rmq9-00063B-00
	for <linux-mtd@lists.infradead.org>; Wed, 01 Aug 2001 04:38:34 +0100
Received: from cvs.anu.edu.au (saul@albatross [150.203.40.96])
	by monk.anu.edu.au (8.9.3/8.9.3) with ESMTP id NAA17866
	for <linux-mtd@lists.infradead.org>; Wed, 1 Aug 2001 13:44:18 +1000
Message-ID: <3B677B90.B2E244BD@cvs.anu.edu.au>
Date: Wed, 01 Aug 2001 13:46:24 +1000
From: Saul Thurrowgood <saul@cvs.anu.edu.au>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: DOC 2000 driver (NFTL) in kernel 2.4.7
References: <E15RXGo-00058Q-00@pentafluge.infradead.org>
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

> 3) (and this is the show stopper) The NFTL driver is not able to find a
> boot record on the DOC. This is strange because I'm actually booting
> from the DOC.
>
> The previous configuration used a 2.0.36 kernel with M-System provided
> drivers and it worked fine.


I had the exact same problem but I am running an Ampro P5e with DOC 2000
(2.4.1 kernel).

I knew it had a valid NFTL boot record, because it would boot to DOS,
and running the nftldump util under linux would find it. It had been
NFTL formatted with M-Systems utils.

I fixed it by formatting with nftl_format (also comes with MTD source),
providing it a 240k offset so it would not trash the BIOS at the
beginning of the chip (Ampro specific).

Works fine! So, what's the difference between the two formats?!?
Both start at the exact same place on the DOC, as seen by running
nftldump before and after.

Saul.
