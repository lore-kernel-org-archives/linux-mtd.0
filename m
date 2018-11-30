Received: from mx0b-0028f201.pphosted.com ([148.163.153.29])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gSlqz-0001Wr-D2
 for linux-mtd@lists.infradead.org; Fri, 30 Nov 2018 16:41:22 +0000
Received: from pps.filterd (m0113282.ppops.net [127.0.0.1])
 by mx0b-0028f201.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 wAUGa3lJ015535
 for <linux-mtd@lists.infradead.org>; Fri, 30 Nov 2018 10:41:09 -0600
Received: from attis.cumminslocal.com (mx1.cumminsallison.com [208.73.132.233])
 by mx0b-0028f201.pphosted.com with ESMTP id 2p0vfa1yvp-1
 for <linux-mtd@lists.infradead.org>; Fri, 30 Nov 2018 10:41:09 -0600
From: "Wojtaszczyk, Piotr" <WojtaszczykP@cumminsallison.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [PATCH RFC] mtd: rawnand: Cure MICRON NAND partial erase issue
Date: Fri, 30 Nov 2018 16:40:50 +0000
Message-ID: <2bcb680a37bc475eba99c2f130d86ae3@Astraea.Cumminslocal.com>
References: <mailman.5261.1543570682.2376.linux-mtd@lists.infradead.org> 
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
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

On which micron part are you seeing the problem. I'm using MT29F4G16A and s=
ee similar issue. Data sheet says that erase takes from 0.7ms up to 3ms don=
't know if Micron tunes the delay per part or per block. Maybe on some bloc=
ks it's not enough.
