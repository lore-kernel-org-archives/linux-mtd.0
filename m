Received: from mail.windriver.com ([147.11.1.11])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NcWnm-0004DB-CG
	for linux-mtd@lists.infradead.org; Wed, 03 Feb 2010 04:25:22 +0000
Message-ID: <4B68FC18.7010001@windriver.com>
Date: Wed, 03 Feb 2010 12:31:20 +0800
From: "stanley.miao" <stanley.miao@windriver.com>
MIME-Version: 1.0
To: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: 
References: <1265165796-24686-1-git-send-email-stanley.miao@windriver.com>
	<8bd0f97a1002021916w59fd9f1scc7f21ea929a6244@mail.gmail.com>
In-Reply-To: <8bd0f97a1002021916w59fd9f1scc7f21ea929a6244@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Mike Frysinger wrote:
> On Tue, Feb 2, 2010 at 21:56, Stanley.Miao wrote:
>   
>> During some BSP development process, I found some tools in mtd-utils
>> contain legacy interfaces and it is not suitable with the current linux
>> kernel. I post my patches here in case somebody else need them.
>>     
>
> these are good, but i think people might want to keep support for
> older kernels around.  so you'd have the code try the newer ioctls
> first and if those fail, fall back to the old ones.
> -mike
>
>   
Yeah, we should keep it compatible ASAP. But in the conflict occasion, I 
think, the
new kernel should get the higher priorities than the older kernel. The 
people who
use the old kernels can use the old version mtd-utils(not very old, 
1.3.1 or earlier).

Stanley.
 
