Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CB25C88CB2
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Aug 2023 01:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YyqAJrnLxVq7/nhizlQ3ZnHyg228h6FAeucEoxUzdgo=; b=AhRi/ZBq+C/hSn
	bKeE3jw8Dasp0ppPqhOFfG7vrodjkqxttJEjfzM5Iuanvwr5Gt/gzEVynero0dTg+9Zwv7rMTjOus
	DkXGXRFhCR9vBegB4hPX/I8Jo+XQ1IYQv5wnJQC3L6uoYVwSByEFFtJVtyiKiv/O3Fyhzb84rJUat
	QYmmXfHhUvc5BlAE0PbWHL3mkccyhpZiDjjt6twdmysj3wVCBGsdbZEJP+g2VB9s6GHeED2n8YId0
	eaEb4vbdiWybsbWzEW2LccHXB66cqh6Cgi3bnMpB7mbTlh+7A3T9T5tnR8U93mdyRQCfwsMTwXs5g
	6llM3SDeI5FaVShBQcsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZLOP-0043XM-2W;
	Fri, 25 Aug 2023 01:13:41 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZLOM-0043WM-2v;
	Fri, 25 Aug 2023 01:13:40 +0000
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37OJEN3l010276;
	Fri, 25 Aug 2023 01:13:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2023-03-30;
 bh=uhEjckime6bsF1xq0dmnY+LwEHiDmuGwjHJQ7hVpFpk=;
 b=xT4JwIyBXmmvopnLoTqXTVQDIyq4jGSov+rjFGn7JrEsFJ0nGwiZ57rChZOcNtxS8gnd
 32i9D/0gBNdAu6wmrSv4Tj5XGTtiOMTcrD7d8d7sIx9zu+UBUHmYA/WieiP0xKAeu3gF
 eHe1MsKPNrAZDzygQo0FmmEXELlSaZ2xMctwoLvlgndq1xchpQqBIi92sT4g6z/NC03I
 Sq45+sJdryY0Xt3UtsdNEeUPJQQwXRC0pKx/6zSsrk8N0z228cv46+9188htxHxgrJuH
 O19AK6RPcqphkoDDRpvAZZx3qvPOulLbxkXwvTBtVM7s38ELpJEo9mWBxT45N4g00a45 fg== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3sn1yv5ft9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Aug 2023 01:13:38 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 37P03oRV035625;
	Fri, 25 Aug 2023 01:13:37 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3sn1ywqfhw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Aug 2023 01:13:37 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 37P1DVDv019787;
	Fri, 25 Aug 2023 01:13:36 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 3sn1ywqf8n-3;
	Fri, 25 Aug 2023 01:13:36 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
        Arnd Bergmann <arnd@kernel.org>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
        Arnd Bergmann <arnd@arndb.de>, Matt Turner <mattst88@gmail.com>,
        Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
        Brian Cain <bcain@quicinc.com>, Huacai Chen <chenhuacai@kernel.org>,
        WANG Xuerui <kernel@xen0n.name>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michal Simek <monstr@monstr.eu>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>,
        Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
        Stafford Horne <shorne@gmail.com>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        x86@kernel.org, Borislav Petkov <bp@alien8.de>,
        Max Filippov <jcmvbkbc@gmail.com>, Jens Axboe <axboe@kernel.dk>,
        Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
        Richard Weinberger <richard@nod.at>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org,
        linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
        loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-block@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-mtd@lists.infradead.org, linux-trace-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: (subset) [PATCH 00/17] -Wmissing-prototype warning fixes
Date: Thu, 24 Aug 2023 21:12:49 -0400
Message-Id: <169292577153.789945.11297239773543112051.b4-ty@oracle.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230810141947.1236730-1-arnd@kernel.org>
References: <20230810141947.1236730-1-arnd@kernel.org>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-25_01,2023-08-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0
 malwarescore=0 spamscore=0 phishscore=0 mlxlogscore=763 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308250009
X-Proofpoint-GUID: X2SaJXDprf48MqrqrcFkis4RNSuOroKu
X-Proofpoint-ORIG-GUID: X2SaJXDprf48MqrqrcFkis4RNSuOroKu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_181339_061972_CD4F9530 
X-CRM114-Status: GOOD (  19.12  )
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

On Thu, 10 Aug 2023 16:19:18 +0200, Arnd Bergmann wrote:

> Most of the patches I sent so far for the -Wmissing-prototype warnings
> have made it into linux-next now. There are a few that I'm resending
> now as nobody has picked them up, and then a number of fixes that I
> found while test-building across all architectures rather than just the
> ones I usually test.
> 
> The first 15 patches in this series should be uncontroversial, so
> I expect that either a subsystem maintainer or Andrew Morton can
> apply these directly.
> 
> [...]

Applied to 6.6/scsi-queue, thanks!

[07/17] scsi: qlogicpti: mark qlogicpti_info() static
        https://git.kernel.org/mkp/scsi/c/71cc486335c4
[11/17] scsi: gvp11: remove unused gvp11_setup() function
        https://git.kernel.org/mkp/scsi/c/bfaa4a0ce1bb

-- 
Martin K. Petersen	Oracle Linux Engineering

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
