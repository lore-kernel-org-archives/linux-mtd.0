Received: from mail-gx0-f177.google.com ([209.85.161.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QszaK-0004bK-AY
	for linux-mtd@lists.infradead.org; Mon, 15 Aug 2011 16:00:17 +0000
Received: by gxk2 with SMTP id 2so3460640gxk.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 15 Aug 2011 09:00:13 -0700 (PDT)
Subject: Re: UBI FS on 2MiB eraseblock Hynix MLC NAND
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Viktar Palstsiuk <viktar.palstsiuk@promwad.com>
Date: Mon, 15 Aug 2011 19:01:53 +0300
In-Reply-To: <CAKa7sPRir5YTdPCYAHEYvPGA5GhfTuyv0Z9ynDUtEmy=YHA2XQ@mail.gmail.com>
References: <CAKa7sPRir5YTdPCYAHEYvPGA5GhfTuyv0Z9ynDUtEmy=YHA2XQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1313424117.8691.19.camel@sauron>
Mime-Version: 1.0
Cc: Yauhen Kharuzhy <yauhen.kharuzhy@promwad.com>,
	linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-08-04 at 16:59 +0300, Viktar Palstsiuk wrote:
> Hello,
> 
> While trying to use UBI FS on Hynix MLC NAND (2MiB eraseblock, 8k
> pagesize) I faced with the problem that root mounts well only during
> first boot after it was flashed.
> On the second boot it reports that it failed to recover master node.
> If some one has tested UBI FS on devices with large eraseblock?

Well, in theory it should work, but I've never heard about such huge
eraseblock so probably you are the first trying it, and probably there
is a bug.

> NET: Registered protocol family 17
> lib80211: common routines for IEEE802.11 drivers
> rtc-mv rtc-mv: setting system clock to 2000-02-26 02:34:28 UTC (951532468)
> UBIFS error (pid 1): ubifs_recover_master_node: failed to recover master node

Could you please enable UBIFS debugging, reproduce the issue and send me
all the kernel output - e.g., by typing dmesg or booting with the
ignore_loglevel kernel option?

-- 
Best Regards,
Artem Bityutskiy
