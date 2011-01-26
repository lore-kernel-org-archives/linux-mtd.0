Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pi3FV-000077-KD
	for linux-mtd@lists.infradead.org; Wed, 26 Jan 2011 11:09:18 +0000
Received: by wwb17 with SMTP id 17so832093wwb.18
	for <linux-mtd@lists.infradead.org>;
	Wed, 26 Jan 2011 03:09:15 -0800 (PST)
MIME-Version: 1.0
Date: Wed, 26 Jan 2011 20:09:14 +0900
Message-ID: <AANLkTimVCusWk1qkeY4geXBQ0Bw=rM0mUAaFO32tyoy=@mail.gmail.com>
Subject: Question about CFI allocation
From: Mitsutaka Amano <mitsutaka.amano@gmail.com>
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

Hi all, I'm a newbie about mtd.

I'm trying to use the cfi on the mpc85xx board. Part of mtdblock is
used by rootfs. So I have questions.

Why does CFI(or other flash memory) have to alloc to the vmalloc
area(such as PHYSMAP or PHYSMAP_OF)?
Is there way to alloc mtd partitions except vmalloc mapping?

Thanks,
Mitsutaka
