Received: from mail-fx0-f226.google.com ([209.85.220.226])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Mlm4o-0004fo-CR
	for linux-mtd@lists.infradead.org; Thu, 10 Sep 2009 16:00:55 +0000
Received: by fxm26 with SMTP id 26so215712fxm.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 10 Sep 2009 09:00:48 -0700 (PDT)
Message-ID: <4AA922AF.8070001@billgatliff.com>
Date: Thu, 10 Sep 2009 11:00:47 -0500
From: Bill Gatliff <bgat@billgatliff.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: UBIFS power cut issues
References: <2df346410909020235v5258eba3l30ff731841acc71@mail.gmail.com>	<1252390936.5060.47.camel@localhost>	<2df346410909090245v5995842asf3a94ae40da5fa72@mail.gmail.com>
	<1252597344.5060.99.camel@localhost>
In-Reply-To: <1252597344.5060.99.camel@localhost>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, JiSheng Zhang <jszhang3@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy wrote:
> And the text here, just in case someone would review it.
>   

When you mean "something is lost", the correct spelling is "lose".  To 
"loose" means to "disconnect", or "release" something.


> However, UBIFS is sometimes used as a JFFS2 replacement and people may
> want it to behave the same way as JFFS2 if it is mounted synchronously.
> This is doable, but needs some non-trivial development, so this was not
> implemented so far. On the other hand, there was no strong demand. You
> may implement this as an excercise, or you may try to convince UBIFS
> authors to do this.
>   

In summary, the differences in results between JFFS2 and UBIFS in the 
case of interrupted, large synchronous writes are related to differences 
in how the two store and/or compute file sizes?

Based on your documentation, my understanding is that with JFFS2 file 
sizes are stored along with the file data nodes, and are updated as the 
file grows in size--- so an interruption truncates the file at the point 
the interruption occurs.  For UBIFS, in contrast, file sizes are stored 
in separate nodes which might not have been written at the point of 
interruption--- so the state if the file when power is restored depends 
highly upon the precise moment that the interruption occurs.



b.g.

-- 
Bill Gatliff
bgat@billgatliff.com
