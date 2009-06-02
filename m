Received: from sigma.superhosting.bg ([91.196.124.10])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MBUcv-0004Na-U6
	for linux-mtd@lists.infradead.org; Tue, 02 Jun 2009 14:06:12 +0000
Message-ID: <4A25314C.4070403@rsc.bg>
Date: Tue, 02 Jun 2009 17:03:56 +0300
From: Stanislav Popov <s.popov@rsc.bg>
MIME-Version: 1.0
To: dedekind@infradead.org
Subject: Re: UBIFS ubimkvol issue and some others...
References: <4A1E8740.9050208@rsc.bg>	
	<1243946645.5847.29.camel@localhost.localdomain>
	<4A252AAF.5060105@rsc.bg>
	<1243950022.5847.33.camel@localhost.localdomain>
In-Reply-To: <1243950022.5847.33.camel@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Cool!

I just made some tests...
ubiformat and mtdinfo are fixed!
Just remaining the issue with ubimkvol kernel panic... :(

Thanks,
Stanislav

Artem Bityutskiy wrote:
> On Tue, 2009-06-02 at 16:35 +0300, Stanislav Popov wrote:
>   
>> Hi!
>> thanks for the patch!
>>
>> Is this the patch that solves these issues:
>> http://git.infradead.org/mtd-utils.git?a=commit;h=e783e75e09b4a0a519665afd7bdeaf2985e7a09c
>> ?
>>     
>
> Right, _supposedly_ solves.
>
>   
