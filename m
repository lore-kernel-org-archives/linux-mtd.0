Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 191Ngr-0005HV-L0
	for <linux-mtd@lists.infradead.org>; Fri, 04 Apr 2003 10:40:53 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: jimzeus@vip.sina.com
In-Reply-To: <20030404062136.7806.qmail@vip.sina.com>
References: <20030404062136.7806.qmail@vip.sina.com>
Message-Id: <1049449251.1980.90.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Fri, 04 Apr 2003 10:40:52 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: [SPAM] FAT on NAND
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2003-04-04 at 07:21, jimzeus@vip.sina.com wrote:
> Hi, all:
> 
> 
> What I am doing now is to build a filesystem which can be 
> recognized on _raw_ NAND flash. So, I think FAT will be the only
> choice(though I know it's very unstable). And I have following question now:

Windows won't recognise raw NAND flash anyway. You'll have to write
_some_ kind of driver for Windows.

> 1.How unstable would it be? Does it support: 
>      a.journaling (crash/power-off safe ,I mean)

No.

>      b.bad block management

No.

>      c.wear levelling

No.

>      d.error correction

No.

>      e.something else I dont know to make the FS reliable

No.

> 2.I have checked the NAND flash docoment (especially 
> the "Filesystems supporting NAND"chapter) and I found out that
> it seems no way to build a FAT on a bare NAND flash but only on 
> the SmartMediaCards, am I right? Or the SM card and the bare NAND
> are just the same thing when a FAT on it.
> 3.Maybe I misunderstood,but David Woodhouse had told me that I should apply layers like FAT->NFTL->NAND if I wanna build a FAT on
> a NAND flash.But I learned that the NFTL only support Doc from the
> NAND flash document, isnt it? And what should I do to support the 
> FAT ?

I told you to use the SmartMedia format, not NFTL. You can do that on
any NAND hardware; NFTL has silly patent problems in some parts of the
world.

But really you should have a file system directly on the flash, not a
translation layer pretending to be a block device.

> 4.Everybody tells me that the Fat on a NAND is not reliable,but I 
> think USB mass storage are based on NAND and got a FAT (or some 
> filesystem which windows can recognize) on it, so ,how comes it 
> happen?

It's not reliable, as you were told.

> BTW:Why my mail sent to the maillist always "awaits moderator approval"?

The ones you send as HTML get bounced for that reason. The rest are
trapped because SpamAssassin doesn't like them...

X-Spam-Status: Yes, hits=7.7 required=5.0
        tests=AWL,NO_REAL_NAME,RCVD_IN_OSIRUSOFT_COM,RCVD_IN_RFCI,
        SPAM_PHRASE_00_01,X_OSIRU_SPAM_SRC version=2.44

-- 
dwmw2
