Received: from h008.c007.snv.cp.net ([209.228.33.236] helo=c007.snv.cp.net)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17ZkEm-0005tH-00
	for <linux-mtd@lists.infradead.org>; Wed, 31 Jul 2002 04:33:24 +0100
Reply-To: <acurtis@directvinternet.com>
From: <acurtis@directvinternet.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: <linux-mtd@lists.infradead.org>
Subject: RE: 64-bit support for Intel Strata Flash 
Date: Tue, 30 Jul 2002 20:32:51 -0700
Message-ID: <NCBBIINEHIPFGJPLBEIFIEBADKAA.acurtis@directvinternet.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <14604.1028067787@redhat.com>
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

>
> The code in CVS should work.

I retrieved both the head and the 2.4 branch, neither supports 64-bit bus.
Primary problem is that the probe routines do not like a bus-width of 8.
