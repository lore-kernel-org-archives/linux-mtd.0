Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3073DC88CB2
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Aug 2023 23:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W2BDyRGXZQbqHDpY1iEfUaChmAAlcJkfJT6E3JC4H0A=; b=YrGP0TJnASzIiW
	0ju1vs/Vt3Oi8Y6zd9oCTETJEsF7htuQgA7RJv0LKh0Q0PA1zv746ltGFtjNcq3ArxkeWxyc8/te4
	Kz16qaSd2X2tVth8sd00TNzAdLngw2vFOyfc8qnPwvGYTki8BsorD4bihxdGTtMHYF/byfqLO8Cl2
	CjPP0oIYlTnPDhpaSlwauC/Fwg6J6sTTQjPeYszueLXsdMC8dsTKX2hC/srJ1l6RzNps+k0/tLxMY
	48hszC0ej2zfLbFSI7+fwTS1z1G4QkU5KAhSEg9yip2AvC123j/J5pLHrBT159O0Ol9BrGs8UeUze
	tc1tJ9GInAUaOzCTE1jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZKCx-0040Ii-20;
	Thu, 24 Aug 2023 23:57:47 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZKCt-0040GA-2x
	for linux-mtd@lists.infradead.org;
	Thu, 24 Aug 2023 23:57:45 +0000
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37ONtR7Y010594;
	Thu, 24 Aug 2023 23:57:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : date : in-reply-to : references : content-type : mime-version
 : content-transfer-encoding; s=pp1;
 bh=YnlPHR/hwH5qnykFXHXCdGujskzarfLxFMtXePb+Bp8=;
 b=Mgy77CoYgffelRskx96UqY+AI6UBmjwiA1BtrxmJvh8wJZbL3IqEybxEtmIWU4FLt6vG
 29u+vjpCF/xP6MeW1/0w7+ZmwV0ws858zh2Z+7k+HgTNOlqSgWy0Q59+iUDExZ4VdqqU
 MV8yDb9G8aM5mCr/RuiOi/O0qDRQzd5mjWz1e2yTzUP+wdkbgIqvR5uKT12c3DpXT7Hr
 ATuOC1qDCzH64PeKnBW0gpsPVwXNY4+pmPEXhY/eXeQfIOwWZ+/3ANTTqolfC37ZqJ87
 UaCvctpDmajTUi0ePgWWeRX9FM8pya8YFuLkNZyebl7tyLjkk4iS1WgKXRdaMU7JD3PR RQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sph6r0516-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Aug 2023 23:57:33 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 37ONpHmf029212;
	Thu, 24 Aug 2023 23:57:32 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sph6r050w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Aug 2023 23:57:32 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37OLMvBU018270;
	Thu, 24 Aug 2023 23:57:32 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3sn21sub5b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Aug 2023 23:57:32 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 37ONvVTt7602738
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Aug 2023 23:57:31 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 88D935805A;
	Thu, 24 Aug 2023 23:57:31 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 28F3158051;
	Thu, 24 Aug 2023 23:57:30 +0000 (GMT)
Received: from li-f45666cc-3089-11b2-a85c-c57d1a57929f.ibm.com (unknown [9.61.163.153])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 24 Aug 2023 23:57:30 +0000 (GMT)
Message-ID: <1905e842f2f74705aa2f7d407c58171c72686cdf.camel@linux.ibm.com>
Subject: Re: [PATCH 10/12] KEYS: encrypted: Do not include crypto/algapi.h
From: Mimi Zohar <zohar@linux.ibm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        Linux Crypto Mailing List
 <linux-crypto@vger.kernel.org>,
        Eric Biggers <ebiggers@kernel.org>, "Theodore Y. Ts'o" <tytso@mit.edu>,
        Jaegeuk Kim <jaegeuk@kernel.org>, linux-fscrypt@vger.kernel.org,
        Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan
 Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz
 <luiz.dentz@gmail.com>,
        linux-bluetooth@vger.kernel.org, Ilya Dryomov
 <idryomov@gmail.com>,
        Xiubo Li <xiubli@redhat.com>, Jeff Layton
 <jlayton@kernel.org>,
        ceph-devel@vger.kernel.org,
        Steffen Klassert
 <steffen.klassert@secunet.com>,
        "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
        Johannes Berg <johannes@sipsolutions.net>,
        linux-wireless@vger.kernel.org,
        Matthieu Baerts
 <matthieu.baerts@tessares.net>,
        Mat Martineau <martineau@kernel.org>,
        Chuck Lever <chuck.lever@oracle.com>, Neil Brown <neilb@suse.de>,
        linux-nfs@vger.kernel.org, linux-integrity@vger.kernel.org,
        "Jason A.
 Donenfeld" <Jason@zx2c4.com>,
        Ayush Sawal <ayush.sawal@chelsio.com>
Date: Thu, 24 Aug 2023 19:57:29 -0400
In-Reply-To: <E1qYlA9-006vIz-Am@formenos.hmeau.com>
References: <ZOXf3JTIqhRLbn5j@gondor.apana.org.au>
	 <E1qYlA9-006vIz-Am@formenos.hmeau.com>
X-Mailer: Evolution 3.28.5 (3.28.5-22.el8) 
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: fAHUKh1opEl8_Dv_I_X3dM8kVdC0roQH
X-Proofpoint-GUID: Pbj_ah2ai_Uy70mnZVchutrhpFA2Kgd9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-24_18,2023-08-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 clxscore=1015 spamscore=0
 mlxscore=0 mlxlogscore=999 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2308240205
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_165744_310479_3451E869 
X-CRM114-Status: GOOD (  18.69  )
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

On Wed, 2023-08-23 at 18:32 +0800, Herbert Xu wrote:
> The header file crypto/algapi.h is for internal use only.  Use the
> header file crypto/utils.h instead.
> 
> Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

Acked-by: Mimi Zohar <zohar@linux.ibm.com>

> ---
> 
>  security/keys/encrypted-keys/encrypted.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/security/keys/encrypted-keys/encrypted.c b/security/keys/encrypted-keys/encrypted.c
> index 1e313982af02..8af2136069d2 100644
> --- a/security/keys/encrypted-keys/encrypted.c
> +++ b/security/keys/encrypted-keys/encrypted.c
> @@ -27,10 +27,10 @@
>  #include <linux/scatterlist.h>
>  #include <linux/ctype.h>
>  #include <crypto/aes.h>
> -#include <crypto/algapi.h>
>  #include <crypto/hash.h>
>  #include <crypto/sha2.h>
>  #include <crypto/skcipher.h>
> +#include <crypto/utils.h>
>  
>  #include "encrypted.h"
>  #include "ecryptfs_format.h"



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
