Received: from hermes.chez-thomas.org ([63.225.98.241])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AMq6a-0007bU-Mn
	for <linux-mtd@lists.infradead.org>; Thu, 20 Nov 2003 14:48:24 +0000
From: Gary Thomas <gary@mlbassoc.com>
To: ghannon@cspi.com
In-Reply-To: <85256DE4.004F812B.00@pine.cspi.com>
References: <85256DE4.004F812B.00@pine.cspi.com>
Message-Id: <1069339584.1961.654.camel@hermes>
Mime-Version: 1.0
Date: 20 Nov 2003 07:46:24 -0700
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: MTD and Intel rev J Strata Flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2003-11-20 at 07:36, ghannon@cspi.com wrote:
> Hi,
> 
> I'm assuming the linux-mtd list has long since vanished.

Not that I'm aware of - I've copied this to that list.

> 
> I'm working with a rev J strata flash part.
> 
> It has the "feature" that it's lock-bits can be set individually,
> but are cleared colllectively.    I have made a 3 partition system
> where I mainly want two partitions locked except when I am updating
> them, and the third one unlocked always.
> 
> Has any effort  been put into the MTD layer to take into account that
> an unlock clears all the bits and some should be put back on.
> I didn't see anything like that in the code.
> 
> I will put the functionality into my tools if it is not in a lower layer
> already.
> 
> Thanks,
> 
> Gary Hannon
> CSPI
> 
> 
> ** Sent via the linuxppc-embedded mail list. See http://lists.linuxppc.org/
-- 
Gary Thomas <gary@mlbassoc.com>
MLB Associates
