Received: from mailout04.sul.t-online.com ([194.25.134.18])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17lVMr-0003ng-00
	for <linux-mtd@lists.infradead.org>; Sun, 01 Sep 2002 15:06:21 +0100
To: Andrew Hainsworth <andrew@hainsworth.ath.cx>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Frustration. 
From: Wolfgang Denk <wd@denx.de>
Mime-version: 1.0
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: 8bit
In-reply-to: Your message of "Sun, 01 Sep 2002 22:37:54 +1000."
             <4.3.2.7.2.20020901223306.00cd3f08@10.0.0.8>
Date: Sun, 01 Sep 2002 16:05:53 +0200
Message-Id: <20020901140558.2A12E1182F@denx.denx.de>
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

In message <4.3.2.7.2.20020901223306.00cd3f08@10.0.0.8> you wrote:

> The DoC is being recognised:
> 
> DiskOnChip 2000 found at address 0xD0000
> Flash chip found: Manufacturer ID: EC, Chip ID: 75 (Samsung KM29U256T)
> 1 flash chips found. Total DiskOnChip size: 32 MiB
> 
> NFTL driver loads:
> 
> NFTL driver: nftlcore.c $Revision: 1.82 $, nftlmount.c $Revision: 1.25 $
>   nftla: nftla1
           ^^^^^^

> But where is the DoC for me to mount and have my merry way with?  I would 

/dev/ntfla1 ??? How about something like "mount /dev/ntfla1 /mnt" ?

Wolfgang Denk

-- 
Software Engineering:  Embedded and Realtime Systems,  Embedded Linux
Phone: (+49)-8142-4596-87  Fax: (+49)-8142-4596-88  Email: wd@denx.de
It's all Klatchian to me.
        - Terry Pratchett & Stephen Briggs, _The Discworld Companion_
