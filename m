Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PHE0S-0002Q7-S2
	for linux-mtd@lists.infradead.org; Sat, 13 Nov 2010 11:10:53 +0000
Received: by bwz5 with SMTP id 5so3949926bwz.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 13 Nov 2010 03:10:51 -0800 (PST)
Subject: Re: [PATCH 1/5] mtd: fix bdev exclusive open bugs in
	block2mtd::add_device()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Tejun Heo <tj@kernel.org>
In-Reply-To: <4CDE6BB2.5070806@kernel.org>
References: <1288628129-12811-1-git-send-email-tj@kernel.org>
	<1288628129-12811-2-git-send-email-tj@kernel.org>
	<1289644735.2218.8.camel@localhost>  <4CDE6BB2.5070806@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 13 Nov 2010 13:10:34 +0200
Message-ID: <1289646634.2218.25.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: jack@suse.cz, leochen@broadcom.com, neilb@suse.de,
	heiko.carstens@de.ibm.com, dm-devel@redhat.com,
	adilger.kernel@dilger.ca, konishi.ryusuke@lab.ntt.co.jp,
	shaggy@linux.vnet.ibm.com, drbd-dev@lists.linbit.com,
	joel.becker@oracle.com, hch@infradead.org, aelder@sgi.com,
	mfasheh@suse.com, joern@logfs.org,
	reiserfs-devel@vger.kernel.org, viro@zeniv.linux.org.uk,
	swhiteho@redhat.com, chris.mason@oracle.com, axboe@kernel.dk,
	tytso@mit.edu, petero2@telia.com, linux-kernel@vger.kernel.org,
	schwidefsky@de.ibm.com, linux-mtd@lists.infradead.org,
	akpm@linux-foundation.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2010-11-13 at 11:42 +0100, Tejun Heo wrote:
> Hmmm... not really.  The patch is small enough and splitting it won't
> really buy as any better bisectability.  Splitting patches into
> logical changes is a good thing but it's no religious dogma.  Let's
> apply it to the point it actually helps.

Well, it is more about if your second fix is buggy, we could revert it
without reverting the first fix. But anyway, this is not a big deal, so
let's forget about this indeed.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
