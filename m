Received: from pophost.cs.tamu.edu
	([128.194.130.106] helo=cs.tamu.edu ident=0)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19QV1k-0004Vc-Uw
	for <linux-mtd@lists.infradead.org>; Thu, 12 Jun 2003 17:34:17 +0100
Date: Thu, 12 Jun 2003 11:34:47 -0500 (CDT)
From: Siddharth Choudhuri <choudhri@cs.tamu.edu>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1055348742.2097.257.camel@passion.cambridge.redhat.com>
Message-ID: <Pine.GSO.4.44.0306121122060.25764-100000@unix.cs.tamu.edu>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2 vs. ext3
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> JFFS2, on the other hand, works directly with the flash and does not
> suffer the same problems.

Yes, I noticed that with JFFS2, the size (in bytes) of write requests sent
to NOR chips were not in any multiples (as opposed to ext3). For eg:
`touch filename` -or- `echo "abcd" > foo` would send multiple write
requests totalling to around 200-300 bytes.

>From what I understand, NOR chips are byte level programmable, but
changing a 0->1 would require entire block erase which might take around 1
sec. But it did not seem to happen in the above case of creating a file ?
Am I missing something basic here ?

Also, another question that I have is "Is there any reason(s) why one
should use ext3 as opposed to jffs2 on flash based systems"

TIA
-siddharth
