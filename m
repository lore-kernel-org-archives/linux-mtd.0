Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T75bA-0005xu-2j
 for linux-mtd@lists.infradead.org; Thu, 30 Aug 2012 14:19:56 +0000
Received: by bkcji2 with SMTP id ji2so873204bkc.36
 for <linux-mtd@lists.infradead.org>; Thu, 30 Aug 2012 07:19:52 -0700 (PDT)
Message-ID: <503F7685.8030707@gmail.com>
Date: Thu, 30 Aug 2012 16:19:49 +0200
From: simon widmer <simonxwidmer@gmail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: UBIFS Informations
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hej,

is there any possibility to extract the compile options of a ubinized 
UBIFS? My problem is that I have an embedded system where some UBIFS run 
on, I have an old UBIFS which I can easily put on a volume 
(ubiupdatevol) and which runs perfectly. I had to make a new image, 
taking the parameters i wrote down and its now working, i end with an error
     UBIFS error (pid 946): ubifs_read_node: bad node type (255 but 
expected 6)
     UBIFS error (pid 946): ubifs_read_node: bad node at LEB 0:0
either the node is 255 either 0 instead of 6.

i already read several posts about wrong sizes but nothing worked...

The fun thing overall is, that the filesystem is, despite the error 
while booting, readable but not writable...

thanks for any help - simon
