Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14w4FF-0004Tc-00
	for <linux-mtd@lists.infradead.org>; Sat, 05 May 2001 16:45:21 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.33.0105051113080.15370-100000@xanadu.home> 
References: <Pine.LNX.4.33.0105051113080.15370-100000@xanadu.home> 
To: Nicolas Pitre <nico@cam.org>
Cc: Alice Hennessy <ahennessy@mvista.com>,
    "Fry,
    Dan" <dfry@bb.directv.com>, linux-mtd@lists.infradead.org
Subject: Re: Improper Command Sequence 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sat, 05 May 2001 16:45:04 +0100
Message-ID: <5543.989077504@redhat.com>
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

nico@cam.org said:
>  ... and don't forget possible chip interleaves.

We currently deal with that to a certain extent, but not particularly 
nicely:
        if (status & CMD(0x3a)) {
                unsigned char chipstatus = status;
                if (status != CMD(status & 0xff)) {
                        int i = cfi->interleave;
                        for (i = 1; i<cfi->interleave; i++) {
                                      chipstatus |= status >> (cfi->device_type * 8);
                        }
                        printk(KERN_WARNING "Status is not identical for all chips: 0x%x. Merging to give 0x%02x\n", status, chipstatus);
                }

Actually I think the device_type there ought to be buswidth / interleave. 

--
dwmw2
