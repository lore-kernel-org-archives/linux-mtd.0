Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 157GZW-0004jh-00
	for <linux-mtd@lists.infradead.org>; Tue, 05 Jun 2001 14:08:34 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <F1BED55F35F4D3118C0F00E0295CFF4D995484@mail.mediatrix.com> 
References: <F1BED55F35F4D3118C0F00E0295CFF4D995484@mail.mediatrix.com> 
To: Frederic Giasson <fgiasson@mediatrix.com>
Cc: Abraham vd Merwe <abraham@2d3d.co.za>,
    MTD for Linux <linux-mtd@lists.infradead.org>
Subject: Re: erasesize 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 05 Jun 2001 14:12:30 +0100
Message-ID: <22079.991746750@redhat.com>
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

fgiasson@mediatrix.com said:
> 	... Maybe it should be passed through the arg pointer in the ioctl(),
> in a 2 u_long sized structure?

I don't fully understand the question. The 'len' member of the struct 
erase_info contains the total length of the erase requested by the user of 
the MTD device. The only connexion with the device's erase size(s) is that 
obviously the range to be erase must start and end on an eraseblock 
boundary.

cfi_amdstd_erase_varsize() is an internal function intended to issue the
magic erase commands only to a certain address on the chip - it doesn't 
know anything about the erase size at that address, or care about the 
length field, does it?

--
dwmw2
