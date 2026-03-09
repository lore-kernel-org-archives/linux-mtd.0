Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E34CFCA168
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Mar 2026 17:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:References:
	In-Reply-To:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=tLDPUHB83J7IBT6IewkH0V991AvnJrggJMgofZ4VFV4=; b=1ktnYfcCPNUr4NSIREmyYb5yHB
	iBbeeNL0Dz5y6mgvDutVjRKmwjGCf9rPs+uzfLdTyKZHmyupkqHkCMyyLawKxnDlDI/pBqJLN3vcH
	QUYq6V4r889p0LJfsgXcEdj6z0OUk3u8QbItjSgfkzeKSLUs+78PJlqf7ckaNTYPYGl2JleFF7BBV
	Q9ByMR/vPDYSMheXlFkFlHCajN7evt6GDu3ofGUrtteKh5+26Zg/5tek3x9glHk4ULGAoK3FLIAZ8
	WKtwvSNfuN9Co9Sx48EwNXXoRtJhyxhhO0bT0hjIIEZ4ettv4B1LhqpzSpEItmk2RZTEaaruo22P3
	4Vkl8Hrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzehV-00000007qNK-0jyy;
	Mon, 09 Mar 2026 17:47:29 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzehQ-00000007qMR-3wJ7;
	Mon, 09 Mar 2026 17:47:26 +0000
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629F7to91275175;
	Mon, 9 Mar 2026 17:47:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=k/HLlQ
	fqfXVQs+Pamcq/LePEaOpgjPTSxe75E2LQHmw=; b=O46FAzGvsE2YmZ6439UqTH
	f//oqGS2NuJoB8xY2lcg12hMD2aNtQ4ID9XxubauhUUNB5XWruUCNbrIED9U/sy2
	gQV+VyjgSVjVmAG4Kam45dqeg/cEF7wexHdqP7q6amhZ86wA+YW4+a7JvMwqNGHX
	K+CR1szr/+ThnSfgYQtyXM8JHrNaKlVVJxj2UpO9B9nfw7GY0lpUaQgYj3FXUBhW
	hCYFfYxjosdklAtClo/CAOyDK0Kz8Ak4d419uQhCeU81c/npAiEGpAq1IaGDP95R
	6czGdohxtpKDTNPNp0U2JdVL6ApX0w6YBruEMYsSerjEZYuw8x9syT1jr4FLueng
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4crcvr7huu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Mar 2026 17:47:15 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 629FqYI5015725;
	Mon, 9 Mar 2026 17:47:14 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4cs121wp59-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Mar 2026 17:47:14 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 629HlDVJ60162522
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 9 Mar 2026 17:47:13 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5E5775805A;
	Mon,  9 Mar 2026 17:47:13 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4442758054;
	Mon,  9 Mar 2026 17:47:09 +0000 (GMT)
Received: from li-43857255-d5e6-4659-90f1-fc5cee4750ad.ibm.com (unknown [9.61.72.80])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  9 Mar 2026 17:47:09 +0000 (GMT)
Message-ID: <05b5d55c49b5a1bbc43a5315e3c84872e7e634b3.camel@linux.ibm.com>
Subject: Re: [PATCH v3 00/12] vfs: change inode->i_ino from unsigned long
 to u64
From: Mimi Zohar <zohar@linux.ibm.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-trace-kernel@vger.kernel.org, nvdimm@lists.linux.dev,
        fsverity@lists.linux.dev, linux-mm@kvack.org, netfs@lists.linux.dev,
        linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
        linux-nfs@vger.kernel.org, linux-cifs@vger.kernel.org,
        samba-technical@lists.samba.org, linux-nilfs@vger.kernel.org,
        v9fs@lists.linux.dev, linux-afs@lists.infradead.org,
        autofs@vger.kernel.org, ceph-devel@vger.kernel.org,
        codalist@coda.cs.cmu.edu, ecryptfs@vger.kernel.org,
        linux-mtd@lists.infradead.org, jfs-discussion@lists.sourceforge.net,
        ntfs3@lists.linux.dev, ocfs2-devel@lists.linux.dev,
        devel@lists.orangefs.org, linux-unionfs@vger.kernel.org,
        apparmor@lists.ubuntu.com, linux-security-module@vger.kernel.org,
        linux-integrity@vger.kernel.org, selinux@vger.kernel.org,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        netdev@vger.kernel.org, linux-perf-users@vger.kernel.org,
        linux-fscrypt@vger.kernel.org, linux-xfs@vger.kernel.org,
        linux-hams@vger.kernel.org, linux-x25@vger.kernel.org,
        audit@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-can@vger.kernel.org, linux-sctp@vger.kernel.org,
        bpf@vger.kernel.org
