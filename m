Received: from 27.mail-out.ovh.net ([91.121.30.210])
	by canuck.infradead.org with smtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Phf7a-00074i-Ni
	for linux-mtd@lists.infradead.org; Tue, 25 Jan 2011 09:23:31 +0000
Message-ID: <4D3E9683.5090906@bvs-tech.com>
Date: Tue, 25 Jan 2011 10:23:15 +0100
From: Alexis RODET <alexis.rodet@bvs-tech.com>
MIME-Version: 1.0
To: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 0/1] Renaming 'struct flash_platform_data' into 'struct
	spi_flash_platform_data' in include/linux/spi/flash.h
References: <327178.68946.qm@web180303.mail.gq1.yahoo.com>
	<4CEB89C6.3080603@bvs-tech.com>
	<20101123093643.GC6156@jasper.tkos.co.il>
	<4CEB8C39.1060801@bvs-tech.com>
	<20101123094414.GD6156@jasper.tkos.co.il>
	<4CEB8F7C.6070102@bvs-tech.com>
	<20110121192819.GA32112@angua.secretlab.ca>
	<4D3D6472.8030505@bvs-tech.com> <4D3D9FA6.3050900@bvs-tech.com>
	<AANLkTikDHbKt5q+o2LK89hHZ3EUeeYzmQVJj8jXgQ+pB@mail.gmail.com>
In-Reply-To: <AANLkTikDHbKt5q+o2LK89hHZ3EUeeYzmQVJj8jXgQ+pB@mail.gmail.com>
Content-Type: multipart/mixed; boundary="------------000404060002010001040609"
Cc: David Brownell <david-b@pacbell.net>,
	spi-devel-general@lists.sourceforge.net,
	Baruch Siach <baruch@tkos.co.il>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------000404060002010001040609
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 24/01/2011 18:52, Grant Likely a écrit :
>
> The spi flash_platform_data structure is almost a complete subset of
> the arm one.  Rather than renaming everything, why not simply
> consolidate the structure definition?  Consolidating will have much
> lower impact.
Then I should create a common flash.h file, let's tell include/linux/mtd/flash.h, and make both existing flash.h file point to it.
This is actually an easy work.
I'll do this.

BR,
Alexis

--------------000404060002010001040609
Content-Type: text/x-vcard; charset=utf-8;
 name="alexis_rodet.vcf"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="alexis_rodet.vcf"

YmVnaW46dmNhcmQNCmZuOkFsZXhpcyBST0RFVA0KbjpST0RFVDtBbGV4aXMNCm9yZzpCcmFp
biBWaXNpb24gU3lzdGVtcw0KYWRyOjs7MzIgcnVlIGR1IEphdmVsb3Q7UEFSSVM7Ozc1MDEz
O0ZSQU5DRQ0KZW1haWw7aW50ZXJuZXQ6YWxleGlzLnJvZGV0QGJ2cy10ZWNoLmNvbQ0KdGl0
bGU6SGFyZHdhcmUgRW5naW5lZXINCnRlbDt3b3JrOiszMyA5IDUzIDkyIDE0IDQxDQp0ZWw7
ZmF4OiszMyA5IDU4IDkyIDE0IDQxDQp4LW1vemlsbGEtaHRtbDpGQUxTRQ0KdXJsOmh0dHA6
Ly93d3cuYnZzLXRlY2guY29tDQp2ZXJzaW9uOjIuMQ0KZW5kOnZjYXJkDQoNCg==
--------------000404060002010001040609--
