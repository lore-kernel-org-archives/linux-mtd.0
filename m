Received: from mail.datacast.com ([209.87.232.171] helo=datacast.com)
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Or8Dy-0001hx-Fd
	for linux-mtd@lists.infradead.org; Thu, 02 Sep 2010 11:44:59 +0000
Received: from [192.168.2.130] by datacast.com (MDaemon PRO v9.6.1)
	with ESMTP id md50002095392.msg
	for <linux-mtd@lists.infradead.org>; Thu, 02 Sep 2010 07:44:55 -0400
Message-ID: <4C7F900C.4000608@datacast.com>
Date: Thu, 02 Sep 2010 07:52:44 -0400
From: Jonne Mintern <jmintern@datacast.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: Reporting nand bad blocks in Linux
References: <4C7E4540.9040203@datacast.com> <1283383683.2209.69.camel@brekeke>
In-Reply-To: <1283383683.2209.69.camel@brekeke>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: jmintern@datacast.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thanks. I did just that yesterday.

On 09/01/2010 07:28 PM, Artem Bityutskiy wrote:
> On Wed, 2010-09-01 at 08:21 -0400, Jonne Mintern wrote:
>    
>> To report nand bad blocks, I have been using cmd 'nand bad' from
>> uboot. What Linux cmd will get thesame report from a Linux prompt? I'm
>> using Denx eldk4.2 on an AMCC PPC440EPx. I'm not sure what nand chip.
>>      
> Hmm, I think this utility does not exist, and you need to implement it,
> but I am not 100% sure.
>
>    
