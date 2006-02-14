Received: from ms01.sssup.it ([193.205.80.99] helo=sssup.it)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1F8ypf-0003be-G8
	for linux-mtd@lists.infradead.org; Tue, 14 Feb 2006 06:59:03 -0500
Received: from [193.205.82.7] (HELO gandalf.sssup.it)
	by sssup.it (CommuniGate Pro SMTP 4.1.8)
	with ESMTP-TLS id 19663658 for linux-mtd@lists.infradead.org;
	Tue, 14 Feb 2006 12:58:34 +0100
Received: from [10.30.3.59] (silmarillion.retis [10.30.3.59])
	by gandalf.sssup.it (8.12.10/8.12.10) with ESMTP id k1ECvlXi004708
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-mtd@lists.infradead.org>; Tue, 14 Feb 2006 13:57:47 +0100
Message-ID: <43F1C5FC.9010402@gandalf.sssup.it>
Date: Tue, 14 Feb 2006 12:58:52 +0100
From: Michael Trimarchi <trimarchi@gandalf.sssup.it>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Skipping bad block
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,
I modify the flash_eraseall width two new parameter start e size. It 
skips the bad block but dd does't skip. Which utility may I use to write 
and skip the bad block.
Regards Michael
