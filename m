Received: from mail-gx0-f177.google.com ([209.85.161.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RGaIk-0000r8-TL
	for linux-mtd@lists.infradead.org; Wed, 19 Oct 2011 17:51:39 +0000
Received: by ggnk3 with SMTP id k3so2212563ggn.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 19 Oct 2011 10:51:37 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 19 Oct 2011 18:51:36 +0100
Message-ID: <CAG7TAXxkM6HjGwf6Kdr0Vvo7QqzMYJAa9ZjNipLV2A3n=RpQWQ@mail.gmail.com>
Subject: Extra MTD device information
From: Ricky Taylor <rickytaylor26@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I am a member of a very small team working on reverse engineering a few Apple
products and writing device drivers for Linux.

One of the unfortunate discoveries we've made concerning the NAND controller
and DMA controller in the iPhone 4 is that they can (and are used to) encrypt
data to and from the actual NAND chips, on top of this, during their FTL
algorithms, they change the keys used for the encryption.

To top this all off, their FTL is dependant on more pieces of device
information than mtd_info provides. (Such as the size of the banks on each
NAND chip.)

I was wondering if anyone on this list had any advice regarding how to store
and retrieve the extra information from the MTD layer and how to deal with
changing the keys used to encrypt and decrypt the NAND data.

I would like to avoid exposing the NAND as anything other than an MTD
device with
a few partitions, as the filesystem part could be used as a completely
ordinary MTD
partition with no issues.

Thanks,
Ricky Taylor
