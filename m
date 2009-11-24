Received: from smtp-vbr4.xs4all.nl ([194.109.24.24])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NCrNm-0004RU-FM
	for linux-mtd@lists.infradead.org; Tue, 24 Nov 2009 09:08:27 +0000
Message-ID: <4B0BA26F.2020707@aimvalley.nl>
Date: Tue, 24 Nov 2009 10:07:59 +0100
From: Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
MIME-Version: 1.0
To: Nicolas Pitre <nico@fluxnic.net>
Subject: Re: [PATCH] enable erase-suspend-program for CFI cmdset_0002
References: <200911191101.nAJB1wwH000784@linpc062.aimsys.nl>
	<alpine.LFD.2.00.0911221243070.2059@xanadu.home>
In-Reply-To: <alpine.LFD.2.00.0911221243070.2059@xanadu.home>
Content-Type: text/plain; charset=US-ASCII; format=flowed
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


Nicolas Pitre wrote:
> On Thu, 19 Nov 2009, Norbert van Bolhuis wrote:
> 
>> erase-suspend for writing is required to avoid blocking applications that wish
>> to write some data (to a NOR block other than the one being erased).
>> Particularly, it solves some huge delays that an application (which writes to a
>> UBIFS) will experience if UBI attaches to empty NOR flash. In this case the
>> UBI background thread will erase a lot of blocks and the application can be blocked
>> for minutes because of the "MTD/CFI chip lock".
>> This feature has been disabled for years. Maybe this was because the old code
>> turned it on for erase-suspend read-only chips also (cfip->EraseSuspend & 0x1).
>> This is wrong and corrected now.
>> I tested this patch and it seems to work fine.
>>
>> Signed-off-by: Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
> 
> FYI: I have no experience with non-Intel parts and no good knowledge of 
> the cmdset_0002 code.  So I can't review this.
> 

OK.

so, who's approving/reviewing patches for cmdset_0002. Nobody ?
