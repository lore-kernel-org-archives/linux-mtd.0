Received: from post2.inre.asu.edu ([129.219.110.73])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15bl5d-0003Zn-00
	for <linux-mtd@lists.infradead.org>; Tue, 28 Aug 2001 16:47:46 +0100
Received: from conversion.post2.inre.asu.edu by asu.edu (PMDF V6.0-24 #47347)
 id <0GIS00E01C5B7R@asu.edu> for linux-mtd@lists.infradead.org; Tue,
 28 Aug 2001 08:53:35 -0700 (MST)
Date: Tue, 28 Aug 2001 08:53:59 -0700
From: Russ Dill <Russ.Dill@asu.edu>
Subject: Re: JFFS2 on 8MB Flash-Chip conneted to MPC850 works extremly slow	:(
In-reply-to: <3B8B87A9.2F622A89@dgt-lab.com.pl>
To: Wojciech Kromer <krom@dgt-lab.com.pl>
Cc: mtd <linux-mtd@lists.infradead.org>
Message-id: <999014039.27952.2.camel@russ>
MIME-version: 1.0
Content-type: text/plain
Content-transfer-encoding: 7bit
References: <3B8B87A9.2F622A89@dgt-lab.com.pl>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On 28 Aug 2001 13:59:37 +0200, Wojciech Kromer wrote:
> I have JFFS2 on my 8MBFujitsu Flash Chip connected to MPC850 (50Mhz).
> I've decided to have root file system on that flash, but it boots
> extremly slow.
> It takes about 5 minutes. With compressed initial ram disk on flash it
> takes less
> than 30s.
> 
> Q1 Why?
> Q2 I work on mtd-snapshot-20010628.tar.bz2. Are there any speed changes
> in furthere releases?
> 

It will take longer than a ramdisk because of the way jffs2 works, but
it looks like you might not be setting your flash timings
