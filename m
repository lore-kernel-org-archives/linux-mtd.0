Received: from wproxy.gmail.com ([64.233.184.195])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EBqhU-0006S7-CW
	for linux-mtd@lists.infradead.org; Sun, 04 Sep 2005 05:22:11 -0400
Received: by wproxy.gmail.com with SMTP id i22so144339wra
	for <linux-mtd@lists.infradead.org>;
	Sun, 04 Sep 2005 02:22:02 -0700 (PDT)
Message-ID: <431ABB64.2050003@gmail.com>
Date: Sun, 04 Sep 2005 12:16:20 +0300
From: gxkahn <gxkahn@gmail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: can manage partitions in physmap.c
Reply-To: gxkahn@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

i am using kernel 2.6.7, configured for my NOR chip.
trying to configure partitions, by command line. Using physmap.c
it's recognise chip very well, but  i found that CONFIG_MTD_PARTITION
not set. is there any bug that fixed already? can somebody point to the 
patch?
