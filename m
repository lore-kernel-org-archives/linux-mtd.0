Received: from sccrmhc02.attbi.com ([204.127.202.62])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17wPFp-0000vb-00
	for <linux-mtd@lists.infradead.org>; Tue, 01 Oct 2002 16:48:09 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: Mark Meade <mark@lakeshoremicro.com>
To: Carlos Mateo <otepas@yahoo.es>,
 linux-mtd@lists.infradead.org
Subject: Re: Newbie with DOC2000
Date: Tue, 1 Oct 2002 11:47:02 -0400
References: <20021001084851.25364.qmail@web13608.mail.yahoo.com>
In-Reply-To: <20021001084851.25364.qmail@web13608.mail.yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20021001154736.PKAO27763.sccrmhc02.attbi.com@there>
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

Carlos,

What does your system log say?  Run dmesg and see if the DoC was detected 
correctly, and if the nftl driver found any partitions.

Also check your /dev entries for nftla: nftla should be 93,0; /dev/nftla1 
should be 93,1.. etc.

Mark

Carlos Mateo wrote:
> I am trying to access a DOC2000, but I failed so far.
> I am using kernel 2.4.4.  I have recompiled it with
> DOC support (M-Sys DOC200, Direct char device access
> to MTD devices, FTL support, NTFL support and write
> support for NTFL).
> The kernel boots fine, but I am not able to do
> anything with the DOC (fdisk, mke2fs...).
>
> Any hints on what I should do?
>
> Thank you
