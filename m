Received: from dns.heurikon.com ([192.48.245.20] helo=frankfurter.heurikon.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15NaXN-0004l2-00
	for <linux-mtd@lists.infradead.org>; Fri, 20 Jul 2001 14:41:50 +0100
Received: from frankfurterDMZ.heurikon.com (c3po.heurikon.com [10.64.16.18])
	by bratwurst.heurikon.com (Postfix) with SMTP id 921BACC8DA
	for <linux-mtd@lists.infradead.org>; Fri, 20 Jul 2001 08:47:19 -0500 (CDT)
Message-ID: <F9102D41F595D311ACA7009027DE2C84033D4D81@c3po.heurikon.com>
From: "McNutt, Scott" <smcnutt@artesyncp.com>
To: linux-mtd@lists.infradead.org
Subject: RE: Magic bitmask 0x1985 not found 
Date: Fri, 20 Jul 2001 08:47:24 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

> From: David Woodhouse
> 
> smcnutt@artesyncp.com said:
> > mount: block device /dev/mtdblock/2 is write-protected, mounting
> > read-only
> 
> Why JFFS2 if it's readonly and the sectors are protected? 
> Surely cramfs  would suffice?

I don't want readonly ... my mistake ... I was
setting MTD_WRITEABLE vs. clearing it (duh!)

> > jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 
> 0x00020000: 0xe002 instead
> 
> What's at offset 0x1fffc in the partition? 0x1985? 

Here's the dump:
01fff0 90 87 2f 34 2e 16 d5 26 bc c0 4e d1 ff ff 19 85
...
03fff0 84 00 03 00 de 72 b0 79 ff ff ff ff 19 85 e0 02
05fff0 ff ff ff ff ff ff ff ff ff ff 19 85 e0 02 00 00

So ... the offsets are jacked.

> What '-e' value was given to mkfs.jffs2? 

I thought I used 131072. But based on the dump, I must have
fat-fingered 131071 :-(. I made a new image with -e 131072
and it looks good.

Thanks for the help!
--Scott
