Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16njqA-0005Yf-00
	for <linux-mtd@lists.infradead.org>; Wed, 20 Mar 2002 17:25:34 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <025f01c1cf83$11e23f70$9c011f0a@kamwin> 
References: <025f01c1cf83$11e23f70$9c011f0a@kamwin> 
To: "Kam Lee" <kamlee@kendin.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: newbee question 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 20 Mar 2002 17:36:57 +0000
Message-ID: <9460.1016645817@redhat.com>
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

kamlee@kendin.com said:
> mount: Mounting /dev/mtdblock3 on /mnt failed: No such device or
> address 

Turn on CONFIG_MTD_BLOCK

--
dwmw2
