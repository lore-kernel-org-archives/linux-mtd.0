Received: from web8502.mail.in.yahoo.com ([202.43.219.164])
	by canuck.infradead.org with smtp (Exim 4.52 #1 (Red Hat Linux))
	id 1Dx3Hp-0004Xn-He
	for linux-mtd@lists.infradead.org; Mon, 25 Jul 2005 09:46:36 -0400
Message-ID: <20050725133945.73879.qmail@web8502.mail.in.yahoo.com>
Date: Mon, 25 Jul 2005 14:39:45 +0100 (BST)
From: Soma sundaram Veerappan <soma_edu@yahoo.co.in>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Subject: Jffs2 problem - no space left on device
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I am working with Versatile PB926EJ-S.I am trying
porting  jffs2 with Linux-2.6.12.

I am getting 'No space left on device' message when i
 try to remove to create files.

I got reply from another mailing list to use below
command like below.

mkfs.jffs2 --eraseblock=0x40000 --pad=10485760 \
        -d your-filesystem-dir > filesystem.jffs2

I used below command to make 10MB flash image

mkfs.jffs2 -l --root=image --eraseblock=0x040000
--no-cleanmarkers --pad=10485760 -o flashdisk_jffs2 -D
devices.txt 

When i passed this image size to linux from u-boot
bootargs, i got following messages

Erase at 0x00240000 failed immediately: -EROFS. Is the
sector locked?
Erase at 0x00200000 failed immediately: -EROFS. Is the
sector locked?
Erase at 0x00980000 failed immediately: -EROFS. Is the
sector locked?
Erase at 0x00940000 failed immediately: -EROFS. Is the
sector locked?
Erase at 0x00900000 failed immediately: -EROFS. Is the
sector locked?
Erase at 0x008c0000 failed immediately: -EROFS. Is the
sector locked?
Erase at 0x00880000 failed immediately: -EROFS. Is the
sector locked?
Erase at 0x00840000 failed immediately: -EROFS. Is the
sector locked?
Erase at 0x00800000 failed immediately: -EROFS. Is the
sector locked?
Erase at 0x007c0000 failed immediately: -EROFS. Is the
sector locked?
Erase at 0x00780000 failed immediately: -EROFS. Is the
sector locked?
Erase at 0x00740000 failed immediately: -EROFS. Is the
sector locked?
Erase at 0x00700000 failed immediately: -EROFS. Is the
sector locked?
Erase at 0x006c0000 failed immediately: -EROFS. Is the
sector locked?
Erase at 0x00680000 failed immediately: -EROFS. Is the
sector locked?
Erase at 0x00640000 failed immediately: -EROFS. Is the
sector locked?
Erase at 0x00600000 failed immediately: -EROFS. Is the
sector locked?
Erase at 0x005c0000 failed immediately: -EROFS. Is the
sector locked?
Erase at 0x00580000 failed immediately: -EROFS. Is the
sector locked?
Erase at 0x00540000 failed immediately: -EROFS. Is the
sector locked?
Erase at 0x00500000 failed immediately: -EROFS. Is the
sector locked?
Erase at 0x004c0000 failed immediately: -EROFS. Is the
sector locked?
Erase at 0x00480000 failed immediately: -EROFS. Is the
sector locked?
Erase at 0x00440000 failed immediately: -EROFS. Is the
sector locked?
Erase at 0x00400000 failed immediately: -EROFS. Is the
sector locked?
Erase at 0x003c0000 failed immediately: -EROFS. Is the
sector locked?
Erase at 0x00380000 failed immediately: -EROFS. Is the
sector locked?
Erase at 0x00340000 failed immediately: -EROFS. Is the
sector locked?

Any help on this regard is highly appreciated.

Regards,
Soma sundaram.V



		
_______________________________________________________
Too much spam in your inbox? Yahoo! Mail gives you the best spam protection for FREE! http://in.mail.yahoo.com
