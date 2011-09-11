Received: from mail-pz0-f41.google.com ([209.85.210.41])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R2jsU-0006l9-4X
	for linux-mtd@lists.infradead.org; Sun, 11 Sep 2011 13:15:19 +0000
Received: by pzk4 with SMTP id 4so6645162pzk.28
	for <linux-mtd@lists.infradead.org>;
	Sun, 11 Sep 2011 06:15:16 -0700 (PDT)
Subject: Re: can't mount ubifs after resizing with ubirsvol
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
Date: Sun, 11 Sep 2011 16:17:42 +0300
In-Reply-To: <4E64893F.5000204@parrot.com>
References: <CAMwGMjxX4q2oYt-KDwoq87WP77Phbd+xEdUyL-VkaLLvYCeqfA@mail.gmail.com>
	<4E64893F.5000204@parrot.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Message-ID: <1315747066.18731.53.camel@sauron>
Mime-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
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

On Mon, 2011-09-05 at 10:33 +0200, Matthieu CASTET wrote:
> Hi,
> 
> Jon Ringle a écrit :
> > Hi,
> > 
> > I have a ubi0 with a static squashfs part and a ubifs part. Sometimes
> > I have to update the squashfs with an image that is bigger than the
> > currently allocated space for the squashfs part. My plan was to use
> > ubirsvol to reduce the size of the ubifs part, then use ubirsvol in
> > increase the size of the squashfs part so that it is big enough for
> > ubiupdatevol to accept the new image in the squashfs part.
> > 
> > But when I try to mount ubifs after resizing, it complains with:
> > (initramfs)[/]# mount -t ubifs ubi0:ubifs /mnt
> > [ 1838.350000] UBIFS error (pid 621): validate_sb: bad LEB count: 866
> > in superblock, 800 on UBI volume, 19 minimum required
> > [ 1838.360000] UBIFS error (pid 621): validate_sb: bad superblock, error 1
> > mount: mounting ubi0:ubifs on /mnt failed: Invalid argument
> > 
> > Is what I want to do possible?
> > 
> AFAIK you can't reduce size of ubifs volume, you can only increase it.

Right, shrinking is not currently supported. It is possible to
implement, but needs efforts and time (as many of other things people
want).

-- 
Best Regards,
Artem Bityutskiy
