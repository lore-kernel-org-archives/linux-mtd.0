Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15leio-0003kX-00
	for <linux-mtd@lists.infradead.org>; Tue, 25 Sep 2001 00:01:06 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20010924221212.11724.qmail@qis> 
References: <20010924221212.11724.qmail@qis>  <20010922160958.5797.qmail@qis> <20004.1001233928@redhat.com> 
To: "Nikolai Vladychevski" <niko@isl.net.mx>
Cc: linux-mtd@lists.infradead.org
Subject: Re: nftl driver 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 25 Sep 2001 00:10:10 +0100
Message-ID: <386.1001373010@redhat.com>
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

niko@isl.net.mx said:
>  well, its just my application requires it .... I have to nftl_format
> because  I do not nftl_format at the 0x00000. There is another data of
> variable  lenght that I place before nftla data, so i have to
> nftl_format  0xSOME_OFFSET that is different evry time.... 

> but ... if the driver doesn't come the application , the application
> will  have to go to the driver...  

If you can't make the NFTL driver a module, you should either reboot 
immediately after doing nftl_format, or implement an ioctl for making it 
'remount'.

--
dwmw2
