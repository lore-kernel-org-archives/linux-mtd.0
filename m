Received: from sccrmhc02.attbi.com ([204.127.202.62])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18UQQm-00040V-00
	for <linux-mtd@lists.infradead.org>; Fri, 03 Jan 2003 11:56:04 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Mark Meade <mark@lakeshoremicro.com>
To: Sanal Kumar <p_sanalk@yahoo.com>
Subject: Re: Problem with DiskOnChipMillenium
Date: Fri, 3 Jan 2003 07:25:27 -0500
References: <20030103094024.54024.qmail@web10308.mail.yahoo.com>
In-Reply-To: <20030103094024.54024.qmail@web10308.mail.yahoo.com>
Cc: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <E18UQQm-00040V-00@pentafluge.infradead.org>
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

Try using the following options:

# Memory Technology Devices (MTD)
CONFIG_MTD=y
CONFIG_MTD_DEBUG=y
CONFIG_MTD_CHAR=y
CONFIG_NFTL=y
CONFIG_NFTL_RW=y

# Disk-On-Chip Device Drivers
CONFIG_MTD_DOC2000=y
CONFIG_MTD_DOCPROBE=y

(turn off CONFIG_MTD_DOC2001, and CONFIG_MTD_DOCPROBE ADDRESS).

Sanal Kumar wrote:
> I am working on an Assabet like board(SA1110).
> but when I enable mtd device(M-systems Millenium)I am
> able to see the driver recognizing the Millenium chip.
