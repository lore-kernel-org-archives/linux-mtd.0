Return-Path: <SRS0=BdDe=UY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B8AAC48BD6
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Jun 2019 18:20:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E5FE2080C
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Jun 2019 18:20:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pusf3xL2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="sq8wRGFM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E5FE2080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wtdgxI/nVTdOIUqvW1NT89Kz9dSy0yldCNtmsi/ETzA=; b=pusf3xL2g5RtVm
	ziCRGeZm5BSl4jW/gTX8+ynjXMKSh7DBqPDQKOcUq2eVZo7ZDGa/k0PU8KYmknE8jv+t6per+6x6f
	kNbxpF2HS33mE+oIxW5OT7OiDydlrD+XDB9sxJF4tX9PW6Udki0i5wdEV2p39fr0U5YlT492l03i6
	CnRAUeanfOayoX+oMwfoldKSa/FXKMeF9j6fFFkgZ3hAOTNQZGPtq/ultymG6NIX7UPouIotAUU95
	Cdh1MyT6LTHvnJDY8MIPJBASX7xN+8Ue0Aq0GJa2Bc9KELuys8bLcKmpHz9brICxZgEygMlQm7Jep
	T67S2Bo9+s3T6kr/65Ww==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hfq2k-0005UU-4j; Tue, 25 Jun 2019 18:19:46 +0000
Received: from userp2130.oracle.com ([156.151.31.86])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfq0t-0003xN-1W
 for linux-mtd@lists.infradead.org; Tue, 25 Jun 2019 18:17:54 +0000
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5PI4epq154535;
 Tue, 25 Jun 2019 18:17:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2018-07-02;
 bh=lmgK8Cm3Fl3Y68PjHL3I/TBSUBy/0hTgnkbGgtqK7rI=;
 b=sq8wRGFMDp2keeCzfEbQvRF23m4FZdHqzF6KTStnvsnqKgYJRFIybtKXIRJ/BkjACsOp
 VHjdfFdvkzl4/Qyds9SgcqVsToxzG/t5q2X6QJw92ykC0hsb2bCu0+1HnE8/vR1cKWgj
 9LAuCEvVM/6Q8BB9oO+b2Er0NdC/PFqDczBk7D1I2Io7k9QsIy4cloHAf7QWxHhbVscL
 fa9qlI7JJ3E8N38P1RnUBSFFAK1Ox9ur0vfVe7sOoxdIUQu71AdGqU2biDBGiUMsl2PB
 KOtGcPBYzfwUGEHU5Q7xPZKcvd0Ct/iT3yoSupbQ+ljJ3hcRKX4C0zF8TH1T/hnyBICA pg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 2t9brt63t2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Jun 2019 18:17:39 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5PIHUke113170;
 Tue, 25 Jun 2019 18:17:38 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3030.oracle.com with ESMTP id 2t9acc8wvk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 25 Jun 2019 18:17:38 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x5PIHcHG113583;
 Tue, 25 Jun 2019 18:17:38 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 2t9acc8wve-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Jun 2019 18:17:38 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x5PIHai8000391;
 Tue, 25 Jun 2019 18:17:36 GMT
Received: from localhost (/67.169.218.210)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 25 Jun 2019 11:17:36 -0700
Date: Tue, 25 Jun 2019 11:17:33 -0700
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: dsterba@suse.cz, matthew.garrett@nebula.com, yuchao0@huawei.com,
 tytso@mit.edu, shaggy@kernel.org, ard.biesheuvel@linaro.org,
 josef@toxicpanda.com, clm@fb.com, adilger.kernel@dilger.ca,
 jk@ozlabs.org, jack@suse.com, dsterba@suse.com, jaegeuk@kernel.org,
 viro@zeniv.linux.org.uk, cluster-devel@redhat.com,
 jfs-discussion@lists.sourceforge.net, linux-efi@vger.kernel.org,
 Jan Kara <jack@suse.cz>, reiserfs-devel@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-mtd@lists.infradead.org, ocfs2-devel@oss.oracle.com,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Subject: Re: [PATCH 1/4] vfs: create a generic checking function for
 FS_IOC_SETFLAGS
Message-ID: <20190625181733.GG5375@magnolia>
References: <156116136742.1664814.17093419199766834123.stgit@magnolia>
 <156116138140.1664814.9610454726122206157.stgit@magnolia>
 <20190625171254.GT8917@twin.jikos.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190625171254.GT8917@twin.jikos.cz>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9299
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906250137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190625_111751_400995_6422AF0D 
X-CRM114-Status: GOOD (  14.14  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Jun 25, 2019 at 07:12:54PM +0200, David Sterba wrote:
> On Fri, Jun 21, 2019 at 04:56:21PM -0700, Darrick J. Wong wrote:
> > From: Darrick J. Wong <darrick.wong@oracle.com>
> > 
> > Create a generic checking function for the incoming FS_IOC_SETFLAGS flag
> > values so that we can standardize the implementations that follow ext4's
> > flag values.
> 
> I checked a few samples what's the type of the flags, there are unsigned
> types while the proposed VFS functions take signed type.
> 
> > +int vfs_ioc_setflags_check(struct inode *inode, int oldflags, int flags);
> 
> Specifically ext4 uses unsigned type and his was the original API that
> got copied so I'd think that it should unsigned everywhere.

Yeah, I'll change it.

> >  fs/btrfs/ioctl.c    |   13 +++++--------
> 
> For the btrfs bits
> 
> Acked-by: David Sterba <dsterba@suse.com>
> 
> and besides the signedness, the rest of the changes look good to me.

Thanks for the look around!  I'll have a new revision with all changes
out by the end of the day. :)

--D

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
