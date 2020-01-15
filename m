Return-Path: <SRS0=8YuD=3E=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49328C32771
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Jan 2020 17:11:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C6FD214AF
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Jan 2020 17:11:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VY1izo5p";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="jGRi57OM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C6FD214AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/iFT8PpCmQzrWH1QdDFhJJwrvHtAKgftECDYt6t8g3U=; b=VY1izo5pcIBPid
	MzWTlSG08CIAhNLqhqmqP+Ik3QFfb+sosSzxW9zTRczfxZvoYOXcnxoUi66IR2LFuKH4LTuuihj7u
	RUl2+5H0zpMdALHi/QLWNu4zgVULtWAut7ldlp9QXQEVIs9guB6b7k8YeMVq1glKUb4lHR9rPEjd4
	SfuXuXeDFYqly9uS7Yn/Ok/l7X1FAhekSWO1Wd92Q8V7EplNQxdKoqIEmasGZGCiHD+BFZX0MMzjI
	rPhWJs6/4KBNFJdw/me1tiaXjh29dWpmGk9rlfrAgwmySSoJir9dBU9IRX8l/NvZs0l1we9paY1nB
	sYk/ANq0tJwjICPv1aBA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irmCf-0000CZ-Fr; Wed, 15 Jan 2020 17:11:37 +0000
Received: from userp2130.oracle.com ([156.151.31.86])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irmCY-0000CA-FH
 for linux-mtd@lists.infradead.org; Wed, 15 Jan 2020 17:11:35 +0000
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00FH9YWk059762;
 Wed, 15 Jan 2020 17:11:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=yodk3FXBxJ+C4bpH8jgyDdNJeLK8BCw4+p/mjjrGu6I=;
 b=jGRi57OMh1x0TFj3rivWK8oMNmRGnEM26tBEOTsVXZ0KoEYnD+vD+kUfJC7N9Q9hKrY9
 FyQSIcaoLmNanRUrwVSx2oCpicHju3dtqFcYg3frf2nv4KVRTXvQ/FD1BMqP4X+kOAk9
 73YoDwwSBCteTcyAYNDjU9jCtrJcmTyz2ycimS7vyFrFZ0ZgPzL03cuxP7VTI/bVwJEy
 FU7LlGBPdez1oPasB/r2kFvgADnC1bUJzk8eMXP/Mx7PPLFr/w7+naEL+Q0YlIbPgGYl
 7dJyRU6jwabybhhkxT+Dl5umB4dU2h3iI3tAm15nW9CAU1KXQJdf2jVWJk8Dy8rjqGxq iA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 2xf74sdfnf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jan 2020 17:11:02 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00FH9Xdk073935;
 Wed, 15 Jan 2020 17:11:01 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 2xj1apxkdc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jan 2020 17:11:00 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 00FHAopO016173;
 Wed, 15 Jan 2020 17:10:50 GMT
Received: from localhost (/67.169.218.210)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 15 Jan 2020 09:10:50 -0800
Date: Wed, 15 Jan 2020 09:10:47 -0800
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v4] fs: Fix page_mkwrite off-by-one errors
Message-ID: <20200115171047.GA8247@magnolia>
References: <20200108131528.4279-1-agruenba@redhat.com>
 <20200108165710.GA18523@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200108165710.GA18523@infradead.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9501
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001150130
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9501
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2001150130
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200115_091130_598796_C1863313 
X-CRM114-Status: GOOD (  19.98  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Jan Kara <jack@suse.cz>, Chao Yu <yuchao0@huawei.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Chris Mason <clm@fb.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Andreas Gruenbacher <agruenba@redhat.com>, Sage Weil <sage@redhat.com>,
 Richard Weinberger <richard@nod.at>, YueHaibing <yuehaibing@huawei.com>,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Chao Yu <chao@kernel.org>,
 Josef Bacik <josef@toxicpanda.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 Artem Bityutskiy <dedekind1@gmail.com>, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Linus Torvalds <torvalds@linux-foundation.org>,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Jan 08, 2020 at 08:57:10AM -0800, Christoph Hellwig wrote:
> I don't want to be the party pooper, but shouldn't this be a series
> with one patch to add the helper, and then once for each fs / piece
> of common code switched over?

The current patch in the iomap branch contains the chunks that add the
helper function, fix iomap, and whatever chunks for other filesystems
that don't cause /any/ merge complaints in for-next.  That means btrfs,
ceph, ext4, and ubifs will get fixed this time around.

Seeing as it's been floating around in for-next for a week now I'd
rather not rebase the branch just to rip out the four parts that haven't
given me any headaches so that they can be applied separately. :)

The acks from the other fs maintainers were very helpful, but at the
same time, I don't want to become a shadow vfs maintainer.

Therefore, whatever's in this v4 patch that isn't in [1] will have to be
sent separately.

[1] https://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git/commit/?h=iomap-5.6-merge&id=62e298db3fc3ebf41d996f3c86b44cbbdd3286bc

> On Wed, Jan 08, 2020 at 02:15:28PM +0100, Andreas Gruenbacher wrote:
> > Hi Darrick,
> > 
> > here's an updated version with the latest feedback incorporated.  Hope
> > you find that useful.
> > 
> > As far as the f2fs merge conflict goes, I've been told by Linus not to
> > resolve those kinds of conflicts but to point them out when sending the
> > merge request.  So this shouldn't be a big deal.
> 
> Also this isn't really the proper way to write a commit message.  This
> text would go into the cover letter if it was a series..

<urk> Yeah.

--D

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
