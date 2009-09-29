Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Msdjq-0008M4-Lf
	for linux-mtd@lists.infradead.org; Tue, 29 Sep 2009 14:31:39 +0000
Subject: Re: [PATCH 1/2] UBI: Add ubi_open_volume_path()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Corentin Chary <corentincj@iksaif.net>
In-Reply-To: <1254165012-10798-1-git-send-email-corentincj@iksaif.net>
References: <1254165012-10798-1-git-send-email-corentincj@iksaif.net>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 29 Sep 2009 17:27:37 +0300
Message-Id: <1254234457.3778.84.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Adrian Hunter <adrian.hunter@nokia.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2009-09-28 at 21:10 +0200, Corentin Chary wrote:
> Add an ubi_open_volume_path(path, mode) function which works like
> open_bdev_exclusive(path, mode, ...) where path is the special file
> representing the UBI volume, typically /dev/ubi0_0.
> 
> Signed-off-by: Corentin Chary <corentincj@iksaif.net>

Looks good, and actually works. And I like that I can now do:

mount -t ubifs /dev/ubi_whatever_name /mnt/ubifs

And when your user-space changes hit distros, I will not have to
even specify -t ubifs.

I'm not entirely sure vs the 'kern_path()' usage though. Could you
please post your patch to these lists as well:

linux-fsdevel@vger.kernel.org
linux-kernel@vger.kernel.org

I'll push your patches to the ubi-2.6.git now, but I would not want to
make these changes sneak into mainline without being sent to lkml, just
because I'm not entirely sure about the 'kern_path()'. But for me this
looks ok.

Thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
