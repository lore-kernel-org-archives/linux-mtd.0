Received: from mail-bw0-f218.google.com ([209.85.218.218])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NzuE3-0007LZ-GL
	for linux-mtd@lists.infradead.org; Thu, 08 Apr 2010 16:05:07 +0000
Received: by bwz10 with SMTP id 10so1877416bwz.2
	for <linux-mtd@lists.infradead.org>;
	Thu, 08 Apr 2010 09:05:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1270717452-8993-2-git-send-email-dedekind1@gmail.com>
References: <1270717452-8993-1-git-send-email-dedekind1@gmail.com>
	<1270717452-8993-2-git-send-email-dedekind1@gmail.com>
Date: Thu, 8 Apr 2010 18:05:00 +0200
Message-ID: <v2j71cd59b01004080905kc6a59315qbab3e3c6f4f2996b@mail.gmail.com>
Subject: Re: [PATCH 2/4] UBI: sync ubi-user.h with the lates kernel verion
From: Corentin Chary <corentin.chary@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org,
	Mika Westerberg <ext-mika.1.westerberg@nokia.com>,
	Jon Ringle <jon@ringle.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> + * UBI can attach block and MTD devices. To attach a block device, @bdev_major
> + * and @bdev_minor have to contain block device major an minor numbers. And
> + * @mtd_num and @vid_hdr_offset have to contain zeroes. Note, the major number
> + * cannot be zero. To attach an MTD device, @bdev_major and @bdev_minor have to
> + * contain zeroes, while @mtd_num has to contain the MTD device number to
> + * attach.

I can't find anything about UBI being able to attach block devices in
http://git.infradead.org/ubi-2.6.git,
did I miss something ?
Thanks

-- 
Corentin Chary
http://xf.iksaif.net
