Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Zoi8-0006HG-00
	for <linux-mtd@lists.infradead.org>; Wed, 31 Jul 2002 09:20:00 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <NCBBIINEHIPFGJPLBEIFMEBADKAA.acurtis@directvinternet.com> 
References: <NCBBIINEHIPFGJPLBEIFMEBADKAA.acurtis@directvinternet.com> 
To: acurtis@directvinternet.com
Cc: linux-mtd@lists.infradead.org
Subject: Re: What happened to 64-bit support? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 31 Jul 2002 09:19:58 +0100
Message-ID: <31698.1028103598@redhat.com>
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

acurtis@directvinternet.com said:
>  In theory yes. if CONFIG_MTD_CFI_B8 translates to 64-bits in config
> (which I believe it does, then yes) As I mentioned, the problem
> appears to be in the probe routines not liking an octet of 8.

What exactly happens?

--
dwmw2
