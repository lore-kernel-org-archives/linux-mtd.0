Received: from mail-yx0-f177.google.com ([209.85.213.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QwXgU-0008KP-Cu
	for linux-mtd@lists.infradead.org; Thu, 25 Aug 2011 11:01:19 +0000
Received: by yxk8 with SMTP id 8so1917584yxk.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 25 Aug 2011 04:01:16 -0700 (PDT)
Subject: Re: UBIFS: mount based on UUID?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Wolfgang Denk <wd@denx.de>
Date: Thu, 25 Aug 2011 14:03:08 +0300
In-Reply-To: <20101026055332.B14FD152451@gemini.denx.de>
References: <20101026055332.B14FD152451@gemini.denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1314270192.18988.38.camel@sauron>
Mime-Version: 1.0
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

On Tue, 2010-10-26 at 07:53 +0200, Wolfgang Denk wrote:
> Hi,
> 
> is there any way to mount UBIFS based on the UUID like we can do for
> "normal" file systems, i. e. by using "UUID=..." instead of a device
> name in /etc/fstab ?
> 
> I see there is a UUID in the file system's super block, but I can't
> see it is exposed to any sort of regular user interface.
> 
> Am I missing something?

I said that I may look at this, and this mail is still in my todo box.
But unfortunately, I've realized that I am unable to do many things I
wanted to. In the past, MTD/UBIFS was very related to my regular work,
but now my work has no relation with MTD/UBIFS, so I do not have much
own time for it. Thus, I am dropping many of my TODO items.

Just wanted to let you know.

-- 
Best Regards,
Artem Bityutskiy
