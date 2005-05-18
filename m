Message-ID: <428BC09E.7070307@netwinder.org>
Date: Wed, 18 May 2005 18:24:30 -0400
From: Ralph Siemsen <ralphs@netwinder.org>
MIME-Version: 1.0
To: Munira Ahmed <munira.ahmed@radixs.com>
References: <1116226208.31694.26.camel@server11>	<428899DA.3040507@netwinder.org>
	<1116293182.31694.47.camel@server11>
In-Reply-To: <1116293182.31694.47.camel@server11>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: stdio.h and kernel space
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Munira Ahmed wrote:
> They are not part of the kernel. I downloaded then from AMD's website
> and would like to know how to use them

Okay that explains why I didn't have them :)

There is a good chance that the MTD code in the linux kernel already 
supports whatever chip you have (not sure if you mentioned its type)... 
the CFI support is pretty solid.

-R
