Received: from [62.169.5.10] (helo=discovery.taytron.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 156uq9-00039E-00
	for <linux-mtd@lists.infradead.org>; Mon, 04 Jun 2001 14:56:17 +0100
From: "Florian Schirmer / TayTron" <schirmer@taytron.net>
To: "David Woodhouse" <dwmw2@infradead.org>,
	"Abraham vd Merwe" <abraham@2d3d.co.za>
Cc: "MTD for Linux" <linux-mtd@lists.infradead.org>
Subject: AW: mtd->erasesize 
Date: Mon, 4 Jun 2001 16:00:46 +0200
Message-ID: <BKEKLBIBFPNGJKJDEODFAEGBEJAA.schirmer@taytron.net>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <18826.991656241@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi!

>> For now, I'm just skipping the first 8 4k blocks so you can't access
>> that with the MTD driver, but I believe this is a design flaw with the
>> MTD drivers. It should be able to handle multiple erasesize's for each
>> device.

>The driver for AMD chips (cfi_cmdset_0002.c) already supports this.
>Nobody's yet put similar support into the Intel driver. Feel free to do so
>:)

The intel driver already has support for different erase regions. (Afaik!)
Someone commited it some time ago.


So far,
  Florian Schirmer


---------------------------+--------------------------------------------
TayTron Internet Solutions | Bei Fragen wenden Sie sich bitte an:
                           |
Webhosting     ab  29,- DM | http://www.velomedia.de - info@velomedia.de
Serverhousing  ab 199,- DM | Tel. 0800 / 80 70 900 - Fax 030 / 43671-040
