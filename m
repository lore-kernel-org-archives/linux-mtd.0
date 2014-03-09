Received: from mail-pa0-x230.google.com ([2607:f8b0:400e:c03::230])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WMTjO-0002iI-Se
 for linux-mtd@lists.infradead.org; Sun, 09 Mar 2014 02:44:51 +0000
Received: by mail-pa0-f48.google.com with SMTP id hz1so5804723pad.7
 for <linux-mtd@lists.infradead.org>; Sat, 08 Mar 2014 18:44:24 -0800 (PST)
Received: from [10.79.125.246] ([117.136.31.150])
 by mx.google.com with ESMTPSA id om6sm52240644pbc.43.2014.03.08.18.44.20
 for <linux-mtd@lists.infradead.org>
 (version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
 Sat, 08 Mar 2014 18:44:21 -0800 (PST)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Subject: MTD/JFFS2 OOB can't support no subpage
From: Brian <tsungenlu@gmail.com>
Message-Id: <DF8F24C9-F22D-452A-8A1B-D9EF14BFF8D0@gmail.com>
Date: Sun, 9 Mar 2014 10:51:48 +0800
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Mime-Version: 1.0 (1.0)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

We're using the new Samsung SLC NAND flash, it's only support one NOP, when I=
 disabled the OOB cleanmarker, the mtd_write should go to unknown marker nod=
e with write aligned error.

So, it look likes the JFFS2 can't support no subpage, right?

Does any solution can be fix it?

BR,
Brian



Sent from my iPhone=
