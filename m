Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16m9of-0005mI-00
	for <linux-mtd@lists.infradead.org>; Sat, 16 Mar 2002 08:45:29 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020315200923.J6821@ayrnetworks.com> 
References: <20020315200923.J6821@ayrnetworks.com> 
To: William Jhun <wjhun@ayrnetworks.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: "Kernel panic: mtdblock: request list destroyed" with recent changes 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sat, 16 Mar 2002 08:56:50 +0000
Message-ID: <25466.1016269010@redhat.com>
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

wjhun@ayrnetworks.com said:
>  This happens whether there are MTD devices registered or not, so I
> doubt this is related to any low-level flash drivers/devices. I
> noticed some changes that happened to mtdblock.c on 3/11; perhaps
> these are related?  Sorry, no call trace or anything... 

This happens for the NFTL driver too, which is confusing - there are 
_definitely_ no changes there which are likely to have caused this. Can you 
try it with a completely up to date tree except for v1.52 of mtdblock.c ?

Other people who reported this with NFTL - did you also have 
CONFIG_MTD_BLOCK enabled for some reason?


--
dwmw2
