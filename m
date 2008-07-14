Received: from rn-out-0910.google.com ([64.233.170.191])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KIROG-0008Be-TX
	for linux-mtd@lists.infradead.org; Mon, 14 Jul 2008 16:59:09 +0000
Received: by rn-out-0910.google.com with SMTP id m7so1477232rnd.3
	for <linux-mtd@lists.infradead.org>;
	Mon, 14 Jul 2008 09:59:07 -0700 (PDT)
Message-ID: <be4b62bb0807140959l24f0f551w1629d6c722d19079@mail.gmail.com>
Date: Mon, 14 Jul 2008 17:59:07 +0100
From: "Andre Oliveira" <anbadeol@gmail.com>
To: jmalone@jsoft.ca
Subject: Re: DiskOnChip 2000
In-Reply-To: <2542.128.100.203.197.1215792479.squirrel@128.100.203.197>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <2542.128.100.203.197.1215792479.squirrel@128.100.203.197>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jul 11, 2008 at 5:07 PM, Jesse Malone <jmalone@jsoft.ca> wrote:
> I'm trying your driver on a diskonchip 2000 D2202-D16 and seem to be
> running into problems writing to the DOC. Have you had success writing to
> the DOC?

Hi!
Yes, I have been using this patch without problems since kernel
2.6.22, through 2.6.25 (which I'm currently using). I have a
DiskOnChip 2000 MD2202-D32-X.

> I'm using a 2.6.22 kernel with your patch. I fairly conistently
> get a bunch of kernel Oops's after writing a significant amount of data (a
> few megabytes). I'll post the Ooops's for you, hopefully they might
> provide a clue. Any thoughts?

Sorry, no clue. :-(
I think the only part that seems related to the doc2000 is this:

> kernel BUG at block/elevator.c:780!
> ...
> Call Trace:
>  [<c017f286>] end_request+0x2a/0x38
>  [<c01bc684>] doc2000_request+0x20/0x38

The BUG trap in block/elevator.c is BUG_ON(list_empty(&rq->queuelist));
But I don't know what this means. :-(
I'm sorry I can't be more helpful...
-- 
Andre Oliveira
http://anbadeol.googlepages.com/
