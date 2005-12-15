Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EmqXU-0007PU-Tr
	for linux-mtd@lists.infradead.org; Thu, 15 Dec 2005 05:40:52 -0500
Message-ID: <43A1484C.5030300@ru.mvista.com>
Date: Thu, 15 Dec 2005 13:41:16 +0300
From: Vitaly Wool <vwool@ru.mvista.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [RFC] the way to proceed with OOB data
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi folks,

you may have noticed the RFC patches for OOB handling rework I've posted 
to this list about two weeks ago.
The main idea of those was a) to provide uniform method for handling OOB 
by such MTD users like JFFS2/YAFFS2 b) to hide the OOB internal 
structure from the users. However, people talking to me on that convined 
me that those changes were too radical for the moment and also pointed 
out the following problems that arise if my changes are accepted:
1. No more legacy support for jffs/yaffs OOB layouts. This is the point 
I don't consider to be major, since if something's deprecated it means 
that it'd go away at some point, so maybe now is the time? But maybe 
most of you guys think differently.
2. No more ability to read raw OOB data from the userspace which might 
turn to be a serious problem while debugging stuff. I must admit this is 
something we should preserve.
3. No binary compatibility for MTD utilities. Here I'm also willing to 
admit being too radical.

On the other hand, it's really necessary to provide means for  kernel 
MTD users not to mess with the oobinfos.
So, the question is: how to do it then? I see several ways of doing that.
1. Change the API for nand_read_ecc and nand_write_ecc, namely add OOB 
read/write length parameter. This is what Charles proposes; it's nice 
for MTD users but it will overcomplicate nand_read_ecc/nand_write_ecc, 
which are complicated enough at the moment.
2. Change the API for nand_read_oob/nand_write_oob so that it read/wrote 
either raw OOB or free OOB. This way has been discouraged by Artem 
during our discussion in #mtd, but this might be an option.
3. Leave everything as is and add a new functionto the MTD interface 
that will read/write only free OOB bytes as a single chunk of data.

Each of the options implies the need to extend ioctl interface to get 
oobavail/oob free data.

Any comments are welcome.

Vitaly
