Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18YarB-00027g-00
	for <linux-mtd@lists.infradead.org>; Tue, 14 Jan 2003 23:52:33 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20030115001930.GD19834@wohnheim.fh-wedel.de> 
References: <20030115001930.GD19834@wohnheim.fh-wedel.de>  <20030114214510.GC19834@wohnheim.fh-wedel.de> <E18XNfT-0003Sp-00@spoinky.renegade.org.uk> <5351.1042586313@passion.cambridge.redhat.com> 
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
Cc: Simon Evans <spse@secret.org.uk>, linux-mtd@lists.infradead.org
Subject: Re: default readv/writev functions 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 15 Jan 2003 00:23:22 +0000
Message-ID: <6905.1042590202@passion.cambridge.redhat.com>
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

joern@wohnheim.fh-wedel.de said:
>  How about the STMicro flashes with built-in ecc checks? Write less
> than 8 bytes per vector element and you're dead. Other than that, you
> are right. A central version is better for almost all chips.

The intention is that drivers can set their own readv/writev methods to 
point at these default functions, _if_ they want to. Chips which can't use 
these functions can still provide their own.

Think of it like generic_file_read etc. for file systems. You use them if 
you don't have special requirements -- otherwise you write your own.

--
dwmw2
