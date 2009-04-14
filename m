Received: from rv-out-0708.google.com ([209.85.198.246])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LtdeC-0003PZ-8h
	for linux-mtd@lists.infradead.org; Tue, 14 Apr 2009 08:05:43 +0000
Received: by rv-out-0708.google.com with SMTP id l33so2233529rvb.42
	for <linux-mtd@lists.infradead.org>;
	Tue, 14 Apr 2009 01:05:35 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 14 Apr 2009 16:05:35 +0800
Message-ID: <71103bce0904140105l2aea95b4i2bfe460abacf66ec@mail.gmail.com>
Subject: ubifs corrupt
From: jerry <jerrydreaming@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

I'm getting some problem with UBIFS when the power is switched off abruptly
 during a write to flash(nandflash 2k/page). In the next boot the contents of
 the file is not found and prints the following information.

UBIFS error (pid 358): ubifs_check_node: bad magic 0xffffffff,
expected 0x6101831
UBIFS error (pid 358): ubifs_check_node: bad node at LEB 27:251264
UBIFS error (pid 358): ubifs_read_node: expected node type 2
UBIFS error (pid 358): ubifs_check_node: bad magic 0xffffffff,
expected 0x6101831
UBIFS error (pid 358): ubifs_check_node: bad node at LEB 27:251264
UBIFS error (pid 358): ubifs_read_node: expected node type 2
problem renaming the file /Settings/qpe.conf.new to /Settings/qpe.conf
UBIFS error (pid 358): ubifs_check_node: bad magic 0xffffffff,
expected 0x6101831
UBIFS error (pid 358): ubifs_check_node: bad node at LEB 27:251264
UBIFS error (pid 358): ubifs_read_node: expected node type 2

I think the qpe.conf is writting when the power is off and The problem
is reproducable.

Please could you tell me if this is a known issue.

Thanks for your help and time!

Regards,

Jerry
