Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18GfBI-0002jw-00
	for <linux-mtd@lists.infradead.org>; Tue, 26 Nov 2002 12:51:12 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3DE37160.A152A2F5@cs.fujitsu.co.jp> 
References: <3DE37160.A152A2F5@cs.fujitsu.co.jp> 
To: Takeharu KATO <tkato@cs.fujitsu.co.jp>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] Linux-2.4.18 block MTD dead-lock 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 26 Nov 2002 13:21:33 +0000
Message-ID: <1436.1038316893@passion.cambridge.redhat.com>
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

tkato@cs.fujitsu.co.jp said:
> 3. The solution
> We changed the sequence of the function called ``get_sb_bdev''
>  in fs/super.c.  We changed the function to make the block device  to
> be mounted checked before opening the device. 
>  Please refer the patch to make out the changes in detail.

Wrong fix. Use the fix which is already in 2.4.19.

--
dwmw2
