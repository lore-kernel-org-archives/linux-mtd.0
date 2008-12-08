Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L9j5W-0000vE-6M
	for linux-mtd@lists.infradead.org; Mon, 08 Dec 2008 16:36:02 +0000
Message-ID: <493D4C63.5040502@yandex.ru>
Date: Mon, 08 Dec 2008 18:33:39 +0200
From: Artem Bityutskiy <dedekind@yandex.ru>
MIME-Version: 1.0
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: UBI/DVB ioctl conflict?
References: <20081207095811.13b51cca@zod.rchland.ibm.com>
	<200812081041.14178.laurentp@cse-semaphore.com>
	<1228729915.13686.95.camel@sauron>
	<200812081650.54346.arnd@arndb.de>
In-Reply-To: <200812081650.54346.arnd@arndb.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: LKML <linux-kernel@vger.kernel.org>,
	Laurent Pinchart <laurentp@cse-semaphore.com>,
	linux-mtd@lists.infradead.org, v4l-dvb-maintainer@linuxtv.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Arnd Bergmann wrote:
> On Monday 08 December 2008, Artem Bityutskiy wrote:
>> On Mon, 2008-12-08 at 10:41 +0100, Laurent Pinchart wrote:
>>> Correct me if I'm wrong, but doesn't this only matters for devices that would 
>>> implement both the UBI and DVB API on the same inode ? That would be quite 
>>> unlikely.
>> Yeah, I guess. But this anyway makes sense to keep ioctls
>> non-overlapping.
> 
> We try hard (but sometimes fail) to keep every ioctl number unique.
> The reason for this is that the device drivers are not the only
> pieces of code that look at them. Specifically, three other things
> frequently cause problems here:

Thanks for the reply. Do you know the status of the
Documentation/ioctl/ioctl-number.txt file - it does not seem to be up-to-date.
Should I document add UBI ioctls there?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
