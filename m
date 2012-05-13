Received: from mail.grid-net.com ([97.65.115.2])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1STZk3-0005GT-9Z
 for linux-mtd@lists.infradead.org; Sun, 13 May 2012 14:25:47 +0000
Message-ID: <4FAFC468.8080701@grid-net.com>
Date: Sun, 13 May 2012 07:25:44 -0700
From: Subodh Nijsure <snijsure@grid-net.com>
MIME-Version: 1.0
To: <linux-mtd@lists.infradead.org>
Subject: How common is OTP support in NAND flash?
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


I see that MTD char drivers have support for programming the OTP pages 
on NAND flash, some questions regarding that.

Do most flash chip vendors support on-flash OTP pages or if one develops 
product that depends on using data from flash OTP, one would be locked 
into that specific vendors.

And does anybody know if these OTP pages are also subjected to 
bit-flipping or one shouldn't have to worry about that for OTP pages?

-Subodh
