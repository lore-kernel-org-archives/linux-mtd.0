Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15NN7a-0003tE-00
	for <linux-mtd@lists.infradead.org>; Fri, 20 Jul 2001 00:22:18 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <F9102D41F595D311ACA7009027DE2C84033D4D78@c3po.heurikon.com> 
References: <F9102D41F595D311ACA7009027DE2C84033D4D78@c3po.heurikon.com> 
To: "McNutt, Scott" <smcnutt@artesyncp.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Magic bitmask 0x1985 not found 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 20 Jul 2001 00:28:00 +0100
Message-ID: <13383.995585280@redhat.com>
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


smcnutt@artesyncp.com said:
> mount: block device /dev/mtdblock/2 is write-protected, mounting
> read-only

Why JFFS2 if it's readonly and the sectors are protected? Surely cramfs 
would suffice? JFFS2 doesn't deal nicely with the read-only case ATM, 
although it's simple enough to fix. That's not the main problem though.

> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00020000: 0xe002 instead

What's at offset 0x1fffc in the partition? 0x1985? What '-e' value was 
given to mkfs.jffs2? 

--
dwmw2
