Received: from host155.209-113-146.oem.net ([209.113.146.155] helo=mail.netx4.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14zKVq-0006Zq-00
	for <linux-mtd@lists.infradead.org>; Mon, 14 May 2001 16:43:58 +0100
Message-ID: <3AFFFDAA.328323DD@mvista.com>
Date: Mon, 14 May 2001 11:45:46 -0400
From: "George G. Davis" <davis_g@mvista.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: linux-mtd@lists.infradead.org
Subject: Re: Does MTD include support for STM M58LW064?
References: <3AFC3CD1.1AEBE5EF@mvista.com> <22562.989772843@redhat.com>
Content-Type: multipart/mixed;
 boundary="------------DD047FE524D4358E40460E5C"
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

This is a multi-part message in MIME format.
--------------DD047FE524D4358E40460E5C
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

David Woodhouse wrote:
> 
> davis_g@mvista.com said:
> >  But I'll ask the question anyway in case I missed it: does MTD
> > include support for the ST Microelectronics M58LW064 flash device?
> > This device supports CFI commands. But I don't see any support for it
> > in the current MTD CVS sources.
> 
> There's no such thing as 'CFI commands'. The only thing that's _common_
> about the Common Flash Interface is the way you probe the chip to find out
> what commands it supports.

Thanks for the education. The part data sheet states "The device supports the
CFI command set definition". My apologies for the syntactical error - I'm not
an expert on the subject matter!  : )


> Looking at the datasheet for that chip, it seem to support command set
> number 0x20, which we don't currently have code to recognise. But at first
> glance, the command set described seems identical to the Intel chips.
> 
> Compare the commands listed in the datasheet with the ones in the Intel
> datasheets, and if the latter really is a subset of the (parts we actually
> use of the) former, then try hacking the CFI probe to treat cmdset 0x20 as
> if it was cmdset 1, and see what happens. It'll probably work.

Thanks. That's the impression I had - this device implements only a subset
of the Intel/Sharp command set. At the moment I'm only investigating support
for alternate sourcing of components. If we proceed with evaulating this
device, I'll follow your recommendation and let you know how it goes.

 
> --
> dwmw2

-- 
Regards,
George
--------------DD047FE524D4358E40460E5C
Content-Type: text/x-vcard; charset=iso-8859-1;
 name="davis_g.vcf"
Content-Transfer-Encoding: base64
Content-Description: Card for George G. Davis
Content-Disposition: attachment;
 filename="davis_g.vcf"

YmVnaW46dmNhcmQgCm46RGF2aXM7R2VvcmdlCnRlbDt3b3JrOjYwMy84ODAtMTQxNAp4LW1v
emlsbGEtaHRtbDpGQUxTRQp1cmw6aHR0cDovL3d3dy5tdmlzdGEuY29tCm9yZzpNb250YVZp
c3RhIFNvZnR3YXJlLCBJbmMuCmFkcjo7OzQ2IFBpbmUgU3RyZWV0IEV4dGVuc2lvbjtOYXNo
dWE7Tkg7MDMwNjA7VVNBCnZlcnNpb246Mi4xCmVtYWlsO2ludGVybmV0OmRhdmlzX2dAbXZp
c3RhLmNvbQp0aXRsZTpTb2Z0d2FyZSBFbmdpbmVlcgp4LW1vemlsbGEtY3B0OjstNTM3Ngpm
bjpHZW9yZ2UgRy4gRGF2aXMKZW5kOnZjYXJkCg==
--------------DD047FE524D4358E40460E5C--
