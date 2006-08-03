Received: from nz-out-0102.google.com ([64.233.162.194])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1G8iVH-00006i-IQ
	for linux-mtd@lists.infradead.org; Thu, 03 Aug 2006 15:05:25 -0400
Received: by nz-out-0102.google.com with SMTP id s1so506658nze
	for <linux-mtd@lists.infradead.org>;
	Thu, 03 Aug 2006 12:05:06 -0700 (PDT)
Message-ID: <e0590900608031205r5d6c2878wbe21efa540f9ff7d@mail.gmail.com>
Date: Thu, 3 Aug 2006 15:05:05 -0400
From: mitsy <mitsy12@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: NAND flash writeb fails
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

I have a AMD au1550 based board with NAND flash. When I try to write a
command to the flash, it just hangs on writeb(). I can't figure out
why it hangs there. Any suggestions?

Mitsy
