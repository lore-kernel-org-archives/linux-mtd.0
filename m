Return-Path: <SRS0=yQQQ=UK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,UNPARSEABLE_RELAY autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEEDEC43218
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Jun 2019 04:47:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BEA0020820
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Jun 2019 04:47:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j9UqznYb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Wbxv9JvX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BEA0020820
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FCUH/e7qyBCfNtFBVRmqbPY99MJHitsLA9EcRyKcVD8=; b=j9UqznYbTvCRZz
	cvXnB0fXU04vl0gmfzOTRA07YIy14oGB51oehWQrfYXyfI3fl+uNPP6Y6aKGzJAZh2saYVdCA2fh7
	lsv/jnd7nPs7Ipu48jc2+FewVIerJI9bIeF3Z/GN8VGbpVVxt2/JMbNFEuIHr8Fa2SnA2yIS85je7
	Fgt3Mj6AwP7lRKuqasXwvd6h7oEJNAvwK2iLcPMxwzFrJnWPo3eCRxoH/xVoHrvtdT4zaTEVzhJWL
	2tnnRbf7RqkYP1Coa5Ibspgv1HAXiQDCFlKD8YdB+fn5gRh66zwABf0ONuqam+AT/KWp0I2pibjvq
	8NzzSZ5Dbj//YQEyzo2w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1haYgZ-0006Ae-JV; Tue, 11 Jun 2019 04:47:03 +0000
Received: from userp2120.oracle.com ([156.151.31.85])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1haYfz-0005c3-1p
 for linux-mtd@lists.infradead.org; Tue, 11 Jun 2019 04:46:28 +0000
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5B4hbqV168941;
 Tue, 11 Jun 2019 04:46:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : from : to :
 cc : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=corp-2018-07-02;
 bh=pN1LjauC+CPRpWSlRyHgYDY9uUd71KnW85D+Xgmc0hA=;
 b=Wbxv9JvX5jua5fmuVf4WLo6oJ0xopMG6S8aXI4zN/zs6GcRiHLoYZHkBF5Ah+etbHjTV
 t4okax2hJ3ZVZLDfOnry0LnaCkQXAxd8eqpU+iocpvfiiR1CWCg1NzVCJmaIfvWHV194
 QtqmADNFWvMmnihKxYNSgBTszEjVDoaUqvNZfvuCZjzUhsySldlo6UNBrTBJvmTEgx1f
 n+Vqqb4e4J8Mjiq9yPSu2kbcM443RIt0eblRTUvtpGYSQuclN4ep0QiNQ/dHErKEUpk9
 FkRZvBXQI3KN8CkkvkA43MSVuLyOkec/HAUj8mptHg+pR+i+IldvyaD5z8t5XdDV16Zd UA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 2t05nqjh5g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 Jun 2019 04:46:16 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5B4k8F4173710;
 Tue, 11 Jun 2019 04:46:15 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3020.oracle.com with ESMTP id 2t0p9r34ed-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 11 Jun 2019 04:46:15 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x5B4kFaV174053;
 Tue, 11 Jun 2019 04:46:15 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 2t0p9r34e7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 Jun 2019 04:46:15 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x5B4kCRS002575;
 Tue, 11 Jun 2019 04:46:12 GMT
Received: from localhost (/67.169.218.210)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 10 Jun 2019 21:46:11 -0700
Subject: [PATCH v3 0/6] vfs: make immutable files actually immutable
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: matthew.garrett@nebula.com, yuchao0@huawei.com, tytso@mit.edu,
 darrick.wong@oracle.com, ard.biesheuvel@linaro.org,
 josef@toxicpanda.com, clm@fb.com, adilger.kernel@dilger.ca,
 viro@zeniv.linux.org.uk, jack@suse.com, dsterba@suse.com,
 jaegeuk@kernel.org, jk@ozlabs.org
Date: Mon, 10 Jun 2019 21:46:09 -0700
Message-ID: <156022836912.3227213.13598042497272336695.stgit@magnolia>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9284
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906110033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190610_214627_288091_7D7F32E5 
X-CRM114-Status: GOOD (  13.08  )
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
Cc: linux-efi@vger.kernel.org, linux-btrfs@vger.kernel.org,
 linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-mm@kvack.org, linux-nilfs@vger.kernel.org, linux-mtd@lists.infradead.org,
 ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, devel@lists.orangefs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi all,

The chattr(1) manpage has this to say about the immutable bit that
system administrators can set on files:

"A file with the 'i' attribute cannot be modified: it cannot be deleted
or renamed, no link can be created to this file, most of the file's
metadata can not be modified, and the file can not be opened in write
mode."

Given the clause about how the file 'cannot be modified', it is
surprising that programs holding writable file descriptors can continue
to write to and truncate files after the immutable flag has been set,
but they cannot call other things such as utimes, fallocate, unlink,
link, setxattr, or reflink.

Since the immutable flag is only settable by administrators, resolve
this inconsistent behavior in favor of the documented behavior -- once
the flag is set, the file cannot be modified, period.  We presume that
administrators must be trusted to know what they're doing, and that
cutting off programs with writable fds will probably break them.

Therefore, add immutability checks to the relevant VFS functions, then
refactor the SETFLAGS and FSSETXATTR implementations to use common
argument checking functions so that we can then force pagefaults on all
the file data when setting immutability.

Note that various distro manpages points out the inconsistent behavior
of the various Linux filesystems w.r.t. immutable.  This fixes all that.

If you're going to start using this mess, you probably ought to just
pull from my git trees, which are linked below.

This has been lightly tested with fstests.  Enjoy!
Comments and questions are, as always, welcome.

--D

kernel git tree:
https://git.kernel.org/cgit/linux/kernel/git/djwong/xfs-linux.git/log/?h=immutable-files

fstests git tree:
https://git.kernel.org/cgit/linux/kernel/git/djwong/xfstests-dev.git/log/?h=immutable-files

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
