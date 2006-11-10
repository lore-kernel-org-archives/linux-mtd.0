Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GiZKI-0007vA-E6
	for linux-mtd@lists.infradead.org; Fri, 10 Nov 2006 11:34:07 -0500
Message-ID: <4554AA07.5020204@ru.mvista.com>
Date: Fri, 10 Nov 2006 19:34:15 +0300
From: Vitaly Wool <vwool@ru.mvista.com>
MIME-Version: 1.0
To: dedekind@infradead.org
Subject: Re: mount costs too long
References: <6d6a94c50611092305v6f52b9b0hfd254e10a2992d44@mail.gmail.com>	
	<1163159781.19697.24.camel@crusty.rchland.ibm.com>	
	<6d6a94c50611100648g87770a0qb723fad11fa65cd8@mail.gmail.com>	
	<1163174898.3925.13.camel@sauron> <4554A592.5000308@ru.mvista.com>
	<1163176000.3925.15.camel@sauron>
In-Reply-To: <1163176000.3925.15.camel@sauron>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Aubrey <aubreylee@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy wrote:

>On Fri, 2006-11-10 at 19:15 +0300, Vitaly Wool wrote:
>  
>
>>This is more a yaffs1 problem rather than MTD's. The thing is that
>>yaffs1 blindly presumes SmartMedia OOB layout which is untrue for most
>>flashes, so an additional translation was implemented within yaffs1.
>>
>>    
>>
>But Aubrey said it is 2.6.18-only, why?
>
>  
>
B/c due to the MTD layer rework, there's no way now to use custom
oobinfo in yaffs.
Therefore, as yaffs1 presumes the SmartMedia OOB layout one can either
read/write raw OOB but that will most probably break the bad block
handling, or implement a small shim layer putting spare OOB area into
SmartMedia OOB layout or back. Any other way will result in
incompatibility with the older version of yaffs1.

Vitaly
