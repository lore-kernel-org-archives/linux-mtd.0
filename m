Received: from [209.247.180.230] (helo=RAS-SERVER)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15gBr9-0004BU-00
	for <linux-mtd@lists.infradead.org>; Sun, 09 Sep 2001 22:11:07 +0100
From: "Bao C. Ha" <baoha@sensoria.com>
To: <linux-mtd@lists.infradead.org>
Subject: Boot up problem with Kernel 2.4.8
Date: Sun, 9 Sep 2001 14:14:09 -0700
Message-ID: <025b01c13974$5e400cd0$456c020a@SENSORIA>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

I have a strange problem with kernel 2.4.8.  When
I tried to boot up with "root=/dev/mtdblock/3", it
gets panic and can't find the root device.  When,
I change to "root=1f03", it works.  I am using
RedBoot if it matters, but it works with 2.4.5
before.

Appreciate any comments/suggestions.

Thanks.
Bao  
