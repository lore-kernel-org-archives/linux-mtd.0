Received: from mail-pz0-f41.google.com ([209.85.210.41])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R2kVn-0007J1-RG
	for linux-mtd@lists.infradead.org; Sun, 11 Sep 2011 13:55:56 +0000
Received: by mail-pz0-f41.google.com with SMTP id 4so6691249pzk.28
	for <linux-mtd@lists.infradead.org>;
	Sun, 11 Sep 2011 06:55:55 -0700 (PDT)
Subject: Re: [PATCH 02/14] mtd: nand: do not ignore all ECC errors
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Sun, 11 Sep 2011 16:58:21 +0300
In-Reply-To: <1315426421-16243-3-git-send-email-computersforpeace@gmail.com>
References: <1315426421-16243-1-git-send-email-computersforpeace@gmail.com>
	<1315426421-16243-3-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1315749506.18731.67.camel@sauron>
Mime-Version: 1.0
Cc: Kevin Cernekee <cernekee@gmail.com>,
	Matthieu Castet <matthieu.castet@parrot.com>,
	Jim Quinlan <jim2101024@gmail.com>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>, Matthew Creech <mlcreech@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-09-07 at 13:13 -0700, Brian Norris wrote:
> There are a few reasons not to ignore ECC errors here.
> 
> First, mtd->read_oob is being called in raw mode, so there should be no
> error correction in the first place.
> 
> Second, if we change this such that there *is* error correction in this
> function, then we will want to pass the error message upward.
> 
> In fact, the code I introduced to "ignore ECC errors" would have been
> better if it had just placed this test down in `scan_block_full()' in
> the first place. We would like to ignore ECC errors when we are simply
> checking for bad block markers (e.g., factory marked), but we may not
> want to ignore ECC errors when scanning OOB for a flash-based BBT
> pattern (in `scan_read_raw()'; note that the return codes from
> `scan_read_raw()' are not actually handled yet).
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Pushed to my tree, thanks!

-- 
Best Regards,
Artem Bityutskiy
