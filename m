Received: from mail.ureach.com ([63.150.151.36] helo=ureach.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Ee3ma-0002hG-Gc
	for linux-mtd@lists.infradead.org; Mon, 21 Nov 2005 00:00:06 -0500
Received: from www23.ureach.com (www23.ureach.com [172.16.2.51])
	by ureach.com (8.12.9/8.12.9) with ESMTP id jAL4xuNR012798
	for <linux-mtd@lists.infradead.org>; Sun, 20 Nov 2005 23:59:56 -0500
Date: Sun, 20 Nov 2005 23:59:56 -0500
Message-Id: <200511210459.XAA17689@www23.ureach.com>
To: linux-mtd@lists.infradead.org
From: yogesh shivabasappa <yogesh@ureach.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: 7bit
Subject: mtd erase
Reply-To: yogesh@ureach.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Im using intelP30 nor flash(CFI)  in our custom board , im
registering the flash as mtd  character device. We dont have
partitions on  it ,  Now i'm writting a util program to perform
read,write and erase.

beform performing ioctl ERASE we need to call ioctl MEMGETINFO
or MEMGETREGIONINFO. Here im confusing between these two ioctls.
my understaing is, for region erase we need to call
MEMGETREIONINFO and MEMGETINFO is for non-region-erase .

can anyone tell me how these two ioctls are differ and which one
can be used for perfect erase.

I will appreciate any tips

Rgds,

Yogesh Shivabasappa

________________________________________________
Get your own "800" number
Voicemail, fax, email, and a lot more
http://www.ureach.com/reg/tag
