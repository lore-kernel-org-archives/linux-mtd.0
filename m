Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WpGdv-0002j2-05
 for linux-mtd@lists.infradead.org; Tue, 27 May 2014 12:38:11 +0000
Message-ID: <1401194249.1304.140.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v2] mtd-utils: integck: add support for volume specific
 power-cut test
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mats =?ISO-8859-1?Q?K=E4rrman?= <Mats.Karrman@tritech.se>
Date: Tue, 27 May 2014 15:37:29 +0300
In-Reply-To: <ED3E0BCACD909541BA94A34C4A164D4C5B401901@post.tritech.se>
References: <ED3E0BCACD909541BA94A34C4A164D4C5B401901@post.tritech.se>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2014-05-15 at 08:21 +0000, Mats Kärrman wrote:
> From a3c9a9be5fe136d1a8e1c029a9f8cc3de634afd2 Mon Sep 17 00:00:00 2001
> From: =?UTF-8?q?Mats=20K=C3=A4rrman?= <mats.karrman@tritech.se>
> Date: Thu, 15 May 2014 10:03:56 +0200
> Subject: [PATCH v2] mtd-utils: integck: add support for volume specific power-cut
>  test
> MIME-Version: 1.0
> Content-Type: text/plain; charset=UTF-8
> Content-Transfer-Encoding: 8bit
> 
> Problem:
> The current power-cut test requires power-cut emulation to be enabled globally
> (e.g. for all UBIFS volumes) since the power-cut mode is otherwise lost when
> the file-system is re-mounted. However this may lead to some practical
> problems when the root fs of the tested machine is also of the same type.
> 
> Solution:
> Modify the -p option so that it automatically enables power-cut testing
> selectively for the tested filesystem and then re-enables it after every
> re-mount. Enabling is done by writing "1" to the associated control file.
> The file to use is deduced from the mounted device and the assumption that
> debugfs is mounted on /sys/kernel/debug.
> 
> Signed-off-by: Mats Kärrman <mats.karrman@tritech.se>

Mats, firs of all, my apologies for slowness. And my apologies for
leading you to this direction.

But I think I see the problem with this solution now.

The problem is that with this we won't get power cut emulated while you
mount the file system.

Before this change, we could have something like:

1. Working with the FS, power-cut
2. Unmount the FS, start mounting -> power-cut in the middle of mount.

So we could test power cuts while we are in the middle of recovery from
the previous power cuts, in a way "nested" power-cuts.

With your change, we never have them.

-- 
Best Regards,
Artem Bityutskiy
