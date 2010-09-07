Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OspQn-0005n6-Rz
	for linux-mtd@lists.infradead.org; Tue, 07 Sep 2010 04:05:15 +0000
From: "Dong, Chuanxiao" <chuanxiao.dong@intel.com>
To: Arjan van de Ven <arjan@infradead.org>
Date: Tue, 7 Sep 2010 12:03:40 +0800
Subject: RE: [RFC][PATCH 1/1]nand/denali: Add runtime pm support for denali
	controller driver
Message-ID: <5D8008F58939784290FAB48F54975198278A3799CB@shsmsx502.ccr.corp.intel.com>
References: <20100906080838.GA6528@intel.com>
	<20100906125327.036fbcaf@infradead.org>
	<5D8008F58939784290FAB48F54975198278A3798F3@shsmsx502.ccr.corp.intel.com>
	<20100906203453.453b1da2@infradead.org>
In-Reply-To: <20100906203453.453b1da2@infradead.org>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>, "Gao,
	Yunpeng" <yunpeng.gao@intel.com>, "Yuan, Hang" <hang.yuan@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> if you take the refcount every time you get a command, and drop a count
> each time a command completes.... this is all not too important.. it'll
> just work
If I take the refcount every time I got a command and drop a count each tim=
e a command completes, the controller device will be resumed every time whe=
n it gets a command and suspended after it finishes a command. For a 4k pag=
e NAND, processing just 1M data will cause device resume/suspend 256 times.=
...This will influence the performance....Although denali controller cannot=
 be really resumed/suspend, to these devices who can resume/suspend, I thin=
k it is not a good way.
Right now there are 6 patches for denali MTD driver pending. After these 6 =
patches are accepted and Denali MTD driver can be used on MRST platform, I =
will resubmit a runtime pm patch. Arjan, do you agree?
