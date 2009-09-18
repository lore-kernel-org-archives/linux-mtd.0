Received: from mail-ew0-f205.google.com ([209.85.219.205])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Mob4J-00032m-CF
	for linux-mtd@lists.infradead.org; Fri, 18 Sep 2009 10:52:03 +0000
Received: by ewy1 with SMTP id 1so826297ewy.27
	for <linux-mtd@lists.infradead.org>;
	Fri, 18 Sep 2009 03:51:57 -0700 (PDT)
Sender: Corentin Chary <corentin.chary@gmail.com>
From: Corentin Chary <corentincj@iksaif.net>
To: Karel Zak <kzak@redhat.com>
Subject: Re: [PATCH 1/3] blkid: add UBI volume support
Date: Fri, 18 Sep 2009 12:52:09 +0200
References: <1251112316-18971-1-git-send-email-corentincj@iksaif.net>
	<1251112316-18971-2-git-send-email-corentincj@iksaif.net>
	<20090902092402.GI1466@nb.net.home>
In-Reply-To: <20090902092402.GI1466@nb.net.home>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <200909181252.09503.corentincj@iksaif.net>
Cc: Theodore Ts'o <tytso@mit.edu>, util-linux-ng@vger.kernel.org,
	linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 02 September 2009 11:24:02 Karel Zak wrote:
>  Hi Corentin,
> 
> On Mon, Aug 24, 2009 at 01:11:54PM +0200, Corentin Chary wrote:
> > Probe UBI volume under /dev (or /devfs, /devices).
> 
>  that's not elegant. Does it mean that UBI volumes are not in
>  /proc/partitions?
> 
>  Ted, any comment?

Any news for this patch ?
Thanks,
-- 
Corentin Chary
http://xf.iksaif.net