In-Reply-To: <20260304-iino-u64-v3-0-2257ad83d372@kernel.org>
References: <20260304-iino-u64-v3-0-2257ad83d372@kernel.org>
Date: Mon, 09 Mar 2026 13:47:08 -0400
MIME-Version: 1.0
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE1OCBTYWx0ZWRfX4MWriKER56jj
 FHMwPduc6Ya80ytljBjcJCflJZJQpLHypO90MyIljV3F+YGnUEWqD2zkjjI4tBlT1Isyk88nQqD
 Bxsi6y6lZ0wNsui73O82C4s92lOeLYZxoPRW/EZDUOjQSMymQTWQJKaIWTXxL4ETx9VAdofRsxH
 1pntH+n6NhQwxXW3M12fPcKiL5ADcuXldDKiDw4m+7ix+qwvBlo3nspOLghaJ2LE6mxrOiKA5Lh
 GMTERNprgwZauxVcqC/p8dLI9p6C/LOkJmscaf6mdPih3AOPO2LV5vS62FSOrim10LguG5ezUsF
 rdAkmDzMNpwcB3l0gkLlsufFyGUR7bS4yrPNzNHAbiSDJiUdpsUzX7AZ0qjMDEeQhvmbO0coQJz
 4Dc1QnM6RvCUkwZGaB0uRcWv6crLl/+68sTOTDKRYLJY7AFXUTAN+lczmFotg9pSQAz65D+NPWn
 mWAaXfwB8yIBs0IZagQ==
X-Proofpoint-GUID: k-5kS7gQwSwb7EbHSrKEnUBgm0EngagK
X-Proofpoint-ORIG-GUID: k-5kS7gQwSwb7EbHSrKEnUBgm0EngagK
X-Authority-Analysis: v=2.4 cv=QoFTHFyd c=1 sm=1 tr=0 ts=69af07a3 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=VwQbUJbxAAAA:8
 a=x61hcHDQ_TxU8J0rBBAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_04,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1011 malwarescore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603090158
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_104725_463761_7E4EBA5F 
X-CRM114-Status: GOOD (  25.79  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
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

[ I/O socket time out.  Trimming the To list.]

On Wed, 2026-03-04 at 10:32 -0500, Jeff Layton wrote:
> This version squashes all of the format-string changes and the i_ino
> type change into the same patch. This results in a giant 600+ line patch
> at the end of the series, but it does remain bisectable.  Because the
> patchset was reorganized (again) some of the R-b's and A-b's have been
> dropped.
> 
> The entire pile is in the "iino-u64" branch of my tree, if anyone is
> interested in testing this.
> 
>     https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git/
> 
> Original cover letter follows:
> 
> ----------------------8<-----------------------
> 
> Christian said [1] to "just do it" when I proposed this, so here we are!
> 
> For historical reasons, the inode->i_ino field is an unsigned long,
> which means that it's 32 bits on 32 bit architectures. This has caused a
> number of filesystems to implement hacks to hash a 64-bit identifier
> into a 32-bit field, and deprives us of a universal identifier field for
> an inode.
> 
> This patchset changes the inode->i_ino field from an unsigned long to a
> u64. This shouldn't make any material difference on 64-bit hosts, but
> 32-bit hosts will see struct inode grow by at least 4 bytes. This could
> have effects on slabcache sizes and field alignment.
> 
> The bulk of the changes are to format strings and tracepoints, since the
> kernel itself doesn't care that much about the i_ino field. The first
> patch changes some vfs function arguments, so check that one out
> carefully.
> 
> With this change, we may be able to shrink some inode structures. For
> instance, struct nfs_inode has a fileid field that holds the 64-bit
> inode number. With this set of changes, that field could be eliminated.
> I'd rather leave that sort of cleanups for later just to keep this
> simple.
> 
> Much of this set was generated by LLM, but I attributed it to myself
> since I consider this to be in the "menial tasks" category of LLM usage.
> 
> [1]: https://lore.kernel.org/linux-fsdevel/20260219-portrait-winkt-959070cee42f@brauner/
> 
> Signed-off-by: Jeff Layton <jlayton@kernel.org>

Jeff, missing from this patch set is EVM.  In hmac_add_misc() EVM copies the
i_ino and calculates either an HMAC or file meta-data hash, which is then
signed. 

Mimi

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
