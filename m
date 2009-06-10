Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MEJHl-0008BO-3K
	for linux-mtd@lists.infradead.org; Wed, 10 Jun 2009 08:35:59 +0000
Subject: Re: Problem in erasing a nand flash with ubiformat
From: Artem Bityutskiy <dedekind@infradead.org>
To: Canella Matteo <Matteo.Canella@mta.it>
In-Reply-To: <BD9F3F3F5A6CCF4BA032B9FED4DD312E893B13@mta-digimail.MTA.INT>
References: <BD9F3F3F5A6CCF4BA032B9FED4DD312E893B13@mta-digimail.MTA.INT>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 10 Jun 2009 11:35:37 +0300
Message-Id: <1244622937.5847.396.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-06-10 at 10:27 +0200, Canella Matteo wrote:
> Hi all,
> I have a question for Artem,
> I'm running a problem with ubiformat and I saw this email from you:
> 
> http://lists.infradead.org/pipermail/linux-mtd/2009-January/024285.htm
> 
> I'm having the same problem, ubiformat fails to format a nand flash because it is not able to erase a block.
> flash_eraseall just ignore this erase problem.

Sorry, I am not sure what you mean. You say that ubiformat gets an
erase error and instead of marking the eraseblock as bad it exits?

Are you using the newest ubiformat version from the mtd-utils git
tree?

The latest ubiformat does have code which makrs a block as bad on
write and erase errors. See the 'mark_bad()' function. If this
does not work for you, could you please try to use gdb and figure
out why? The code currently tries to mark the eraseblock as bad
only in case of an EIO errors, may be this is the problem?

> Do you think ubiformat should physically mark this block as bad eraseblock? Or should it just ignore it?
Yes it should. And there is already code in ubiformat which implements
this.

> Why currently ubiformat or flash_eraseall does not mark these as bad blocks?

It does. Make sure you use the latest ubiformat. Not sure about
flash_eraseall, I do not use it nowadays.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
