Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17cQrF-0001Vt-00
	for <linux-mtd@lists.infradead.org>; Wed, 07 Aug 2002 14:28:13 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1028726139.19447.255.camel@thomas.tec.linutronix.de> 
References: <1028726139.19447.255.camel@thomas.tec.linutronix.de>  <3D511B55.6ADABE4D@sgi.com> 
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Steven Hein <ssh@sgi.com>, linux-mtd@lists.infradead.org
Subject: Re: Hardware ECC in NAND flash driver 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 07 Aug 2002 14:28:05 +0100
Message-ID: <20434.1028726885@redhat.com>
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

tglx@linutronix.de said:
> We thougt about that already, but nobody made an attempt to do so,
> because we had no hardware supporting this.

Except the DiskOnChip, which probably ought to be using the generic NAND 
driver too.

--
dwmw2
