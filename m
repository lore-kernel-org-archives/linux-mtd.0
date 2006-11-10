Received: from nf-out-0910.google.com ([64.233.182.191])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GiQRs-000817-DP
	for linux-mtd@lists.infradead.org; Fri, 10 Nov 2006 02:05:19 -0500
Received: by nf-out-0910.google.com with SMTP id i2so1159400nfe
	for <linux-mtd@lists.infradead.org>;
	Thu, 09 Nov 2006 23:05:10 -0800 (PST)
Message-ID: <6d6a94c50611092305v6f52b9b0hfd254e10a2992d44@mail.gmail.com>
Date: Fri, 10 Nov 2006 15:05:08 +0800
From: Aubrey <aubreylee@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: mount costs too long
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I wrote a mtd-nand driver and enabled it with YAFFS on 2.6.18.
When I mount the mtd partition of a large page nand chip, everything works fine.
But When I replace the large page nand chip with a small page nand
chip,everything works ok except mount costs about 8 seconds. It's too
long, I think.

The same kernel and driver, the same hardware except the nand part
number( NAND01G and NAND128W), any clue?

Did anyone encounter this issue? Welcome any suggestions!

Thanks,
-Aubrey
