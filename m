Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GiZ22-0007Q4-J2
	for linux-mtd@lists.infradead.org; Fri, 10 Nov 2006 11:15:18 -0500
Message-ID: <4554A592.5000308@ru.mvista.com>
Date: Fri, 10 Nov 2006 19:15:14 +0300
From: Vitaly Wool <vwool@ru.mvista.com>
MIME-Version: 1.0
To: dedekind@infradead.org
Subject: Re: mount costs too long
References: <6d6a94c50611092305v6f52b9b0hfd254e10a2992d44@mail.gmail.com>	<1163159781.19697.24.camel@crusty.rchland.ibm.com>	<6d6a94c50611100648g87770a0qb723fad11fa65cd8@mail.gmail.com>
	<1163174898.3925.13.camel@sauron>
In-Reply-To: <1163174898.3925.13.camel@sauron>
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

>On Fri, 2006-11-10 at 22:48 +0800, Aubrey wrote:
>  
>
>>I got a clue from YAFFS mailing list, this is a known issue on 2.6.18 kernels.
>>It is caused by the MTD layer rework and corresponding yaffs-mtd layer
>>modifications. Namely, an additional translation had to be implemented
>>for OOB area for 512b page chips.
>>    
>>
>
>Is it possible to describe this in more details? And why YAFFS people do
>not fix this?
>
>  
>
This is more a yaffs1 problem rather than MTD's. The thing is that
yaffs1 blindly presumes SmartMedia OOB layout which is untrue for most
flashes, so an additional translation was implemented within yaffs1.

Vitaly
