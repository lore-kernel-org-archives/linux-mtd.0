Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R5yRr-0002kk-0N
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2011 11:25:11 +0000
Received: by wwp14 with SMTP id 14so393312wwp.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 20 Sep 2011 04:25:09 -0700 (PDT)
Subject: Re: mtd-util, flash_erase: MEMGETOOBSEL on davinci based board fail
From: Artem Bityutskiy <dedekind1@gmail.com>
To: hs@denx.de
Date: Tue, 20 Sep 2011 14:27:49 +0300
In-Reply-To: <4E784790.4010601@denx.de>
References: <4E784790.4010601@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1316518076.4849.53.camel@sauron>
Mime-Version: 1.0
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-09-20 at 09:58 +0200, Heiko Schocher wrote:
> Now the questions:
> 
> a) is this fix Ok? (Has it i chance to go in mainline?)

No, it breaks ABI.

> b) in include/mtd/mtd-abi.h I found this comment:
> 
> /*
>  * Obsolete legacy interface. Keep it in order not to break userspace
>  * interfaces
>  */
> struct nand_oobinfo {
> 
> so this Interface should not be used ... which Interface should be
> used instead?

You are lucky because Brian already took care of this. You need to use
his MEMWRITE ioctl. Try my l2 tree (or take patches from that tree) plus
the "brian" branch of the mtd-utils tree. The idea is that the new ioctl
should get to mainline soon, and we'll merge the brian branch into the
master branch in mtd-utils.

My tree: http://git.infradead.org/users/dedekind/l2-mtd-2.6.git
(you can use it or pick patches from there)
MTD utils tree: http://git.infradead.org/users/dedekind/mtd-utils.git
(use the "brian" branch)

Of course we are interested to know if it worked for you. Brian is in
CC.

-- 
Best Regards,
Artem Bityutskiy
