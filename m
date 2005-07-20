Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1DvI1A-0002Tm-Cq
	for linux-mtd@lists.infradead.org; Wed, 20 Jul 2005 13:06:06 -0400
Message-ID: <42DE8451.20609@yandex.ru>
Date: Wed, 20 Jul 2005 21:05:21 +0400
From: "Artem B. Bityuckiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: "Abu M. Muttalib" <abum@aftek.com>
References: <KAEKICGAIEMACLOJNFKGAEKHCAAA.abum@aftek.com>
In-Reply-To: <KAEKICGAIEMACLOJNFKGAEKHCAAA.abum@aftek.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Kernel Oops: not able to handle jffs2 file system
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Abu M. Muttalib wrote:
> Hi,
> 
> The output I have posted is already taken with jffs2 debugging enabled. I
> have compiled the kernel with mkfs.jffs2 with e=64KB (erase block size).
> 
> I tried to see the starting location of flash where the file system image is
> stored with dump command of redboot. It does not contain the jffs2 marker.
> Though as per my understanding the partitions are correct and images are
> downloaded at appropriate locations.

Please, try to use the last cvs snapshot. And try to gather your 
debugging messages. They are not seen in the output.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
