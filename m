Received: from wa-out-1112.google.com ([209.85.146.179])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I6aoz-00038u-4p
	for linux-mtd@lists.infradead.org; Thu, 05 Jul 2007 19:33:15 -0400
Received: by wa-out-1112.google.com with SMTP id v33so51997wah
	for <linux-mtd@lists.infradead.org>;
	Thu, 05 Jul 2007 16:33:10 -0700 (PDT)
Message-ID: <8bf247760707051633u436e7d8bm6b38ae4e6e0b91e8@mail.gmail.com>
Date: Fri, 6 Jul 2007 05:03:10 +0530
From: Ram <vshrirama@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Lots of Empty Flash messages.
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

Hi,
   Have flashed a new filesystem onto my nand flash.

   I boot linux out of nand. I make a first file write from the filesystem.

   When i reboot my system i see messages like:
    Empty flash at 0x00b69e60 ends at 0x00b6a000

   Sometimes, i get quite a way of them.


   On some boots i get only a couple and the addresses keep on changing.

   I have made my jffs2 filesystem with erase block size = 0x20000.

   I dont know why i get these messages...


   I also get messages such as bad erase block found at XXXX.


  Could you please advice on why they appear how i can avoid such messages.



Regards,
sriram
