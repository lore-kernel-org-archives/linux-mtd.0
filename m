Received: from mail-wi0-x231.google.com ([2a00:1450:400c:c05::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xc0t1-0002eY-5K
 for linux-mtd@lists.infradead.org; Wed, 08 Oct 2014 23:43:15 +0000
Received: by mail-wi0-f177.google.com with SMTP id fb4so381697wid.4
 for <linux-mtd@lists.infradead.org>; Wed, 08 Oct 2014 16:42:52 -0700 (PDT)
Date: Thu, 9 Oct 2014 01:42:48 +0200
From: Aya Mahfouz <mahfouz.saif.elyazal@gmail.com>
To: kamlakant.patel@broadcom.com
Subject: [3.17.0-rc6] staging: drivers: staging: mt29f_spinand:
 mt29f_spinand.c: compatible string
Message-ID: <20141008234248.GA15086@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: gregkh@linuxfoundation.org, linux-mtd@lists.infradead.org,
 manonuevo@micron.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Everyone,

My name is Aya Mahfouz. I'm new to the Linux Kernel development
process and I'm working on fixing some warnings as part of my
application process to the Gnome OPW program. 

When using checkpatch.pl, I get the following warning:
WARNING: DT compatible string "spinand,mt29f" appears un-documented
-- check ./Documentation/devicetree/bindings/
#926:FILE: drivers/staging/mt29f_spinand/mt29f_spinand.c:926:
+       { .compatible = "spinand,mt29f", },

If I place the string "spinand,mt29f" in 
./Documentation/devicetree/bindings/vendor-prefixes.txt 
with any name the warning will be silenced. Are there
any means to knowing the vendor? A quick google search
states that it is "Micron Technology Inc" and that 
"spinand" is a shorthand for a device by Micron.

Thank you all,

Kind Regards,
Aya Saif El-yazal Mahfouz
