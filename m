Received: from [63.81.120.155] (helo=imap.sh.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HvBje-0002UN-CU
	for linux-mtd@lists.infradead.org; Mon, 04 Jun 2007 08:32:38 -0400
Message-ID: <466406BB.3070607@ru.mvista.com>
Date: Mon, 04 Jun 2007 16:34:03 +0400
From: Sergei Shtylyov <sshtylyov@ru.mvista.com>
MIME-Version: 1.0
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH] powerpc: Create "rom" (MTD) device prpmc2800
References: <7fc919fce0761f861be3069a853d3169@bga.com>	
	<1180769992.14025.1.camel@localhost.localdomain>	
	<4662E7EA.70506@ru.mvista.com>	
	<d067769912d2ed5c9e1b4770b77303dd@kernel.crashing.org>	
	<46630256.8050909@ru.mvista.com>
	<1180904670.31677.18.camel@localhost.localdomain>
In-Reply-To: <1180904670.31677.18.camel@localhost.localdomain>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: ppcdev <linuxppc-dev@ozlabs.org>, linux-mtd@lists.infradead.org,
	Milton Miller <miltonm@bga.com>,
	Segher Boessenkool <segher@kernel.crashing.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Benjamin Herrenschmidt wrote:
>>>>the CFI/JEDEC interface then can be deduced by probing

>>>Most of the time, sure.  Not always.

>>    That's the way the cookie crumbles in Linux MTD for now. It's
>>*always* 
>>detecting this by probing -- you only can say what [not] to probe. 

> So you are saying that because the current linux MTD stuff can only
> probe (which doesn't always work), we should not put the proper chip
> interface type in the device-tree ?

    No. But if/when we put it, it'll only be able to influence interface 
probing, but not "force" the interface.

> Your argument makes no sense to me.

    As I said, that's the way the cookie crumbles.

> Put the proper interface informations in the device-tree, maybe some OS
> smarter than linux will make good use on it and maybe linux will be
> fixed at one point too (not by you, of course, you gave us that line
> often enough about not being paid to do the right thing).

    The money was not the only factor, you know, I was under the pressure of 
schedules, and had a lot more things to do.

> Ben.

WBR, Sergei
