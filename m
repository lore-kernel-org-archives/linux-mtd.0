Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15zc2C-0006LP-00
	for <linux-mtd@lists.infradead.org>; Fri, 02 Nov 2001 10:58:48 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20011102105049.EWZV23967.fep01@yunux> 
References: <20011102105049.EWZV23967.fep01@yunux> 
To: Yunus Yucel Altunbicak <yunus.altunbicak@eliar.com.tr>
Cc: MTD <linux-mtd@lists.infradead.org>
Subject: Re: DOC test program 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 02 Nov 2001 11:07:51 +0000
Message-ID: <5030.1004699271@redhat.com>
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

yunus.altunbicak@eliar.com.tr said:
> Possible DiskOnChip with unknown ChipID 42 found at 0x10e00000 
> No recognised DiskOnChip devices found

Precisely what device is this? It looks like it might be a Millennium Plus.

I have not yet received any information on the newer devices. Therefore, you
cannot (legally and safely) use a DiskOnChip Millennium Plus with Linux -
only the DiskOnChip 2000 and DiskOnChip Millennium are supported. 

I recommend you seek an alternative supplier of hardware.

--
dwmw2
