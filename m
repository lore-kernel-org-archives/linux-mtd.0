Received: from hera.kernel.org ([140.211.167.34])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PHDaH-0000rP-NA
	for linux-mtd@lists.infradead.org; Sat, 13 Nov 2010 10:43:49 +0000
Message-ID: <4CDE6BB2.5070806@kernel.org>
Date: Sat, 13 Nov 2010 11:42:58 +0100
From: Tejun Heo <tj@kernel.org>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH 1/5] mtd: fix bdev exclusive open bugs in
	block2mtd::add_device()
References: <1288628129-12811-1-git-send-email-tj@kernel.org>	
	<1288628129-12811-2-git-send-email-tj@kernel.org>
	<1289644735.2218.8.camel@localhost>
In-Reply-To: <1289644735.2218.8.camel@localhost>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

On 11/13/2010 11:38 AM, Artem Bityutskiy wrote:
> On Mon, 2010-11-01 at 17:15 +0100, Tejun Heo wrote:
>> +			if (!IS_ERR(bdev)) {
>> +				int ret;
>> +				ret = bd_claim(bdev, dev);
>> +				if (ret) {
>> +					blkdev_put(bdev,
>> +						   FMODE_READ | FMODE_WRITE);
> 
> Would be a bit cleaner to define ea temporary variable:
> 
> fmode_t mode = FMODE_READ | FMODE_WRITE;
> 
> Would you to re-send with this little change please?

Yeap, sure.

> And ideally, 2 independent patches would be nicer because you fix 2
> independent issues.

Hmmm... not really.  The patch is small enough and splitting it won't
really buy as any better bisectability.  Splitting patches into
logical changes is a good thing but it's no religious dogma.  Let's
apply it to the point it actually helps.

Thank you.

-- 
tejun
