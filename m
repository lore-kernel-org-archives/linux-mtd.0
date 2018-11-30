Received: from mx0b-0028f201.pphosted.com ([148.163.153.29])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gSldO-0004f9-Bc
 for linux-mtd@lists.infradead.org; Fri, 30 Nov 2018 16:27:19 +0000
From: "Wojtaszczyk, Piotr" <WojtaszczykP@cumminsallison.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
CC: "tglx@linutronix.de" <tglx@linutronix.de>
Subject: [PATCH RFC] mtd: rawnand: Cure MICRON NAND partial erase
Date: Fri, 30 Nov 2018 16:26:58 +0000
Message-ID: <97341e577e734deeb3cdcfd4583c7ffe@Astraea.Cumminslocal.com>
References: <mailman.5261.1543570682.2376.linux-mtd@lists.infradead.org>
In-Reply-To: <mailman.5261.1543570682.2376.linux-mtd@lists.infradead.org>
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
