Received: from co202.xi-lite.net ([149.6.83.202])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1QCwCG-0002v6-Qy
	for linux-mtd@lists.infradead.org; Thu, 21 Apr 2011 15:53:37 +0000
Message-ID: <4DB052DB.7040308@parrot.com>
Date: Thu, 21 Apr 2011 17:52:59 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Brian
	Norris <norris@broadcom.com>
Subject: dangerous NAND_BBT_SCANBYTE1AND6
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I believe NAND_BBT_SCANBYTE1AND6 behavior is very dangerous.
We have a ST flash where ecc where but on bit 5 and 6.
With new kernel all block are bad.

Is this option is really needed ?
ST datasheet say [1]. We already check the first Word.
Why do we need to check the 6th Byte ?


Matthieu

PS : the code check 1st, 2nd, 6th, 7th Bytes. So it check too much bytes.


[1]
The devices are supplied with all the locations inside valid blocks erased
(FFh). The Bad
Block Information is written prior to shipping. Any block, where the 1st and 6th
Bytes, or 1st
Word, in the spare area of the 1st page, does not contain FFh, is a Bad Block.
