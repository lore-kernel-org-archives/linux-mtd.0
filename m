Received: from mail.dgt.com.pl ([195.117.141.2] helo=dgt.com.pl)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JOhO4-0006eG-Su
	for linux-mtd@lists.infradead.org; Mon, 11 Feb 2008 22:44:39 +0000
Message-ID: <47B0C8C4.4060009@dgt.com.pl>
Date: Mon, 11 Feb 2008 23:14:28 +0100
From: Wojciech Kromer <wojciech.kromer@dgt.com.pl>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: MEMSETOOBSEL in nandwtrite
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Which one have to be updated: nandwrite with nandwrite MEMSETOOBSEL ioctl or kernel?
I have latest git snapshot from mtd-utils and mtd-2.6.
There is still MEMSETOOBSEL inside nandwrite, and it's not implemented in kernel.

Any news on this sibjest?
