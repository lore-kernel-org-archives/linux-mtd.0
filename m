Received: from nat1.arcom.co.uk ([194.200.159.172] helo=arcom.com)
	by pentafluge.infradead.org with asmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AtlSM-0002cG-Du
	for linux-mtd@lists.infradead.org; Thu, 19 Feb 2004 10:30:58 +0000
Message-ID: <4034905F.505@arcom.com>
Date: Thu, 19 Feb 2004 10:30:55 +0000
From: David Vrabel <dvrabel@arcom.com>
MIME-Version: 1.0
To: linux-mtd list <linux-mtd@lists.infradead.org>
References: <20040218230358.72448.qmail@web20727.mail.yahoo.com>
In-Reply-To: <20040218230358.72448.qmail@web20727.mail.yahoo.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: Help: Error on mounting JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>>> cfi_cmdset_0002: Disabling fast programming due to code 
>>> brokenness.
>> 
>> 
>> What MTD version you are using? I recommend to get the latest code
>> from CVS, since there was another bug in the cmdset2. You should
>> in fact get two "Disabled X due to bugs" messages.
> 
> 
> The version of cfi_cmdset_0002.c is 1.94, which is almost up-to-date 
> without David Vrabel's patches. I have some questions on the 
> debugging messages shown below. [...] MTD do_write_oneword(): WRITE 
> 0x00780000(0xc03bdd84) MTD do_write_oneword(): Check 0xffffffff 
> 0xffffffff MTD do_write_oneword(): Check 0xffffffff 0xffffffff

This looks like you're not write-enabling the flash device or the
sectors are write protected so nothing ever gets written.  I'm a bit
surprised the write didn't fail with an error though.  The datasheet I
have here for the AM29LV128M doesn't say what the chip is supposed to do
when you try to erase/program protected sectors.

The reason the latest CVS appears to work better is because it no longer
checks the flash to see if the data actually got written -- it assumes
the status reported by the chip is correct.

David Vrabel
-- 
David Vrabel, Design Engineer

Arcom, Clifton Road           Tel: +44 (0)1223 411200 ext. 3233
Cambridge CB1 7EA, UK         Web: http://www.arcom.com/
