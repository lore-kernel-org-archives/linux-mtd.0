Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 190s7f-000091-0q
	for <linux-mtd@lists.infradead.org>; Thu, 03 Apr 2003 00:58:27 +0100
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
	21 2002)) with SMTP id <0HCQ00FQBQKKY5@smtp-out.bhp.t-online.de> for
	linux-mtd@lists.infradead.org; Thu, 03 Apr 2003 01:57:57 +0200 (MEST)
Date: Thu, 03 Apr 2003 02:58:25 +0200
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <004301c2f96b$0c111c20$1200a8c0@JOHNB>
To: John Burch <jburch@vincisystems.com>, linux-mtd@lists.infradead.org
Message-id: <200304030258.25876.tglx@linutronix.de>
MIME-version: 1.0
References: <004301c2f96b$0c111c20$1200a8c0@JOHNB>
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
Subject: Re: Can mtd partition span multiple devices
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 03 April 2003 00:56, John Burch wrote:
> I'm wondering if a single mtd partition can span more than one physical
> flash device.  For example, if two flash devices span the following
> address ranges, 0x0-0x3FFFFF and 0x400000-0x7FFFFF, can an mtd partition
> be defined as follows?
>
> Name: spanning_partition
> Size: 0x200000
> Offset: 0x300000
>
> So this partition would span physical addresses 0x300000 - 0x3FFFFF
> (device 1) and 0x400000 - 0x4FFFFF (device 2).

Enable MTD concatenating support.

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
