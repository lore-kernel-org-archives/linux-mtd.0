Received: from av-gw2.cc.tut.fi ([130.230.130.111])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IXyw0-0006ov-Sr
	for linux-mtd@lists.infradead.org; Wed, 19 Sep 2007 08:45:44 -0400
Received: from av-gw2.cc.tut.fi (unknown [127.0.0.1])
	by av-gw2.cc.tut.fi (Symantec Mail Security) with ESMTP id 21E821500AE
	for <linux-mtd@lists.infradead.org>;
	Wed, 19 Sep 2007 15:45:33 +0300 (EEST)
Received: from mail.cc.tut.fi (unknown [130.230.1.120])
	by av-gw2.cc.tut.fi (Symantec Mail Security) with ESMTP id 9C16A900CF
	for <linux-mtd@lists.infradead.org>;
	Wed, 19 Sep 2007 15:45:32 +0300 (EEST)
Received: from assari.cc.tut.fi (assari.cc.tut.fi [130.230.10.21])
	by mail.cc.tut.fi (Postfix) with ESMTP id 8A8E0A4107
	for <linux-mtd@lists.infradead.org>;
	Wed, 19 Sep 2007 15:45:32 +0300 (EEST)
Received: from localhost (localhost [127.0.0.1])
	by assari.cc.tut.fi (Postfix) with ESMTP id 2CFF38C03D
	for <linux-mtd@lists.infradead.org>;
	Wed, 19 Sep 2007 15:45:32 +0300 (EEST)
Date: Wed, 19 Sep 2007 15:45:32 +0300 (EEST)
From: Timo Piiroinen <timo.piiroinen@tut.fi>
To: linux-mtd@lists.infradead.org
Subject: mkfs.jffs2 and mksum
Message-ID: <Pine.LNX.4.64.0709191538050.1701@assari.cc.tut.fi>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I have done jffs2 image with --pad option to match my flash size and it 
works fine. However, if I want to use summary, the sumtool creates smaller 
image than original padded jffs2 image and the flash isn't fully used. 
I write the jffs2 image using bootloader, where I set the size of the 
flashing length match the filesize. Is there any way to pad summed 
image to larger so that i can fully occupy flash?
sumtool -p option doesn't allow to set filesize.

   Timo
   timo.piiroinen@tut.fi
