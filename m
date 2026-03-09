Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAA51FCA17B
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Mar 2026 20:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:References:
	In-Reply-To:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=B2utpsWucSvTOY5fAlfLWQpExl/Tlt6AkLtJYzEQjrA=; b=NQPkdXlF7XifpywSW131IA9Kqi
	P8J9ezCjhw12pdC+7fZhcAjOmO9xYgQg6B0RdBa5PQWHQdqyWxWCog1Xhj/SHPcITGaJfr64ykgCP
	i1/Mnz5fkc/G/kBBcchUwk/iHjBIpr/PWrKJeM7JMur/neLgVp4PfMaL5nv9/sa5//baNDnDB8s4A
	8wGtsg/zGiNvWUXLjHZuVTUt9/fPhgkSSrXG/DSAcui8smgm6Yj9ouEycXLXXiUPqJjJ53S1Bdrqv
	2MuQJBI1UOqzGqnnfCe6j3JCUeu3AYfm46/laYWSutNB7L2Ht1OwhewfoceRq+g7PjsMavX1HAvW4
	6u4gMNkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzgwh-000000086j2-3uSr;
	Mon, 09 Mar 2026 20:11:19 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzgwe-000000086iT-20HA;
	Mon, 09 Mar 2026 20:11:18 +0000
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629FwFY71433673;
	Mon, 9 Mar 2026 20:11:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=J+MReH
	kdFCzDINevGmN7BYrD5h16dkVpWOVjmnX1Q/k=; b=AMPyvjp0jQUNgXn6Hk1tmf
	EG4FCBlJk8vU0dzchEkhTCFJFLesmCchgPistcAgAs639vnP9pptng8kXMAbzOia
	q5NshJyvTNfof8gdYp1GzwxZulybshI3PqRKjOb/SaI0UPEJrIt4jyexAIN48Wm0
	w/Mw3wPT6W3BQmrKZWXHn6/DFARVTupqS/iLqqNyLrME9wToruViZdwdbBsu3Qtl
	0zEFIHGN04u6+OjrW21Tgfm9LJbMSCz1cBRZneiIQ0NfJfCZ4Y4F3a9ghOwfDLyJ
	r+N+wncn0OldU7zZnFVO0t6vNaRxLqtcCgLdbScpUcJtgriSZx0KQ9bsYjERgKcw
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4crcuy86s0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Mar 2026 20:11:07 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 629JvVsj024649;
	Mon, 9 Mar 2026 20:11:06 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4cs0jjx73p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Mar 2026 20:11:06 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 629KB6ZU9699942
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 9 Mar 2026 20:11:06 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 276F258051;
	Mon,  9 Mar 2026 20:11:06 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4A42F5805E;
	Mon,  9 Mar 2026 20:11:03 +0000 (GMT)
Received: from li-43857255-d5e6-4659-90f1-fc5cee4750ad.ibm.com (unknown [9.61.72.80])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  9 Mar 2026 20:11:03 +0000 (GMT)
Message-ID: <0bd92b4fce00a6111a0fc7764904f7e6ae0ece3a.camel@linux.ibm.com>
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
In-Reply-To: <dd3f9873c7939fba0ca2366effd24e4b6326f17b.camel@kernel.org>
References: <20260304-iino-u64-v3-0-2257ad83d372@kernel.org>
				 <05b5d55c49b5a1bbc43a5315e3c84872e7e634b3.camel@linux.ibm.com>
			 <f22758116dabd3c135a833bcb5cfcd2ea4f6ecf4.camel@kernel.org>
		 <c9500adc562665d44feaca9206f23a5ba07432c1.camel@linux.ibm.com>
	 <dd3f9873c7939fba0ca2366effd24e4b6326f17b.camel@kernel.org>
Date: Mon, 09 Mar 2026 16:11:02 -0400
MIME-Version: 1.0
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=EK4LElZC c=1 sm=1 tr=0 ts=69af295b cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=uAbxVGIbfxUO_5tXvNgY:22 a=VwQbUJbxAAAA:8
 a=Ohuc5M0UGw20_VvRb6sA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE3OCBTYWx0ZWRfX48NInAXNxJ9I
 cqZ2w42oLBKp6f6ShdJYkvtWo35W1xBR9wJ3/AMrAgqtjjRmHF+LNmGqeG928jRHEGfhi5Dc3Ir
 wmrxB6T58L1jgUeut/UN4ASDb+YKdYMu+ThxKOBJOKt26YDnsAlMtjSvmCcaxE+TT5Ibe0zYC0f
 zBgbUGDl6m62+LPcwjv67C82HPGKVuU4mQ7dUKg2Sv0H9xprcqNV55N1hEVQyFV4pb7QXKtAhGE
 YVUSx215hmiPcMqQdaRgfBi/PErZi+WGgzrtD+EeiIqh5iBJfaUE0yW08tvcIRwoQr42lAufyzB
 vYZKyixwfkjfLVLXUjHMdBtRGJrXaAm82jJw9wIV+5PYqMOONm6AlqMVRpwFh8k3h3nwk8wQiR2
 zhIg8VMnQ/RF3WK3QDU7+acPMfehsyHGr854HkqAG/4Nm9pp74q0YkbWa+CcmHp5NJJ/sMPIvY9
 s27fVbRyzlJIijxgTKg==
X-Proofpoint-GUID: xB1hrjZmRj2bIZxp5d4ApU8QU-_XE2VB
X-Proofpoint-ORIG-GUID: xB1hrjZmRj2bIZxp5d4ApU8QU-_XE2VB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090178
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_131117_571568_97DB9F76 
X-CRM114-Status: GOOD (  49.46  )
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

