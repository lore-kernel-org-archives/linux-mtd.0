Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 192oBi-0000bX-Dc
	for <linux-mtd@lists.infradead.org>; Tue, 08 Apr 2003 09:10:38 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: John Burch <jburch@vincisystems.com>
In-Reply-To: <001f01c2fd36$9c006c90$1200a8c0@JOHNB>
References: <001f01c2fd36$9c006c90$1200a8c0@JOHNB>
Message-Id: <1049789437.18045.68.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 08 Apr 2003 09:10:38 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: 'Mtd' <linux-mtd@lists.infradead.org>
Subject: Re: Problems making jffs2 utils
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2003-04-07 at 19:50, John Burch wrote:

> .../mips-linux-ld: cannot find -lz

You need zlib compiled for the target and available in the toolchain sys-root.


-- 
dwmw2
