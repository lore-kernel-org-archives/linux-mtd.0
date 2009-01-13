Received: from wf-out-1314.google.com ([209.85.200.170])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LMsOv-0006ww-Ey
	for linux-mtd@lists.infradead.org; Tue, 13 Jan 2009 23:10:28 +0000
Received: by wf-out-1314.google.com with SMTP id 28so231928wfc.24
	for <linux-mtd@lists.infradead.org>;
	Tue, 13 Jan 2009 15:10:23 -0800 (PST)
Message-ID: <8bd0f97a0901131510k25addc8es917fb4e827bb2cf@mail.gmail.com>
Date: Tue, 13 Jan 2009 18:10:22 -0500
From: "Mike Frysinger" <vapier.adi@gmail.com>
To: "Adam Yergovich" <ayergo@jkmicro.com>
Subject: Re: Access entire device with mtdblock0
In-Reply-To: <4967F2B2.4060405@jkmicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <4967F2B2.4060405@jkmicro.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jan 9, 2009 at 19:58, Adam Yergovich wrote:
> There was a grand feature in the 2.4 flavor of MTD that i used wherein
> mtdblock0 was assigned the entirety of the device.  This made updating
> the flash image very easy.
>
> I've since started messing around with 2.6 flavors, and while i have a
> working map that gives the partitions i can no longer access the entire
> device.  I've tried a few things without success to get it to work.
>
> Any recommendations on a simple way to create a partition using the
> entirety of flash?

looks like no one responded.  i'm pretty sure the answer is to use
add_mtd_device() even in face of add_mtd_partitions().
-mike
