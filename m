Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14nmcf-00026k-00
	for mtd-list@infradead.org; Thu, 12 Apr 2001 20:19:17 +0100
Received: from [212.87.56.100] (helo=mail.taytron.net)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14nmcc-00026e-00
	for mtd@infradead.org; Thu, 12 Apr 2001 20:19:16 +0100
From: "Florian Schirmer / TayTron" <schirmer@taytron.net>
To: "Williams, Kevin M." <kevin.m.williams@marconi.com>,
	<mtd@infradead.org>
Subject: AW: jffs steps from boot prompt to mount?
Date: Thu, 12 Apr 2001 21:19:22 +0200
Message-ID: <BKEKLBIBFPNGJKJDEODFEEKFEIAA.schirmer@taytron.net>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <A3E34B558F5CD211B4980008C7A4A99003163E52@sparrow.eng.gilbarco.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi!

>I need my application to be able to mount the mtd device and write/read
>files.  I have selected jffs support under file systems in xconfig. Can
>someone spell out the steps from bootup until mount?  I tried following the
>HOWTO but got stuck here with erase not working and wondering how
>mtdblock0/1/2 get created.

Check wether mtd0/1/... exits under you /dev directory. Probably they are
missing. You want to consider this two kernel options:

# CONFIG_MTD_CHAR is not set
# CONFIG_MTD_BLOCK is not set

The first creates mtd0/1/... and the second one mtdblock0/1/... which should
fix both of your problems. After you compiled in both options you should
erase all your partitions with eraseall. The erase command should work to,
but i did not test that. Then you can simply create an filesystem on your
device. If you want to use jffs simply do:

mount -t jffs /dev/mtdblock0 /mount

This creates a jffs filesystem on your partition. After the filesystem has
been created you can ommit "-t jffs" since mount now autodetects the
filesystem.

Hope that helps
  Florian Schirmer


---------------------------+--------------------------------------------
TayTron Internet Solutions | Bei Fragen wenden Sie sich bitte an:
                           |
Webhosting     ab  29,- DM | http://www.velomedia.de - info@velomedia.de
Serverhousing  ab 199,- DM | Tel. 0800 / 80 70 900 - Fax 030 / 43671-040



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
