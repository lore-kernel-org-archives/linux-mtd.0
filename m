Received: from szxga03-in.huawei.com ([119.145.14.66])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XCJEK-0007OR-NY
 for linux-mtd@lists.infradead.org; Wed, 30 Jul 2014 02:03:01 +0000
Message-ID: <53D85203.7030302@huawei.com>
Date: Wed, 30 Jul 2014 10:01:39 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: Bill Pringlemeir <bpringlemeir@nbsps.com>
Subject: Re: [PATCH RFC v2] UBI: New ioctl() to support ubidump
References: <53D7677A.6000905@huawei.com> <53D768B5.6090409@huawei.com>
 <87vbqgb4re.fsf@nbsps.com>
In-Reply-To: <87vbqgb4re.fsf@nbsps.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> 
> I think a patch to 'ubi_scan()' to create an 'pmap' array might be
> better or more accepted than a Linux/MTD/UBI patch?  Then only the
> 'ubidump' code is needed and not a properly configured/versioned kernel;
> or at least only the nandsim module which is similar to some other
> utilities.  If you had a 'ubi_scan()' which has an 'info->pmap[leb]'
> which had,
> 

Yes, I think you are right~! I don't want this utility can't be run
without a properly configured kernel and this full-scan method will
be used again when we dumping with an image file.

But I'm worry about the performance. As we dump one specified peb
now, we can't record the mapping table and need to do full scan
each time running this utility.

Anyway, I will try what you said first~!

Thanks~!

Hu
