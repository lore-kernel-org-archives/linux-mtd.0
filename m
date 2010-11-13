Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PHDVp-0000gK-VN
	for linux-mtd@lists.infradead.org; Sat, 13 Nov 2010 10:39:14 +0000
Received: by bwz5 with SMTP id 5so3936285bwz.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 13 Nov 2010 02:39:12 -0800 (PST)
Subject: Re: [PATCH 1/5] mtd: fix bdev exclusive open bugs in
	block2mtd::add_device()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Tejun Heo <tj@kernel.org>
In-Reply-To: <1288628129-12811-2-git-send-email-tj@kernel.org>
References: <1288628129-12811-1-git-send-email-tj@kernel.org>
	<1288628129-12811-2-git-send-email-tj@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 13 Nov 2010 12:38:55 +0200
Message-ID: <1289644735.2218.8.camel@localhost>
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

Hi,

On Mon, 2010-11-01 at 17:15 +0100, Tejun Heo wrote:
> +			if (!IS_ERR(bdev)) {
> +				int ret;
> +				ret = bd_claim(bdev, dev);
> +				if (ret) {
> +					blkdev_put(bdev,
> +						   FMODE_READ | FMODE_WRITE);

Would be a bit cleaner to define ea temporary variable:

fmode_t mode = FMODE_READ | FMODE_WRITE;

Would you to re-send with this little change please?

And ideally, 2 independent patches would be nicer because you fix 2
independent issues.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
