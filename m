Received: from tiger.actrix.co.nz ([203.96.16.160])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18eLML-0002C2-00
	for <linux-mtd@lists.infradead.org>; Thu, 30 Jan 2003 20:32:29 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Charles Manning <manningc2@actrix.gen.nz>
Reply-To: manningc2@actrix.gen.nz
To: "Alex Samoutin" <samoutin@hotbox.ru>,
	<linux-mtd@lists.infradead.org>
Subject: Re: NAND subsector writing problem
Date: Fri, 31 Jan 2003 09:57:59 +1300
References: <007801c2c7fc$5834da60$1a00a8c0@itc.intrinsyc.com>
In-Reply-To: <007801c2c7fc$5834da60$1a00a8c0@itc.intrinsyc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20030130210325.0F2BB405E@tiger.actrix.co.nz>
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

There is no problem using this for JFFS2 or YAFFS since neither use 
sub-page writes.

ECC applies to the whole page.  Thus, mixing ECC and sub-page writes is 
invalid.

-- Charles