On Mon, 2026-03-09 at 15:33 -0400, Jeff Layton wrote:
> On Mon, 2026-03-09 at 15:00 -0400, Mimi Zohar wrote:
> > On Mon, 2026-03-09 at 13:59 -0400, Jeff Layton wrote:
> > > On Mon, 2026-03-09 at 13:47 -0400, Mimi Zohar wrote:
> > > > [ I/O socket time out.  Trimming the To list.]
> > > > 
> > > > On Wed, 2026-03-04 at 10:32 -0500, Jeff Layton wrote:
> > > > > This version squashes all of the format-string changes and the i_ino
> > > > > type change into the same patch. This results in a giant 600+ line patch
> > > > > at the end of the series, but it does remain bisectable.  Because the
> > > > > patchset was reorganized (again) some of the R-b's and A-b's have been
> > > > > dropped.
> > > > > 
> > > > > The entire pile is in the "iino-u64" branch of my tree, if anyone is
> > > > > interested in testing this.
> > > > > 
> > > > >     https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git/
> > > > > 
> > > > > Original cover letter follows:
> > > > > 
> > > > > ----------------------8<-----------------------
> > > > > 
> > > > > Christian said [1] to "just do it" when I proposed this, so here we are!
> > > > > 
> > > > > For historical reasons, the inode->i_ino field is an unsigned long,
> > > > > which means that it's 32 bits on 32 bit architectures. This has caused a
> > > > > number of filesystems to implement hacks to hash a 64-bit identifier
> > > > > into a 32-bit field, and deprives us of a universal identifier field for
> > > > > an inode.
> > > > > 
> > > > > This patchset changes the inode->i_ino field from an unsigned long to a
> > > > > u64. This shouldn't make any material difference on 64-bit hosts, but
> > > > > 32-bit hosts will see struct inode grow by at least 4 bytes. This could
> > > > > have effects on slabcache sizes and field alignment.
> > > > > 
> > > > > The bulk of the changes are to format strings and tracepoints, since the
> > > > > kernel itself doesn't care that much about the i_ino field. The first
> > > > > patch changes some vfs function arguments, so check that one out
> > > > > carefully.
> > > > > 
> > > > > With this change, we may be able to shrink some inode structures. For
> > > > > instance, struct nfs_inode has a fileid field that holds the 64-bit
> > > > > inode number. With this set of changes, that field could be eliminated.
> > > > > I'd rather leave that sort of cleanups for later just to keep this
> > > > > simple.
> > > > > 
> > > > > Much of this set was generated by LLM, but I attributed it to myself
> > > > > since I consider this to be in the "menial tasks" category of LLM usage.
> > > > > 
> > > > > [1]: https://lore.kernel.org/linux-fsdevel/20260219-portrait-winkt-959070cee42f@brauner/
> > > > > 
> > > > > Signed-off-by: Jeff Layton <jlayton@kernel.org>
> > > > 
> > > > Jeff, missing from this patch set is EVM.  In hmac_add_misc() EVM copies the
> > > > i_ino and calculates either an HMAC or file meta-data hash, which is then
> > > > signed. 
> > > > 
> > > > 
> > > 
> > > Thanks Mimi, good catch.
> > > 
> > > It looks like we should just be able to change the ino field to a u64
> > > alongside everything else. Something like this:
> > > 
> > > diff --git a/security/integrity/evm/evm_crypto.c b/security/integrity/evm/evm_crypto.c
> > > index c0ca4eedb0fe..77b6c2fa345e 100644
> > > --- a/security/integrity/evm/evm_crypto.c
> > > +++ b/security/integrity/evm/evm_crypto.c
> > > @@ -144,7 +144,7 @@ static void hmac_add_misc(struct shash_desc *desc, struct inode *inode,
> > >                           char type, char *digest)
> > >  {
> > >         struct h_misc {
> > > -               unsigned long ino;
> > > +               u64 ino;
> > >                 __u32 generation;
> > >                 uid_t uid;
> > >                 gid_t gid;
> > > 
> > 
> > Agreed.
> > 
> > > 
> > > That should make no material difference on 64-bit hosts. What's the
> > > effect on 32-bit? Will they just need to remeasure everything or would
> > > the consequences be more dire? Do we have any clue whether anyone is
> > > using EVM in 32-bit environments?
> > 
> > All good questions. Unfortunately I don't know the answer to most of them. What
> > we do know: changing the size of the i_ino field would affect EVM file metadata
> > verification and would require relabeling the filesystem.  Even packages
> > containing EVM portable signatures, which don't include or verify the i_ino
> > number, would be affected.
> > 
> 
> Ouch. Technically, I guess this is ABI...
> 
> While converting to u64 seems like the ideal thing to do, the other
> option might be to just keep this as an unsigned long for now.
> 
> No effect on 64-bit, but that could keep things working 32-bit when the
> i_ino casts properly to a u32. ext4 would be fine since they don't
> issue inode numbers larger than UINT_MAX. xfs and btrfs are a bit more
> iffy, but worst case they'd just need to be relabeled (which is what
> they'll need to do anyway).
> 
> If we do that, then we should probably add a comment to this function
> explaining why it's an unsigned long.

Agreed.

> 
> Thoughts?

My concern would be embedded/IoT devices, but I don't have any insight into who
might be using it on 32 bit.

Mimi

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
