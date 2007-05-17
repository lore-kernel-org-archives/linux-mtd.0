Received: from wr-out-0506.google.com ([64.233.184.234])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HohFI-0002Qs-Fn
	for linux-mtd@lists.infradead.org; Thu, 17 May 2007 10:46:27 -0400
Received: by wr-out-0506.google.com with SMTP id 55so611182wri
	for <linux-mtd@lists.infradead.org>;
	Thu, 17 May 2007 07:46:23 -0700 (PDT)
Message-ID: <8bf247760705170746q272b90a4m90feba2be822647e@mail.gmail.com>
Date: Thu, 17 May 2007 20:16:22 +0530
From: Ram <vshrirama@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: newbie queries
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
   I am using linux 2.6.19 and have a few queries regarding linux mtd.
   Im using a JFFS2 filesystem.

   Regarding bad block management - What kind of bad block management does
   mtd and jffs2 use?.

   What happens when the filesystem detects that a block is bad?.

  how does it work?.

  Am using a large page. Each page is 2048 bytes. Does this include
the 64 bytes for the ECC?

Regards,
sriram
