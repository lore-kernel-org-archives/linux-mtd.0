Received: from py-out-1112.google.com ([64.233.166.177])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1G6J6S-0002y6-GE
	for linux-mtd@lists.infradead.org; Thu, 27 Jul 2006 23:33:40 -0400
Received: by py-out-1112.google.com with SMTP id x31so410604pye
	for <linux-mtd@lists.infradead.org>;
	Thu, 27 Jul 2006 20:33:30 -0700 (PDT)
Message-ID: <91b24a870607272033n1fa43a45vb523982186708f8e@mail.gmail.com>
Date: Fri, 28 Jul 2006 11:33:30 +0800
From: "Marteo Tim" <tim.marteo@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: about using UBI on MLC Nand flash
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

I noticed that UBI need to write 2 times at 1st page in 1 block, one
for EC header, and the other for VID header. But it is not suitable
for MLC NAND flash, which only can write once per page. And by
default, MTD's nand_write can only write page-aligned data.
Although we can set the module parameter vid_hdr_offsets to the 2nd
page, but it will occupy more flash space. It is in a dilemma. :(

marteo
