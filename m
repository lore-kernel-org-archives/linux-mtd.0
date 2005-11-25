Received: from moutvdom.kundenserver.de ([212.227.126.249]
	helo=moutvdomng.kundenserver.de)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EffAW-0007HQ-ST
	for linux-mtd@lists.infradead.org; Fri, 25 Nov 2005 10:07:26 -0500
Message-ID: <43872881.3010608@anagramm.de>
Date: Fri, 25 Nov 2005 16:06:41 +0100
From: Clemens Koller <clemens.koller@anagramm.de>
MIME-Version: 1.0
To: hs@denx.de
References: <AHEILKONAKAEJPHNMOPNKEMMCDAA.hs@denx.de>
In-Reply-To: <AHEILKONAKAEJPHNMOPNKEMMCDAA.hs@denx.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linuxppc-dev@ozlabs.org, tglx@linutronix.de, dwmw2@infradead.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH]	MTD:	Add support for the PM82x Boards.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello, Heiko!

> i made the changes in the code you suggested to me.
> 
> Additional changes:
> - I now use the CFI interface (I tested it, and it seems OK
>   to me)

Datasheets should confirm the same.

Just in case you do the PM854 support anytime soon,
the i128J3C150 Flash supports CFI, too, which makes
these things also pretty simple.

Best greets,
-- 
Clemens Koller
_______________________________
R&D Imaging Devices
Anagramm GmbH
Rupert-Mayer-Str. 45/1
81379 Muenchen
Germany

http://www.anagramm.de
Phone: +49-89-741518-50
Fax: +49-89-741518-19
