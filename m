Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Zfau-0005Gn-00
	for <linux-mtd@lists.infradead.org>; Tue, 30 Jul 2002 23:35:56 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <NCBBIINEHIPFGJPLBEIFGEONDJAA.acurtis@onz.com> 
References: <NCBBIINEHIPFGJPLBEIFGEONDJAA.acurtis@onz.com> 
To: acurtis@onz.com
Cc: linux-mtd@lists.infradead.org
Subject: Re: What happened to 64-bit support? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 30 Jul 2002 23:35:49 +0100
Message-ID: <14860.1028068549@redhat.com>
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

Sorry, I missed this mail so my reply to your latest mail probably wasn't 
too helpful.

acurtis@onz.com said:
> Using the latest CVS code I recompiled with DEBUG, genprobe...()
> reports that it does not support buswidth of 8. jedec_probe...() did
> not work. It did appear to work with the ROM mapped to RAM option but
> this also the reason that it is always mounted Read-Only.

Did you actually enable 64-bit support? It's not on by default because it 
slows things down.

CONFIG_MTD_ADV_OPTIONS=y, CONFIG_MTD_CFI_GEOMETRY=y, 
CONFIG_MTD_CFI_B8=y, CONFIG_MTD_CFI_I4=y.


--
dwmw2
