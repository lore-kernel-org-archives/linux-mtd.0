Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Nzuk2-0001Ej-Pu
	for linux-mtd@lists.infradead.org; Thu, 08 Apr 2010 16:38:07 +0000
Subject: Re: [PATCH 2/4] UBI: sync ubi-user.h with the lates kernel verion
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Corentin Chary <corentin.chary@gmail.com>
In-Reply-To: <v2j71cd59b01004080905kc6a59315qbab3e3c6f4f2996b@mail.gmail.com>
References: <1270717452-8993-1-git-send-email-dedekind1@gmail.com>
	<1270717452-8993-2-git-send-email-dedekind1@gmail.com>
	<v2j71cd59b01004080905kc6a59315qbab3e3c6f4f2996b@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 08 Apr 2010 19:36:02 +0300
Message-ID: <1270744562.9120.22.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org,
	Mika Westerberg <ext-mika.1.westerberg@nokia.com>,
	Jon Ringle <jon@ringle.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-04-08 at 18:05 +0200, Corentin Chary wrote:
> > + * UBI can attach block and MTD devices. To attach a block device, @bdev_major
> > + * and @bdev_minor have to contain block device major an minor numbers. And
> > + * @mtd_num and @vid_hdr_offset have to contain zeroes. Note, the major number
> > + * cannot be zero. To attach an MTD device, @bdev_major and @bdev_minor have to
> > + * contain zeroes, while @mtd_num has to contain the MTD device number to
> > + * attach.
> 
> I can't find anything about UBI being able to attach block devices in
> http://git.infradead.org/ubi-2.6.git,
> did I miss something ?

Oh, right. This is wrong patch, sorry, it is not needed. The other are
fine.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
