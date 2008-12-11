Received: from co203.xi-lite.net ([149.6.83.203])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LAoWi-0000Nl-4Z
	for linux-mtd@lists.infradead.org; Thu, 11 Dec 2008 16:36:36 +0000
Message-ID: <4941418F.2070802@parrot.com>
Date: Thu, 11 Dec 2008 17:36:31 +0100
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: m25p80 : chip not supporting OPCODE_BE
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <David.Woodhouse@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

it seems the m45peXX flash are not supporting OPCODE_BE command [1].
Shouldn't we add a flag to avoid to issue such command on such flash ?



Matthieu

[1]
http://www.numonyx.com/Documents/Datasheets/M45PE80.pdf
