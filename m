Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fxT4c-0004qB-0J
 for linux-mtd@lists.infradead.org; Wed, 05 Sep 2018 08:22:04 +0000
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 13BDA89157
 for <linux-mtd@lists.infradead.org>; Wed,  5 Sep 2018 20:21:11 +1200 (NZST)
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: mtd-utils: 'libmtd: error!: ECCGETLAYOUT ioctl request failed' seen
 after updating to mtd-utils 2.0.2
Date: Wed, 5 Sep 2018 08:21:05 +0000
Message-ID: <26a5bf8787e942fbb8375ea0c6899fbf@svr-chch-ex1.atlnz.lc>
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

Hi,=0A=
=0A=
We're running an embedded system with a 4.4 based kernel. As part of our =
=0A=
startup we use mtdinfo to find out about the mtd devices on the device.=0A=
=0A=
I recently updated our mtd-utils version to 2.0.2 and our mtdinfo usage =0A=
started printing an error message.=0A=
=0A=
   # mtdinfo /dev/mtd0=0A=
   libmtd: error!: ECCGETLAYOUT ioctl request failed=0A=
           error 95 (Operation not supported)=0A=
   libmtd: error!: ECCGETLAYOUT ioctl request failed=0A=
           error 95 (Operation not supported)=0A=
   mtd0=0A=
   Name:                           nvs=0A=
   Type:                           ram=0A=
   Eraseblock size:                4096 bytes, 4.0 KiB=0A=
   Amount of eraseblocks:          128 (524288 bytes, 512.0 KiB)=0A=
   Minimum input/output unit size: 1 byte=0A=
   Sub-page size:                  1 byte=0A=
   Character device major/minor:   90:0=0A=
   Bad blocks are allowed:         false=0A=
   Device is writable:             true=0A=
=0A=
The error isn't too surprising since a plat-ram device isn't going to =0A=
support ECC.=0A=
=0A=
This error appears to have been introduced by commit a1035358 ("libmtd: =0A=
Add support to access OOB available size"). Is there any way to avoid =0A=
this for devices that we don't expect ECC on.=0A=
=0A=
Thanks,=0A=
Chris=0A=
=0A=
