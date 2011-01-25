Received: from 27.mail-out.ovh.net ([91.121.30.210])
	by canuck.infradead.org with smtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PhfOk-0007Aq-HH
	for linux-mtd@lists.infradead.org; Tue, 25 Jan 2011 09:41:15 +0000
Message-ID: <4D3E9AA1.4020308@bvs-tech.com>
Date: Tue, 25 Jan 2011 10:40:49 +0100
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
Content-Type: multipart/mixed; boundary="------------050000090903090609070807"
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
--------------050000090903090609070807
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

Le 24/01/2011 18:52, Grant Likely a écrit :
> On Mon, Jan 24, 2011 at 8:49 AM, Alexis RODET <alexis.rodet@bvs-tech.com> wrote:
>> Hi again,
>>
>> In facts I don't know which git URL to clone for getting linux-next as patch base, can you tell me ?
>> I'm working on last stable release from git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-2.6-stable.git.
> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>
> Be warned, it is rebased every night.
>
It seems to have been frozen for 4 days and to have become late behind git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git

Alexis

--------------050000090903090609070807
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
--------------050000090903090609070807--
