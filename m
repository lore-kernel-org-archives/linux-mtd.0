Received: from mail.de.keymile.com ([195.8.104.1])
	by canuck.infradead.org with smtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PfvRW-0007r5-VB
	for linux-mtd@lists.infradead.org; Thu, 20 Jan 2011 14:24:55 +0000
Message-ID: <4D3845AE.2040002@keymile.com>
Date: Thu, 20 Jan 2011 15:24:46 +0100
From: Holger Brunck <holger.brunck@keymile.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: MTD concat support for linux and UBI
Content-Type: text/plain;
	charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Stefan Roese <sr@denx.de>, "agust@denx.de" <agust@denx.de>,
	Detlev Zundel <dzu@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,
I have got a general question to the MTD concat feature in Linux. Is it allowed
to concatenate NOR flashes with different writebuffersizes? Currently the code
allows this.
If so I see a problem for different sizes when dealing with UBI volumes
comprehending such flashes. Some days ago some patches were added to adjust the
min I/O size for UBI to the writebuffersize of the flash. If now two flashes
with different writebuffersizes are concatenated whats the way forward? I see
two solutions:
1) Using the writebuffersize from the flash with the largest writebuffer for min
I/O size in UBI.
2) Adapting the concat feature in Linux to forbid concatenating flashes with
different writebuffersizes.

Best regards
Holger Brunck
