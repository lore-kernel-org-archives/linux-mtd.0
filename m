Received: from mail-yx0-f197.google.com ([209.85.210.197])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NiXj4-0000nx-FW
	for linux-mtd@lists.infradead.org; Fri, 19 Feb 2010 18:37:22 +0000
Received: by yxe35 with SMTP id 35so342540yxe.2
	for <linux-mtd@lists.infradead.org>;
	Fri, 19 Feb 2010 10:37:11 -0800 (PST)
Date: Fri, 19 Feb 2010 13:37:02 -0500
From: Josh Boyer <jwboyer@gmail.com>
To: Frank de Lange <frank@unternet.org>
Subject: Re: UBI bootloader support, any progress?
Message-ID: <20100219183701.GK9956@hansolo.jdub.homelinux.org>
References: <4B7EB448.8090402@unternet.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4B7EB448.8090402@unternet.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Feb 19, 2010 at 04:54:48PM +0100, Frank de Lange wrote:
> The question then is whether there has been any progress in getting  
> bootloader support for UBI. I have searched the archives and looked at  
> the code but not found what I'm looking for: potential working  
> bootloader (grub/lilo/something similar) support for UBI on nand mtd  
> devices. Has anyone started implementing (read-only) UBI support in GRUB  
> or another similar BIOS-loaded bootloader?

U-Boot is the only bootloader I'm aware of that has UBI support.  It can
work on Intel based boards, but not via BIOS to my knowledge.

josh
