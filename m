Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17joQl-0003vT-00
	for <linux-mtd@lists.infradead.org>; Tue, 27 Aug 2002 23:03:23 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3D6BF554.3090102@redswitch.com> 
References: <3D6BF554.3090102@redswitch.com> 
To: "Xiaogeng (Shawn) Jin" <xjin@redswitch.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: how to get mtd_info in kernel space? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 27 Aug 2002 23:03:19 +0100
Message-ID: <30372.1030485799@redhat.com>
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

xjin@redswitch.com said:
>  get_mtd_device() is used to get an MTD device with a specific minor
> number. I have several MTD devices enabled and how can I get their
> minor  numbers which can be used to invoke get_mtd_device()? What
> function call? 

At the moment you can't. You have to get each one from 0 to MAX_MTD_DEVICES 
and check whether it's the one you want. We could perhaps implement a 
get_mtd_device_byname() since JFFS2 wants that too now.

What do you want it for?

--
dwmw2
