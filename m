Received: from na3sys009aog119.obsmtp.com ([74.125.149.246])
	by canuck.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
	id 1R3Ymu-00073v-QG
	for linux-mtd@lists.infradead.org; Tue, 13 Sep 2011 19:36:57 +0000
Received: by gxk22 with SMTP id 22so1125373gxk.30
	for <linux-mtd@lists.infradead.org>;
	Tue, 13 Sep 2011 12:36:50 -0700 (PDT)
From: Kevin Paul Herbert <kevin.herbert@meraki.net>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Subject: Request for comments: UBI PEBs as a multiple of erase size
Date: Tue, 13 Sep 2011 12:36:47 -0700
Message-Id: <40BCDFDF-F9C8-46C5-99F8-E56050E8B32C@meraki.net>
To: linux-mtd@lists.infradead.org
Mime-Version: 1.0 (Apple Message framework v1244.3)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I came across a situation where I wanted to be able to use the same =
pre-built (with UBI) image on two different FLASH devices, one of which =
having a larger erase size than the other. I actually did not notice =
that the device I was using had a different erase size, which caused UBI =
to quietly corrupt my FLASH.

I have a patch to UBI (kernel and ubinize) to store the size of a PEB in =
the EC header, reject attaching if the PEB size is not equal to or an =
integer multiple of the erase size, and treat multiple erase blocks as a =
"cluster" for I/O operations.

I looked through a few months of archives to see if this is a common =
problem, and I don't see this as being discussed. Is there interest in =
me publishing this patch for inclusion in the kernel. The only downside =
I can see of my change is that it adds an additional 32 bit quantity to =
struct ubi_ec_hdr, reducing the available free header byets from 35 to =
31. For backwards compatibility, if this field is zero, I treat it as =
PEB size =3D=3D erase size.

It seems to me that having the PEB size in the header, regardless of =
supporting multiple erase blocks as a single PEB, is a useful =
consistency check.

Comments please?

Thanks,
Kevin Paul Herbert
Meraki, Inc.
