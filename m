Received: from mout.gmx.net ([212.227.15.19])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ewU6g-0000lb-F3
 for linux-mtd@lists.infradead.org; Thu, 15 Mar 2018 14:44:19 +0000
MIME-Version: 1.0
Message-ID: <trinity-16b93208-69da-44fd-8882-e4852cb4837b-1521125017314@3c-app-gmx-bs35>
From: "Frank Smith" <smith-f@gmx.de>
To: "Frieder Schrempf" <frieder.schrempf@exceet.de>
Cc: linux-mtd@lists.infradead.org
Subject: Aw: Re: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found.
 is25lp256d
Content-Type: text/plain; charset=UTF-8
Date: Thu, 15 Mar 2018 15:43:37 +0100
In-Reply-To: <4fa247df-ecd3-1034-aaa1-45bfdc1bcda8@exceet.de>
References: <trinity-f2c4ec20-92aa-4549-961a-54ada3bed090-1521123187434@3c-app-gmx-bs35>
 <4fa247df-ecd3-1034-aaa1-45bfdc1bcda8@exceet.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> I guess you need to set SPI_NOR_4B_OPCODES flag to use 4 byte addressing
> and be able to access memory above 16MB.

SPI_NOR_4B_OPCODES does not have an effect. Still these error above from 0xA00000 to 0xeXXXXX

jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00d60024: 0x0069 instead

and 

jffs2: Empty flash at 0x00d6fe34 ends at 0x00d6fe3c

What do you mean by, be able to access memory above 16MB? How to verify this?

Best, Frank
