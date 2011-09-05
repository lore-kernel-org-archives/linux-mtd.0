Received: from co202.xi-lite.net ([149.6.83.202])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1R0UcC-0000QV-Vr
	for linux-mtd@lists.infradead.org; Mon, 05 Sep 2011 08:33:13 +0000
Message-ID: <4E64893F.5000204@parrot.com>
Date: Mon, 5 Sep 2011 10:33:03 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: Jon Ringle <jon@ringle.org>
Subject: Re: can't mount ubifs after resizing with ubirsvol
References: <CAMwGMjxX4q2oYt-KDwoq87WP77Phbd+xEdUyL-VkaLLvYCeqfA@mail.gmail.com>
In-Reply-To: <CAMwGMjxX4q2oYt-KDwoq87WP77Phbd+xEdUyL-VkaLLvYCeqfA@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Jon Ringle a écrit :
> Hi,
> 
> I have a ubi0 with a static squashfs part and a ubifs part. Sometimes
> I have to update the squashfs with an image that is bigger than the
> currently allocated space for the squashfs part. My plan was to use
> ubirsvol to reduce the size of the ubifs part, then use ubirsvol in
> increase the size of the squashfs part so that it is big enough for
> ubiupdatevol to accept the new image in the squashfs part.
> 
> But when I try to mount ubifs after resizing, it complains with:
> (initramfs)[/]# mount -t ubifs ubi0:ubifs /mnt
> [ 1838.350000] UBIFS error (pid 621): validate_sb: bad LEB count: 866
> in superblock, 800 on UBI volume, 19 minimum required
> [ 1838.360000] UBIFS error (pid 621): validate_sb: bad superblock, error 1
> mount: mounting ubi0:ubifs on /mnt failed: Invalid argument
> 
> Is what I want to do possible?
> 
AFAIK you can't reduce size of ubifs volume, you can only increase it.


Matthieu
