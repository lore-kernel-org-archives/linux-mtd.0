Received: from nz-out-0506.google.com ([64.233.162.224])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HXHVp-0006LJ-CV
	for linux-mtd@lists.infradead.org; Fri, 30 Mar 2007 09:51:30 -0400
Received: by nz-out-0506.google.com with SMTP id i11so821936nzi
	for <linux-mtd@lists.infradead.org>;
	Fri, 30 Mar 2007 06:51:28 -0700 (PDT)
Message-ID: <41483bfe0703300651yd7b16d6u9441cba4c812a453@mail.gmail.com>
Date: Fri, 30 Mar 2007 09:51:27 -0400
From: "harsh poshtiwala" <hiharsh@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: How to implement MTD
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Hi Friends,

good Morning,

I want to port WindRiver kernel 2.6 with jffs2 file system and MTD
parttitions on ARM926EJ-S development board which has NAND flash.

I have no clue how do i make MTD partition ?

Is it something that i need to select while configuring the kernel?

if it is correct then after buuilding kernel with those selections ,do
i need to create MTD device using mknod ?

followed by creating jffs2 file system using mk.jffs2?

once i have this jffs2 image will i have to port it on the board using
boot loader + kermit ?


Is there any guideline  that would help me to build MTD partion on  NAND flash?

I would appreciate your reply,
-- 
Thanks & Regards
Harsh
