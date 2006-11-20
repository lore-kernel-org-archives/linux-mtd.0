Received: from mailhost.elitecore.com ([203.88.135.194] helo=elitecore.com)
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Gm0zV-0005QW-56
	for linux-mtd@lists.infradead.org; Sun, 19 Nov 2006 23:42:52 -0500
Message-ID: <005801c70c5d$df382900$3d0fa8c0@elitecore1561>
From: "Darshak" <darshak@elitecore.com>
To: <dedekind@infradead.org>
References: <2785.192.168.15.61.1163841555.squirrel@newwebmail.elitecore.com>
	<1163854310.5597.62.camel@sauron>
Subject: Re: starter!
Date: Mon, 20 Nov 2006 10:09:31 +0530
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="utf-8"; reply-type=original
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


is JFFS2 is worth using for NAND flash ?
or it supports only NOR?

I come to know that JFFS2 has some problems at mounting [ takes longer 
time ] and occupies more RAM?
How much time does it take to mount 512 and 1 GB flash? How much RAM does it 
require?

Thanxs!
email: darshak@elitecore.com
----- Original Message ----- 
From: "Artem Bityutskiy" <dedekind@infradead.org>
To: <darshak@elitecore.com>
Cc: <linux-mtd@lists.infradead.org>
Sent: Saturday, November 18, 2006 6:21 PM
Subject: Re: starter!


> Hi,
>
> On Sat, 2006-11-18 at 14:49 +0530, darshak@elitecore.com wrote:
>> Hi All
>> I want to involve in JFFs3 development.
>> Please tell me what is required docs/knowledge for that.
>> How can I proceed for that ?
>
> I guess you may start from the JFFS3 docs available at
> http://www.linux-mtd.infradead.org/tech/JFFS3design.pdf
>
> It is quite old and we changed our minds about several things.
>
> You may also read Szeged guys docs at
> http://www.inf.u-szeged.hu/jffs2/jffs3.php
>
> But the last plan is to base JFFS3 on top of UBI which is a new
> promising piece of software. Look at
>
> http://www.linux-mtd.infradead.org/doc/ubi.html
> http://www.linux-mtd.infradead.org/faq/ubi.html
>
> So, to put it differently, there is no cool and clean documentation.
> There is some code and prototypes but they are far from something usable
> yet. But if you are eager enough you withstand this :-)
>
> Alternatively, there is a LogFS project, see
> http://www.linux-mtd.infradead.org/doc/logfs.html
>
> I do not follow it but there is some code exist. You may be interested.
>
> -- 
> Best regards,
> Artem Bityutskiy (Битюцкий Артём)
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
