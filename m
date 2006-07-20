Received: from mail.artecdesign.ee ([62.65.32.9] helo=postikukk.artecdesign.ee)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1G3VlF-0001A2-4w
	for linux-mtd@lists.infradead.org; Thu, 20 Jul 2006 06:28:08 -0400
Message-ID: <44BF5BA7.6010803@artecdesign.ee>
Date: Thu, 20 Jul 2006 13:32:07 +0300
From: Indrek Kruusa <indrek.kruusa@artecdesign.ee>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: NAND behind INT13 BIOS interface
References: <44BDFCAE.80807@artecdesign.ee>
	<1153321785.29664.3.camel@shinybook.infradead.org>
In-Reply-To: <1153321785.29664.3.camel@shinybook.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse wrote:
> On Wed, 2006-07-19 at 12:34 +0300, Indrek Kruusa wrote:
>> I have board with NAND and BIOS seems to have built-in driver for that. 
>> BIOS provides INT 13 interface for the NAND too.
>>
>> Is there a solution to access such NAND (with the help of INT 13) as a 
>> usual block device from Linux?
>
> There used to be such a hack -- it's quite evil and fragile though. You
> have to switch back into real mode to invoke the BIOS call, and you need
> to preserve enough of the pre-boot environment that it can still work.
> Running it in vm86 mode might also work, if you're lucky.
>
> Seriously though, I wouldn't bother -- just implement a translation
> layer in Linux which is compatible.

Thanks for the advice.
It may be that I switch to LinuxBIOS and then there could be more 
options to cope with that.

Indrek
