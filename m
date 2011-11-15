Received: from mail-gx0-f177.google.com ([209.85.161.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RQDT9-0007Va-0X
 for linux-mtd@lists.infradead.org; Tue, 15 Nov 2011 07:30:11 +0000
Received: by ggno1 with SMTP id o1so7634530ggn.36
 for <linux-mtd@lists.infradead.org>; Mon, 14 Nov 2011 23:30:07 -0800 (PST)
MIME-Version: 1.0
Date: Tue, 15 Nov 2011 15:30:07 +0800
Message-ID: <CAKwPUox5fkNn-goKN=aAsJMa4KKLgr28MGWXNjG107SsDzeL-Q@mail.gmail.com>
Subject: non-pci version driver for denali NAND flash controller
From: Kassey Lee <kassey1216@gmail.com>
To: david.woodhouse@intel.com, jamie@jamieiles.com, chuanxiao.dong@intel.com
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, yingang.li@intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi, David, Jamie:

     I found there is a PCI-VERSION denali NAND flash controller
drivers/mtd/nand/denali.c.
     is there any activities to add the support for NON-PCI version on ARM =
SoC ?
     If no, I would like to add the NON-PCI version driver for Denali
to have a try , which way is preferred and accepted by you?

    1) add  CONFIG_PCI  in denali.c
    2) add a denali_pci.c to separate the common code.

   thanks !

--=20
Best regards
Kassey

Intel Mobile Communication =A0Xi'an, China PRC
