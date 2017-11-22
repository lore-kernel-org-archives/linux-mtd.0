Received: from mail-wr0-x235.google.com ([2a00:1450:400c:c0c::235])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eHUqU-0006UK-CS
 for linux-mtd@lists.infradead.org; Wed, 22 Nov 2017 13:13:45 +0000
Received: by mail-wr0-x235.google.com with SMTP id o14so14488273wrf.9
 for <linux-mtd@lists.infradead.org>; Wed, 22 Nov 2017 05:13:21 -0800 (PST)
MIME-Version: 1.0
From: Belisko Marek <marek.belisko@gmail.com>
Date: Wed, 22 Nov 2017 14:13:19 +0100
Message-ID: <CAAfyv37B2yRc7gybNi3hNs=ap52bgqTCrsx4tZe_5LNb7LfzVQ@mail.gmail.com>
Subject: macronix ONFI nand flash OTP support
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'm trying to add find out how to use OTP area in Macronix MX30LF4G18AC flash.
AFAIU it is ONFI based flash and I did some quick hack and I can
set/reset flash to go to OTP mode via get/set_features function
available in nand_base.c. But for read page I need to send according
datasheet:
To use the PAGE READ command for reading data from the OTP area, issue
the 00h command, and then issue five address cycles: for the first two
cycles, the column address; and for the remaining address cycles,
select a page in the range of 02h-00h-00h through 1Fh-00h-00h. Lastly,
issue the 30h command. The PAGE READ CACHE MODE command is not
supported on OTP pages.

I did check nand_do_read_ops function but it's not sending e.g. 0x30
which should be at the end of command. I'm using 4.1 kernel but
checked also 4.14 and no such functionality is added even there.
Nobody is using OTP area in nand flashes ;) ? Thanks for any pointers.

BR,

marek

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com
