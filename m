Received: from bitbox.plus.com ([81.174.226.42] helo=galago.localnet)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UJU69-0003Du-KT
 for linux-mtd@lists.infradead.org; Sat, 23 Mar 2013 19:27:27 +0000
Message-ID: <514E0229.5040502@bitbox.co.uk>
Date: Sat, 23 Mar 2013 19:27:37 +0000
From: Peter Horton <phorton@bitbox.co.uk>
MIME-Version: 1.0
To: David Mosberger-Tang <dmosberger@gmail.com>
Subject: Re: on-die ECC support
References: <CACwUX0M-04vCTkA8WwNR9si=7N-xuYOTy6aWO7ty8xa1+S3rUw@mail.gmail.com>
 <514C147B.3030609@bitbox.co.uk>
 <CACwUX0MqJwed7fGm7miN2meFikY4NhfejhW=Q_NOJ3Fj04475A@mail.gmail.com>
In-Reply-To: <CACwUX0MqJwed7fGm7miN2meFikY4NhfejhW=Q_NOJ3Fj04475A@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 22/03/2013 21:14, David Mosberger-Tang wrote:
>
> I ended up going with a brutally simple approach: read the page and if
> it gets the REWRITE status bit, read it again with on-die ECC turned
> off, then do a bitdiff of the data read (and the ECC bytes read) to
> count the number of bitflips.  While perhaps brutish, this approach
> has the advantage of only relying on documented features.  As long as
> the layout described by ecc->layout is accurate, this should work
> reliably.  Thus, Micron can screw around with the ECC encoding as they
> wish, as long as the layout doesn't change, we're fine.
>

I prefer this solution to ours, much simpler and probably faster too.

> Note that the patch below doesn't check for bitflips in the OOB areas
> that Micron calls "User metadata I".  We don't care about those bits
> since our file system doesn't use OOB at all.
>
> Do you have any recommendation on a good value for bitflip_threshold?
> 1 is obviously too small and 4 feels a bit like playing with fire, no?
>

IIRC we reprted only when there were three or more bit errors in a page. 
This would allow two bits with fixed states per page.

P.
