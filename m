Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18BgCi-0003fN-00
	for <linux-mtd@lists.infradead.org>; Tue, 12 Nov 2002 18:56:04 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <F132Y30kkZIhTrBoe2U00000281@hotmail.com> 
References: <F132Y30kkZIhTrBoe2U00000281@hotmail.com> 
To: "J B" <mad_flasher@hotmail.com>
Cc: Wolfram.Gettert@fci.com, linux-mtd@lists.infradead.org
Subject: Re: Problem writing to flash with writeb() 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 12 Nov 2002 19:26:19 +0000
Message-ID: <8930.1037129179@passion.cambridge.redhat.com>
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

mad_flasher@hotmail.com said:
>  Looks like this is the equivalent of: physmap_write8(&physmap_map,0x90
> ,0); 

It does. Show disassembly of each version.

--
dwmw2
