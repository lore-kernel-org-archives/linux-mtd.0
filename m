Received: from mail.ureach.com ([63.150.151.36] helo=ureach.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1ERp1x-0003Gb-13
	for linux-mtd@lists.infradead.org; Tue, 18 Oct 2005 06:49:24 -0400
Date: Tue, 18 Oct 2005 06:49:12 -0400
Message-Id: <200510181049.GAA27871@www22.ureach.com>
To: "Daniel Ann" <ktdann@gmail.com>, "Daniel Ann" <ktdann@gmail.com>,
	"Linux " <linux-mtd@lists.infradead.org>,
	"Linux " <linux-mtd@lists.infradead.org>
From: yogesh shivabasappa <yogesh@ureach.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: 7bit
Cc: 
Subject: nor flash read and write
Reply-To: yogesh@ureach.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

we have  a custom board with nor flash( intel p30) and i'm
registering  the nor flash as mtd chrdev.
mtd->read and mtd->write maps to cfi_intelexread,
cfi_intelexwirte .
1. from the user level how can i write an application program to
access the device.

2. is it possible to use ioctl( ) for operations like
MEMGETINFO, MEMERASE........

regards,

yogesh

________________________________________________
Get your own "800" number
Voicemail, fax, email, and a lot more
http://www.ureach.com/reg/tag
