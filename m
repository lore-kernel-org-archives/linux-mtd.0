Received: from mail-pw0-f43.google.com ([209.85.160.43])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NSX5P-0002Ro-CL
	for linux-mtd@lists.infradead.org; Wed, 06 Jan 2010 14:42:16 +0000
Received: by pwj11 with SMTP id 11so12183760pwj.2
	for <linux-mtd@lists.infradead.org>;
	Wed, 06 Jan 2010 06:42:09 -0800 (PST)
MIME-Version: 1.0
Date: Wed, 6 Jan 2010 08:42:09 -0600
Message-ID: <782515bb1001060642v78e1c482we6612d8cb8ac041c@mail.gmail.com>
Subject: Question on partition wise ECC support
From: Nishanth Menon <menon.nishanth@gmail.com>
To: Linux MTD <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Vimal Singh <vimal.newwork@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
Just a generic question: for NAND devices, each ECC strategy such as
256byte/512byte ecc has tradeoff b/w reliability Vs performance. I
wonder if we have some mechanism if we can maintain different ECC
strategy per partition. This could allow custom map used for certain
partitions due to dependencies on other entities, as well as allow
other partitions such as those used to store video files etc on higher
reliability ecc handling mechanism..

I wonder if this is a good thing to have and if so what might be
possible to do for this.
Regards,
Nishanth Menon
