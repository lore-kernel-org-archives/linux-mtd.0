Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17aYxJ-0003Hn-00
	for <linux-mtd@lists.infradead.org>; Fri, 02 Aug 2002 10:42:45 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <003b01c23a06$c83c3940$0200a8c0@telia.com> 
References: <003b01c23a06$c83c3940$0200a8c0@telia.com>  <003d01c2399a$b519a9e0$0200a8c0@telia.com> <FA06AA2C99BCD511951200005A99441001E3ECD8@irvexch1.sextantifs.com> <12285.1028244660@redhat.com> 
To: "Joakim Tjernlund" <Joakim.Tjernlund@lumentis.se>
Cc: linux-mtd@lists.infradead.org
Subject: Re: write suspend and/or erase suspend 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 02 Aug 2002 10:42:43 +0100
Message-ID: <1236.1028281363@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Joakim.Tjernlund@lumentis.se said:
>  Yes, it's silly but can it happen by mistake? The flash state machine
> may be  confused if an access is made during suspend. 

You'll get a buffer full of status bits, I expect. Doesn't matter -- the 
contents of the block at that time are undefined because they're in the 
middle of an erase.

> hmm, my modified driver also supports "suspend erase to do a write".
> Could that be a problem? 

Again, only if someone's trying to write to a block they're currently 
trying to erase -- which they shouldn't be doing.

We _should_ be checking for these things in the driver, and we _definitely_ 
have to do so before start suspending writes to perform reads. But at the 
moment, the only way a user could trigger wrong behaviour is if they're 
doing something bloody stupid anyway.


--
dwmw2
