Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PHCaL-000755-IY
	for linux-mtd@lists.infradead.org; Sat, 13 Nov 2010 09:39:53 +0000
Received: by mail-bw0-f49.google.com with SMTP id 5so3910613bwz.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 13 Nov 2010 01:39:49 -0800 (PST)
Subject: Re: [RFC] mtd: Fix MTD_OF_PARTS for all arch and minor tidy of
	MTD_PARTITIONS
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Grant Likely <grant.likely@secretlab.ca>
In-Reply-To: <20101030063425.22588.76571.stgit@localhost6.localdomain6>
References: <20101030063425.22588.76571.stgit@localhost6.localdomain6>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 13 Nov 2010 11:39:37 +0200
Message-ID: <1289641177.2218.4.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
	Andres Salomon <dilinger@queued.net>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2010-10-30 at 07:35 +0100, Grant Likely wrote:
> MTD_OF_PARTS should be possible on all architectures, not just
> powerpc and microblaze, and it probably should not be a user
> selectable option.  Neither does it need to be in a separate module.
> 
> Also, rework MTD Kconfig to group options dependant on MTD_PARTITIONS
> into a if/endif block.  Do the same for MTD_REDBOOT_PARTS.
> 
> Signed-off-by: Grant Likely <grant.likely@secretlab.ca>

Pushed to l2-mtd-2.6.git, thanks you.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
