Received: from mlbe2k1.cs.myharris.net ([137.237.90.88])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Lyo6C-0003Zj-6P
	for linux-mtd@lists.infradead.org; Tue, 28 Apr 2009 14:15:59 +0000
Message-ID: <49F70F92.7050200@harris.com>
Date: Tue, 28 Apr 2009 10:15:46 -0400
From: "Steven A. Falco" <sfalco@harris.com>
MIME-Version: 1.0
To: Peter Horton <zero@colonel-panic.org>
Subject: Re: [PATCH] Bug in m25p80.c during whole-chip erase
References: <49F61F32.3020003@harris.com>	<8bd0f97a0904271426p30df3a97ke31af72dcf96531f@mail.gmail.com>
	<49F70752.5030702@harris.com> <49F70E43.9050103@colonel-panic.org>
In-Reply-To: <49F70E43.9050103@colonel-panic.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Peter Horton wrote:
> 
> Steven A. Falco wrote:
>> Mike Frysinger wrote:
>>> On Mon, Apr 27, 2009 at 17:10, Steven A. Falco wrote:
>>>> There is a logic error in "whole chip erase" for the m25p80 family.  If
>>>> the whole device is successfully erased, erase_chip() will return 0,
>>>> and
>>>> the code will fall through to the "else" clause, and do
>>>> sector-by-sector
>>>> erase in addition to the whole-chip erase.  This patch corrects that.
>>>>
>>>> Also, the MAX_READY_WAIT_COUNT is insufficient for an m25p16 connected
>>>> to a 400 MHz powerpc.  Increasing it allows me to successfully program
>>>> the device on my board.
>>> in general, trying to set timeouts "close" to the spec gains nothing
>>> with spi flash devices.  the timeout limit is hit only when an error
>>> occurs, and errors should not occur during the normal run of things.
>>> on the other side, having a timeout be wrongly hit when the device is
>>> operating correctly is a much worse situation to be in.
>>> -mike
>>>
>>
>> Right.  This chip takes 13 seconds (typical) to bulk erase, according to
>> the Numonyx data sheet.  So increasing the timeout to account for such
>> a slow part is necessary, and allows me to successfully erase the part.
>>
>> Are there any changes you'd like to see in this patch, or is it ok as
>> written?
>>
> 
> Check the list archives. I submitted a patch for this a few weeks ago
> which has been merged into AKPMs tree.
> 
> P.
> 

Your patch addresses the timing issues, but not the duplicate erase.

I'll resubmit my patch with just the duplicate erase fix, as this is
still needed.

	Steve
