Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17mbxO-0001hI-00
	for <linux-mtd@lists.infradead.org>; Wed, 04 Sep 2002 16:20:38 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.33.0209041551460.22265-100000@hex.linuxgrrls.org> 
References: <Pine.LNX.4.33.0209041551460.22265-100000@hex.linuxgrrls.org> 
To: Jasmine Strong <jasmine@hex.linuxgrrls.org>
Cc: Allen Curtis <acurtis@onz.com>,
    John Hall <John.Hall@optionexist.co.uk>,
    "Linux MTD list (E-mail)" <linux-mtd@lists.infradead.org>
Subject: Re: Stable cvs version for 2.4 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 04 Sep 2002 16:20:22 +0100
Message-ID: <6203.1031152822@redhat.com>
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

jasmine@hex.linuxgrrls.org said:
> > How about we add 1 byte which contains up to 8 bit fields?
> Adding a byte will destroy the alignment.  you'd have to add a whole
> word. 

Er, what alignment?

Either the CPU or something else assumes and requires alignment, in which 
case we know that we can happily abuse the low-bit of the address.

Or it doesn't, in which case we can add our single byte and use it with 
impunity. And yes, Allen's right that if we're going to add a single byte 
to the structure we should just put the colour information into that 
instead of using it to align the pointer so that we can abuse the low bit 
of the pointer :)

--
dwmw2
