Received: from mail-yi0-f49.google.com ([209.85.218.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QRiae-0003ix-Lt
	for linux-mtd@lists.infradead.org; Wed, 01 Jun 2011 10:23:53 +0000
Received: by yic15 with SMTP id 15so2584103yic.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 01 Jun 2011 03:23:49 -0700 (PDT)
Subject: Re: [PATCH 0/3] fix-up free space earlier in mount_ubifs()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ben Gardiner <bengardiner@nanometrics.ca>
In-Reply-To: <cover.1306780983.git.bengardiner@nanometrics.ca>
References: <cover.1306780983.git.bengardiner@nanometrics.ca>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 01 Jun 2011 13:19:25 +0300
Message-ID: <1306923565.4405.96.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, "Matthew
	L. Creech" <mlcreech@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-05-30 at 14:56 -0400, Ben Gardiner wrote:
> In testing Mattew Creech's free-space-fixup flag series I found that was unable
> to boot a da850evm which had flashed to it's NAND a ubinized image containing a
> UBIFS that has the free-space-fixup flag set.
> 
> The cause of the problem was found to be the call to ubifs_write_master() from
> mount_ubifs() as is evidenced the backtrace produced by the assertion
> introduced in the first patch of this series; where the assertion introduced is
> that c->space_fixup is false when ubifs_write_node() is called.

So the fixes are now in the ubifs tree. You can see them in the
linux-next banch's tip or in the master branch under a pile of other
changes. The point is that linux-next currently contains what I want to
merge to linux-3.0 and master branch contains the same plus a pile of
things for linux-3.1.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
