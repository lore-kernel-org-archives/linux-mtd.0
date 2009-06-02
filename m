Received: from sigma.superhosting.bg ([91.196.124.10])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MBUBy-0003er-07
	for linux-mtd@lists.infradead.org; Tue, 02 Jun 2009 13:38:21 +0000
Message-ID: <4A252AAF.5060105@rsc.bg>
Date: Tue, 02 Jun 2009 16:35:43 +0300
From: Stanislav Popov <s.popov@rsc.bg>
MIME-Version: 1.0
To: dedekind@infradead.org
Subject: Re: UBIFS ubimkvol issue and some others...
References: <4A1E8740.9050208@rsc.bg>
	<1243946645.5847.29.camel@localhost.localdomain>
In-Reply-To: <1243946645.5847.29.camel@localhost.localdomain>
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

Hi!
thanks for the patch!

Is this the patch that solves these issues:
http://git.infradead.org/mtd-utils.git?a=commit;h=e783e75e09b4a0a519665afd7bdeaf2985e7a09c
?
Artem Bityutskiy wrote:
> On Thu, 2009-05-28 at 15:44 +0300, Stanislav Popov wrote:
>   
>> I have problems with some of the coomands:
>> ------------------------------------------------------
>> # /mtdinfo
>> Count of MTD devices:           6
>> Present MTD devices:
>> mtdinfo: error!: libmtd failed get MTD device 0 information
>>          error 2 (No such file or directory)
>> ------------------------------------------------------
>> The following is one of the main issues:
>> # /ubiformat /dev//mtd5
>> ubiformat: error!: cannot get information about "/dev//mtd5"
>>            error 2 (No such file or directory)
>> ------------------------------------------------------
>>     
>
> This issue has to be solved in the current mtd-utils, I've just
> pushed a fix. Please, verify it.
>
>   
