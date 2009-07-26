Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by casper.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MV0CG-0005Ej-9G
	for linux-mtd@lists.infradead.org; Sun, 26 Jul 2009 09:39:16 +0000
Message-ID: <4A6C22CB.4090208@gmail.com>
Date: Sun, 26 Jul 2009 12:32:59 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
MIME-Version: 1.0
To: tytso@mit.edu
Subject: Re: [PATCH 0/2] RFC: Add support for UBI and UBIFS
References: <1247650724-16288-1-git-send-email-corentincj@iksaif.net>
In-Reply-To: <1247650724-16288-1-git-send-email-corentincj@iksaif.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: Corentin Chary <corentincj@iksaif.net>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 07/15/2009 12:38 PM, Corentin Chary wrote:
> Hi,
> Here is two patch to add support for UBI and UBIFS in libblkid
> With that, if you type "blkid" it will show you UBIFS filesystem.
>
> The thing is that I'm not sure this patch is really usefull as UBIFS
> is a "nodev" filesystem, and it doesn't deal with block devices.
>
> I first started theses patch to be able to do stuff like:
> mount /dev/ubi0_0 /mnt/test but we need to patch UBIFS for that.
>
> So, do you think we should be able to do that ? If it's ok, these
> two patch are a first step.

Theo,

what do you think about this? The feature sounds very useful for
our small comunity.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
