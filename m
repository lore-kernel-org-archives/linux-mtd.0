Received: from ms01.sssup.it ([193.205.80.99] helo=sssup.it)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EfwvQ-00053Q-Vn
	for linux-mtd@lists.infradead.org; Sat, 26 Nov 2005 05:05:04 -0500
Received: from [193.205.82.6] (HELO feanor.sssup.it)
	by sssup.it (CommuniGate Pro SMTP 4.1.8)
	with ESMTP-TLS id 17561017 for linux-mtd@lists.infradead.org;
	Sat, 26 Nov 2005 10:56:28 +0100
Message-ID: <20051126110450.72feva7a8kwog444@feanor.sssup.it>
Date: Sat, 26 Nov 2005 11:04:50 +0100
From: trimarchi@gandalf.sssup.it
To: linux-mtd@lists.infradead.org, .@gandalf.sssup.it
MIME-Version: 1.0
Content-Type: text/plain;
	charset=ISO-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Cc: 
Subject: NAND s3c2410 probe
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
I configure the kernel 2.6.14 for support s3c2410 NAND. I change a little bit
the config of smdk4410 add the partition info but the kernel never call the
probe function for nand search. When is colled the probe function?
Regards
Michael


----------------------------------------------------------------
This message was sent using IMP, the Internet Messaging Program.
