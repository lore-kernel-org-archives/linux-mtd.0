Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EWz1C-0004Zy-Uj
	for linux-mtd@lists.infradead.org; Tue, 01 Nov 2005 11:29:55 -0500
Message-ID: <43679866.8010808@ru.mvista.com>
Date: Tue, 01 Nov 2005 19:31:34 +0300
From: Sergei Shtylylov <sshtylyov@ru.mvista.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <4363DF17.6080906@ru.mvista.com>	
	<1130745519.12171.93.camel@localhost.localdomain>	
	<1130769581.6003.43.camel@localhost>	
	<1130774403.12171.111.camel@localhost.localdomain>	
	<1130856543.16267.38.camel@localhost>
	<436789E3.6010706@ru.mvista.com>
	<1130860239.16267.62.camel@localhost>
In-Reply-To: <1130860239.16267.62.camel@localhost>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] NAND: Fix NAND ECC errors on AMD Au1550
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello.

Leif Lindholm wrote:

>>    Note, that with NAND_CMD_READID page_addr of -1 is always passed (so we 
>>only write out the 1-byte column address) on the address phase, and we just 
>>won't get there for READID command....

>>    Therefore, neither -CE wil be overridden nor local_irq_save() be executed 
>>for READID case...

> Well, I guess I cheated a bit.

    Especially with separation of setting ce_override to 1 and a real -CE
override -- that's a potentially dangerous trick. :-)

> In the more well-tested version of the driver (using your older patch),

    Do you mean the patch originally posted? I wasn't participating in it then
(woulnd't even have posted such stuff :-).

> I actually do the force-assert for (column != -1) as well.

    I guess, you'd better set ce_override to 1 at the exact place where you
start to override -CE.

>>    Has your READID problem arisen with or without my patch?

> Your patch fixed the problem of a collision with the NOR flash.
> But only after I added the READID force-assert. Before that it caused
> the NAND chip to stop being detected.

    Kind of strange. I have the datasheet of that Samsung part before me, and
it doesn't even have R/-B line on the Read ID timing diagrams...

WBR, Sergei
