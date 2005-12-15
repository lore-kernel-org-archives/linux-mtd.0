Received: from www.mw-itcon.de ([213.146.115.73])
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EmsZi-0000xJ-RM
	for linux-mtd@lists.infradead.org; Thu, 15 Dec 2005 07:51:12 -0500
Message-ID: <43A166C6.5060803@mw-itcon.de>
Date: Thu, 15 Dec 2005 13:51:18 +0100
From: Peter Menzebach <pm-mtd@mw-itcon.de>
MIME-Version: 1.0
To: Steven Scholz <steven.scholz@imc-berlin.de>
References: <43A1418F.3060701@imc-berlin.de>	<20051215102607.GA20431@angel.research.nokia.com>
	<43A1609C.80705@imc-berlin.de>
In-Reply-To: <43A1609C.80705@imc-berlin.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Do I have to umount JFFS2?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Steven Scholz wrote:
> Jarkko Lavinen wrote:
>> On Thu, Dec 15, 2005 at 11:12:31AM +0100, ext Steven Scholz wrote:
>>
>>> Now I wonder if it is needed to umount this partition explicitly before
>>> rebooting? Or mount it read only first by having
>>
>> JFFS2 is synhronous except for the write buffer (used with Nand chips).  
>> Doing sync is enough and flushes the write buffer.
> 
> Is "sync()" done by the kernel before reboot? Or do I have to call "sync"?
> 
Hi Steven,
afaik,
and this this is inline with my experience, you have call sync before 
reboot.
Since I write only complete files to jffs2, I reduced the timer, which 
flushes the write buffer automatically from 3 seconds to 500 ms.
In that case, I normally get no errors even in case of a hard reset.

Otherwise I get some "found empty flash at" and some CRC errors. The 
filesystem as whole should remain in a stable state in any case (that's 
the main reason apart from wear levelling for jffs2, I think)


Best regards
Peter


-- 
Peter Menzebach
Menzebach und Wolff IT-Consulting GbR
Phone +49 751 355 387 1
