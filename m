Received: from [85.21.88.6] (helo=buildserver.ru.mvista.com)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KCJDZ-00018F-Fa
	for linux-mtd@lists.infradead.org; Fri, 27 Jun 2008 19:02:45 +0000
Date: Fri, 27 Jun 2008 23:02:43 +0400
From: Anton Vorontsov <avorontsov@ru.mvista.com>
To: Scott Wood <scottwood@freescale.com>
Subject: Re: [PATCH] MTD: NAND: fsl_elbc_nand: implement support for
	flash-based BBT
Message-ID: <20080627190243.GA4713@polina.dev.rtsoft.ru>
References: <20080626184156.GA2356@polina.dev.rtsoft.ru>
	<48648662.1050107@call-direct.com.au>
	<20080627145512.GA11372@polina.dev.rtsoft.ru>
	<4865079A.2020300@freescale.com>
	<20080627160019.GA32374@polina.dev.rtsoft.ru>
	<48651570.5020409@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf8
Content-Disposition: inline
In-Reply-To: <48651570.5020409@freescale.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	Iwo Mergler <iwo@call-direct.com.au>
Reply-To: avorontsov@ru.mvista.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jun 27, 2008 at 11:29:36AM -0500, Scott Wood wrote:
> Anton Vorontsov wrote:
>> On Fri, Jun 27, 2008 at 10:30:34AM -0500, Scott Wood wrote:
>>> Anton Vorontsov wrote:
>>>> Just looked into x16 LP NAND spec, and it says that block should be
>>>> considered as bad when the first _Word_ isn't 0xff. So we indeed should
>>>> not ignore the second byte. Ouch.
>>> The FCM doesn't support 16-bit devices.
>>
>> And will never support? 
>
> It's a hardware limitation in current chips (see the manual description  
> of BRn[PS]), though upon further looking it seems that it may be  
> supported in the future.
>
>> Then maybe, in addition, we could apply the first
>> patch that you've acked so we'll unbreak NANDs for pour souls that tried
>> to reflash the JFFS2 into NAND, so that they'll will not have to
>> "nand scrub" their NANDs?
>
> OK -- we can limit it to 8-bit chips once 16-bit support is added to the  
> driver.

Great. So.. the final patchset.

-- 
Anton Vorontsov
email: cbouatmailru@gmail.com
irc://irc.freenode.net/bd2
