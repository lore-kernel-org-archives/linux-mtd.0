Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17LCgd-0000Fk-00
	for <linux-mtd@lists.infradead.org>; Fri, 21 Jun 2002 01:54:03 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3D127644.3050004@ctam.com.au> 
References: <3D127644.3050004@ctam.com.au>  <3D115F9B.9030203@ctam.com.au> <12942.1024563800@redhat.com> 
To: brendan.simon@ctam.com.au
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: doc2000 nftl[abcd] devices 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 21 Jun 2002 01:53:58 +0100
Message-ID: <10394.1024620838@redhat.com>
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

brendan.simon@ctam.com.au said:
> I'm getting ENODEV.  It seems that the NFTLs[] array doesn't have the
> appropriate information.  How is this setup ?  I'm using modules so is
>  it initialised so I assume it's initialised when I do an "insmod
> nftl". 
>  Which routine scans the DOC2000 for NFTL devices and initialises the
> NFTLs[] array. 

NFTL_setup() from nftlcore.c and NFTL_mount() from nftlmount.c.

Looking at them more closely, I see that I was mistaken -- we _don't_ 
continue the scan after finding the first NFTL on the device. Patching 
NFTL_mount() and find_boot_record() to take a 'start' argument for where to 
start scanning is simple enough -- you just need to fix NFTL_setup() to 
loop till NFTL_mount() stops working.

--
dwmw2
