Return-Path: <SRS0=BdDe=UY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28A4BC48BD5
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Jun 2019 18:04:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F18FA208E3
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Jun 2019 18:04:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ir2x4SSh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ksyT2XyN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F18FA208E3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mc0LoJ5L37N3SSmGEyk5IUCDaKMeRddj+4DfgESUVJg=; b=ir2x4SShIg17to
	JLgQiTUwnekA33z54GUzclizO/vdC6HT2/KnMm4MifQfdBhtLu0IFp/O3mxy69K1pkepGqr45xoko
	Bgk0C9Z28PiOLC8/zrsKRs4EkpxxlVF8W4AR1yoasb0Gbr8G9jpY/ko+7EBuh5QBVcrgJF9MkI69m
	s5YtCMfSoTDJsTxqOiJiFbLeruFQySvzIUWHAVoVjbXUH7DH8u19XwnBSPdvleqSPOYVVw5Do6Vgs
	qhPWlo+rXBrjLVWTdFTqBF3oHROKN/7DKtclF2frNfbNAFSKRQxYYGwiiXPp7maGPluOdbdEuw//w
	KYzyS9mmILTt16qgPvLw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hfpni-0006iC-Qv; Tue, 25 Jun 2019 18:04:14 +0000
Received: from userp2130.oracle.com ([156.151.31.86])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfpnS-0006SS-8s
 for linux-mtd@lists.infradead.org; Tue, 25 Jun 2019 18:04:02 +0000
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5PHwd8B149230;
 Tue, 25 Jun 2019 18:03:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2018-07-02;
 bh=q3PQ3FdT4Cu9ZFxkmPMEB5w+ChSGz6mW1jtUBkoDAvw=;
 b=ksyT2XyNq/sBFuNf0kcEOahW5dSfpRm2xoyvLHIl5Mejyeb4JLMflOsVy5quxvpN67j2
 IsKXQAf1HGSoM5FioAjK6ozKyUInygd/ml7l4zpRXtxh/UWz20oKY/FTMlcYaDZBA7N9
 MY/zMgGVdosxoetsazUmPfKqNstqSPWvasVhjypJJqeFcHhDaP62mxpCpMaNSfCtaBX3
 JdFoGt472fc1h8ZFinUmpgHsBMZcZBqagXk/T9NnnQ5VQ3pfbtpwxQaYR4yLbxZKG58n
 MOx1qf1doyupoPytNdwt2e/QYdozJOX4KCvtmdKWmiW/VFWoTbAzfyslOGA2S3jKu5TS Qg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 2t9brt61nv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Jun 2019 18:03:42 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5PI2jR6140649;
 Tue, 25 Jun 2019 18:03:41 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3020.oracle.com with ESMTP id 2t9p6ub7ds-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 25 Jun 2019 18:03:41 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x5PI3fsX143158;
 Tue, 25 Jun 2019 18:03:41 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 2t9p6ub7dj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Jun 2019 18:03:41 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x5PI3VCg025882;
 Tue, 25 Jun 2019 18:03:31 GMT
Received: from localhost (/67.169.218.210)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 25 Jun 2019 11:03:31 -0700
Date: Tue, 25 Jun 2019 11:03:26 -0700
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v4 0/7] vfs: make immutable files actually immutable
Message-ID: <20190625180326.GC2230847@magnolia>
References: <156116141046.1664939.11424021489724835645.stgit@magnolia>
 <20190625103631.GB30156@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190625103631.GB30156@infradead.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9299
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=904 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906250136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190625_110358_478000_EA2CDE1E 
X-CRM114-Status: GOOD (  21.92  )
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
Cc: linux-efi@vger.kernel.org, linux-btrfs@vger.kernel.org, yuchao0@huawei.com,
 linux-mm@kvack.org, clm@fb.com, adilger.kernel@dilger.ca,
 matthew.garrett@nebula.com, linux-nilfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, devel@lists.orangefs.org, josef@toxicpanda.com,
 reiserfs-devel@vger.kernel.org, viro@zeniv.linux.org.uk, dsterba@suse.com,
 jaegeuk@kernel.org, tytso@mit.edu, ard.biesheuvel@linaro.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, jk@ozlabs.org, jack@suse.com,
 linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
 ocfs2-devel@oss.oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Jun 25, 2019 at 03:36:31AM -0700, Christoph Hellwig wrote:
> On Fri, Jun 21, 2019 at 04:56:50PM -0700, Darrick J. Wong wrote:
> > Hi all,
> > 
> > The chattr(1) manpage has this to say about the immutable bit that
> > system administrators can set on files:
> > 
> > "A file with the 'i' attribute cannot be modified: it cannot be deleted
> > or renamed, no link can be created to this file, most of the file's
> > metadata can not be modified, and the file can not be opened in write
> > mode."
> > 
> > Given the clause about how the file 'cannot be modified', it is
> > surprising that programs holding writable file descriptors can continue
> > to write to and truncate files after the immutable flag has been set,
> > but they cannot call other things such as utimes, fallocate, unlink,
> > link, setxattr, or reflink.
> 
> I still think living code beats documentation.  And as far as I can
> tell the immutable bit never behaved as documented or implemented
> in this series on Linux, and it originated on Linux.

The behavior has never been consistent -- since the beginning you can
keep write()ing to a fd after the file becomes immutable, but you can't
ftruncate() it.  I would really like to make the behavior consistent.
Since the authors of nearly every new system call and ioctl since the
late 1990s have interpreted S_IMMUTABLE to mean "immutable takes effect
everywhere immediately" I resolved the inconsistency in favor of that
interpretation.

I asked Ted what he thought that that userspace having the ability to
continue writing to an immutable file, and he thought it was an
implementation bug that had been there for 25 years.  Even he thought
that immutable should take effect immediately everywhere.

> If you want  hard cut off style immutable flag it should really be a
> new API, but I don't really see the point.  It isn't like the usual
> workload is to set the flag on a file actively in use.

FWIW Ted also thought that since it's rare for admins to set +i on a
file actively in use we could just change it without forcing everyone
onto a new api.

--D

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
