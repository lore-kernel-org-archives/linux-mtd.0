Received: from 228-216.205.122.dellhost.com ([216.205.122.228] helo=lakeshoremicro.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17MZDl-0007bU-00
	for <linux-mtd@lists.infradead.org>; Mon, 24 Jun 2002 20:09:53 +0100
Message-ID: <001001c21bb2$b57f1b50$0201a8c0@dellc800>
From: "Mark Meade" <mark@lakeshoremicro.com>
To: <linux-mtd@lists.infradead.org>
Subject: Re: GRUB on DoC Millennium/2000 - Instructions
Date: Mon, 24 Jun 2002 15:08:43 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Peter Keel wrote:
> Disk /dev/hdc: 524 cylinders, 64 heads, 63 sectors/track
> Units = sectors of 512 bytes, counting from 0

Peter -- have you tried "root (hd2,0)"?  On my system, /dev/hda1 --> hd0,0.
