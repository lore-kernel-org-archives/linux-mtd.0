Received: from mx0a-00103a01.pphosted.com ([67.231.144.234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WYIXk-0006c6-FK
 for linux-mtd@lists.infradead.org; Thu, 10 Apr 2014 17:13:40 +0000
Received: from pps.filterd (m0000419.ppops.net [127.0.0.1])
 by mx0a-00103a01.pphosted.com (8.14.5/8.14.5) with SMTP id s3AHAcUC029159
 for <linux-mtd@lists.infradead.org>; Thu, 10 Apr 2014 13:13:17 -0400
Received: from mdwexght02.ciena.com (LIN1-118-36-29.ciena.com [63.118.36.29])
 by mx0a-00103a01.pphosted.com with ESMTP id 1k5v4prvsb-17
 (version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=NOT)
 for <linux-mtd@lists.infradead.org>; Thu, 10 Apr 2014 13:13:17 -0400
From: "Moffatt, Greg" <gmoffatt@ciena.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Thu, 10 Apr 2014 13:12:54 -0400
Subject: UBIFS: kernel bug scheduling while atomic on full volume
Message-ID: <D35CC66D869D1840B7A4E35C6477E0EA0201099034@ONWVEXCHMB03.ciena.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm seeing occasional instances of "scheduling while atomic" when doing wri=
tes to a nearly-full volume.=A0 This is on a 3.4.34 kernel.

I found an old reference to a similar problem back in 2008 but haven't seen=
 anything more on it.

It seems to happen when the volume is nearly full, and we're doing a large =
write (for example, dumping a core file).

Greg Moffatt.
gmoffatt@ciena.com
