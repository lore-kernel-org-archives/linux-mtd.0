Received: from duster.selinc.com ([12.156.93.38])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JihK3-0002xM-0I
	for linux-mtd@lists.infradead.org; Mon, 07 Apr 2008 02:43:03 +0000
Received: from edison2.selinc.com (localhost [127.0.0.1])
	by duster.selinc.com (Spam Firewall) with ESMTP id C259B11FB3CA
	for <linux-mtd@lists.infradead.org>;
	Sun,  6 Apr 2008 19:43:01 -0700 (PDT)
Received: from edison2.selinc.com (edison2.ad.selinc.com [10.100.0.115]) by
	duster.selinc.com with ESMTP id x7E12eBi9Bm8GgwU for
	<linux-mtd@lists.infradead.org>;
	Sun, 06 Apr 2008 19:43:01 -0700 (PDT)
In-Reply-To: <20080407002343.GD31499@cloud.net.au>
To: linux-mtd@lists.infradead.org
Subject: Re: Question about ubimkvol vs. mkfs.ubifs
MIME-Version: 1.0
Message-ID: <OF3BD74720.49FBBF0A-ON88257424.000EAB26-88257424.000EE5DA@selinc.com>
From: Bruce_Leonard@selinc.com
Date: Sun, 6 Apr 2008 19:42:50 -0700
Content-Type: text/plain; charset="US-ASCII"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> mkfs.ubifs is for creating a ubifs image pre-populated with files eg
> your root file system, similar to mkfs.jffs2, genext2fs, etc. You don't
> need it to create a blank file system - in that case, just mount a blank
> volume as you are doing now.

Okay, that makes sense.  Thanks Hamish.

See 'ya!

Bruce
