Received: from moutng.kundenserver.de ([212.227.126.188])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KWYRc-0002WL-0j
	for linux-mtd@lists.infradead.org; Fri, 22 Aug 2008 15:20:56 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Subject: Re: [PATCH 00/10] AXFS: Advanced XIP filesystem
Date: Fri, 22 Aug 2008 17:19:06 +0200
References: <48AD00C4.6060302@gmail.com>
	<Pine.LNX.4.64.0808221650500.17105@vixen.sonytel.be>
In-Reply-To: <Pine.LNX.4.64.0808221650500.17105@vixen.sonytel.be>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200808221719.07660.arnd@arndb.de>
Cc: cotte@de.ibm.com, linux-embedded@vger.kernel.org, nickpiggin@yahoo.com.au,
	=?iso-8859-15?q?J=F6rn_Engel?= <joern@logfs.org>,
	Linux-kernel@vger.kernel.org,
	linux-mtd <linux-mtd@lists.infradead.org>, tim.bird@am.sony.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 22 August 2008, Geert Uytterhoeven wrote:
> I gave AxFS a try on PS3 (ppc64, always use big-endian 64-bit for testing new
> code ;-).
> When mounting the image, I got the crash below:
> 
> | attempt to access beyond end of device
> | loop0: rw=0, want=4920, limit=4912
> | Unable to handle kernel paging request for data at address 0x00000028


Offset 0x28 is buffer_head->b_data, so it seems like sb_bread returns NULL,
which it does for out of range block numbers. I guess axfs_copy_block
should check for that condition, as it can happen on malicious file system
images.
I agree that this is likely to get caused by an endianess bug.
A good help for finding endianess bugs is to use __be64 like data types
everywhere and test with sparse -D__CHECK_ENDIAN__.

	Arnd 
