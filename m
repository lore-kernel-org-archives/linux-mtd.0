Received: from moutvdom01.kundenserver.de ([195.20.224.200])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17ARos-0007Rn-00
	for <linux-mtd@lists.infradead.org>; Wed, 22 May 2002 09:50:06 +0100
Received: from [172.19.20.61] (helo=mrvdomng0.kundenserver.de)
	by moutvdom01.kundenserver.de with esmtp (Exim 2.12 #3)
	id 17ARoo-0003K0-00
	for linux-mtd@lists.infradead.org; Wed, 22 May 2002 10:50:02 +0200
Received: from [217.81.53.57] (helo=comm.esd-electronics.com)
	by mrvdomng0.kundenserver.de with esmtp (Exim 3.22 #2)
	id 17ARoo-0003Aq-01
	for linux-mtd@lists.infradead.org; Wed, 22 May 2002 10:50:02 +0200
From: "Stefan Roese" <stefan.roese@esd-electronics.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: <linux-mtd@lists.infradead.org>
Subject: Re: SST Flash Support (SST39VF160) 
Date: Wed, 22 May 2002 10:49:18 +0200
Message-ID: <EFEAIMDCOOOHIEPHDNFJOEMCDPAA.stefan.roese@esd-electronics.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <17271.1021997293@redhat.com>
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

> stefan.roese@esd-electronics.com said:
> > physmap flash device: 200000 at ffc00000 CFI: Found no Physically
> > mapped flash device at location zero
>
> Weird. That chip is definitely supposed to do CFI.
> http://www.ssti.com/products/pdf/399-39LF-VF160-02.000-DS.pdf
>
> Sure it's wired up the same and your configured buswidth is right?

Absolutely sure. It's the same board!

After digging a little deeper into the sst documentation, I found the
problem:

SST flash need a three byte write sequence (no one), to enter the cfi query
mode!

5555 <- aa
2aaa <- 55
5555 <- 98

This does not seem to be CFI compliant!!!

How can we support the sst chips? Extend the cfi code (special for sst), or
extend the amd code? In PPCBoot we use the amd mode and it works pretty
good.

Any ideas/comments?

Stefan.
