Received: from tiger.actrix.co.nz ([203.96.16.160] helo=blood.actrix.co.nz)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 190wIc-0000wY-Vi
	for <linux-mtd@lists.infradead.org>; Thu, 03 Apr 2003 05:26:03 +0100
From: Charles Manning <manningc2@actrix.gen.nz>
To: "John Burch" <jburch@vincisystems.com>,
	<linux-mtd@lists.infradead.org>
Date: Thu, 3 Apr 2003 16:26:14 +1200
References: <004301c2f96b$0c111c20$1200a8c0@JOHNB>
In-Reply-To: <004301c2f96b$0c111c20$1200a8c0@JOHNB>
MIME-Version: 1.0
Message-Id: <20030403042559.10A4143BA@blood.actrix.co.nz>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Subject: Re: Can mtd partition span multiple devices
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I believe mtdconcat will do what you want.

On Thu, 03 Apr 2003 10:56, John Burch wrote:
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
>
>
> John
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
