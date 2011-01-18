Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Pf7N8-0002YV-O8
	for linux-mtd@lists.infradead.org; Tue, 18 Jan 2011 08:57:05 +0000
Received: by mail-fx0-f49.google.com with SMTP id 19so6932431fxm.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 18 Jan 2011 00:57:02 -0800 (PST)
Subject: Re: What if the UBI flasher can't skip all-FF pages?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: J Barlow <jbarlow@ivl.com>
In-Reply-To: <loom.20110110T205414-506@post.gmane.org>
References: <loom.20110110T205414-506@post.gmane.org>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 18 Jan 2011 10:56:54 +0200
Message-ID: <1295341014.2470.81.camel@koala>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-01-10 at 22:47 +0000, J Barlow wrote:
> Hi everyone,
> 
> I am developing an embedded system with a NAND flash.  We're intending to 
> program all of the NAND flashes in a factory programmer.  I've read "how the UBI 
> flash should work" and I suspect that the UBI flasher doesn't work that way.  
> Specifically, I'm pretty sure it doesn't know how to skip pages containing only 
> FFs.  Unfortunately, the flasher's software is proprietary, not to mention only 
> available in Chinese.  It might well work as expected, but testing this would 
> also be difficult and expensive since the flasher is in a factory in China. 
> 
> I believe that UBIFS is doing the right thing.  I blame the flasher, but I don't 
> think I can do anything about it.

But yes, UBI/UBIFS stack could do better job in this respect, but I do
not have time to implement this. But it you wish to do this - I can only
help you by suggestions.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
