Received: from nz-out-0506.google.com ([64.233.162.232])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I3W8I-0002b4-S1
	for linux-mtd@lists.infradead.org; Wed, 27 Jun 2007 07:56:29 -0400
Received: by nz-out-0506.google.com with SMTP id s18so131561nze
	for <linux-mtd@lists.infradead.org>;
	Wed, 27 Jun 2007 04:56:26 -0700 (PDT)
Message-ID: <8bf247760706270456y7253b684n728c527627880bd2@mail.gmail.com>
Date: Wed, 27 Jun 2007 17:26:25 +0530
From: Ram <vshrirama@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Test utilities and Empty Flash at error messages
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
  Are there any test utilities available to test jffs2 filesystem?.

  Can anyone provide me some pointers on that.

  Right now, what im doing is im creating hundreds of files and reboot
the system.

  Im doing this in a loop and looking for jffs2 error messages at startup.


  I have a query which is completing different from the above one.

  I have flashed a jffs2 filesystem, I have stored some files and at
first reboot.

  I get a message: Empty flash at 0x00b69e60 ends at 0x00b6a000

  The address pertains to my filesystem. I have erased my filesystem using
  flash_eraseall /dev/mtd8

  Using nandwrite utility in mtd utils i have flashed my jffs2 filesystem which
  has been created with erase size 0x20000.

  I dont know why i get that error.


  Can anyone help me on this?.


Regards,
sriram
