Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15U3Ia-0007FC-00
	for <linux-mtd@lists.infradead.org>; Tue, 07 Aug 2001 10:37:16 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <5.1.0.14.0.20010801063242.00a67f20@mail.spewey.com> 
References: <5.1.0.14.0.20010801063242.00a67f20@mail.spewey.com> 
To: Vipin Malik <vipin@embeddedlinuxworks.com>
Cc: Juan Ramon Jimenez Garcia <juan@hispafuentes.com>,
    linux-mtd@lists.infradead.org, olea@hispafuentes.com
Subject: Re: Problems compiling kernel 2.2.17 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 07 Aug 2001 10:42:58 +0100
Message-ID: <32062.997177378@redhat.com>
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

vipin@embeddedlinuxworks.com said:
> Don't link in nftl. What do you need this for? You don't need this for
>  either DOC OR NOR flash.

NFTL is the translation layer used on the DiskOnChip to emulate a block 
device.

--
dwmw2
