Received: from mail.bmail.ru ([194.67.1.203] helo=sovam.com)
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TLxhc-0006mv-KT
 for linux-mtd@lists.infradead.org; Wed, 10 Oct 2012 14:56:05 +0000
Date: Wed, 10 Oct 2012 18:55:56 +0400 (MSK)
From: kyak <bas@bmail.ru>
To: dedekind1@gmail.com
Subject: Re: output file cannot be in the UBIFS root directory check is not
 working quite well
In-Reply-To: <alpine.LNX.2.02.1210081900410.1375@bas>
Message-ID: <alpine.LNX.2.02.1210101855001.1211@bas>
References: <alpine.LNX.2.02.1210032322590.1375@bas>
 <alpine.LNX.2.02.1210051949390.1375@bas>
 <alpine.DEB.2.00.1210081556130.19047@lnxricardw.se.axis.com>
 <alpine.LNX.2.02.1210081833560.1375@bas>
 <alpine.DEB.2.00.1210081650200.19047@lnxricardw.se.axis.com>
 <alpine.LNX.2.02.1210081900410.1375@bas>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Cc: Linux mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thanks Artem, your patch 
(http://lists.infradead.org/pipermail/linux-mtd/2012-October/044477.html) 
has fixed my problem as well.

On Mon, 8 Oct 2012, kyak wrote:

> On Mon, 8 Oct 2012, Ricard Wanderlof wrote:
>
>> Definitely. I see your point now. This must be a definite bug in in_path().
>> 
>> One problem though is that when in_path() traverses the tree upwards, and 
>> encounters a directory which it can't read it can't complete its job. On 
>> the other hand, it shouldn't have to do that, it really only needs to see 
>> that the output file is not below the top level of the input tree. Or am I 
>> missing a case here?
>> 
> Yes, it only needs to check if the output file is above the top level
> of the input tree. But I guess it's not that easy - first things that come 
> into my mind are symbolic links and mount --bind.
>
