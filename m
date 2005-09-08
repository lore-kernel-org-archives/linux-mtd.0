Received: from apgrc3atc-wsgw1.atc.army.mil ([134.194.13.55])
	by canuck.infradead.org with smtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EDJw4-0002wG-An
	for linux-mtd@lists.infradead.org; Thu, 08 Sep 2005 06:47:21 -0400
Received: from APGRC3ATC-SMTP1.nae.ds.army.mil ([134.194.25.160])
	by apgrc3atc-wsgw1.atc.army.mil (SMSSMTP 4.0.0.59) with SMTP id
	M2005090806314809619
	for <linux-mtd@lists.infradead.org>; Thu, 08 Sep 2005 06:31:48 -0400
Message-ID: <22CECCE071A8DC4CAB2412DC44CBEDF10A9BD6@apgrb1atc-0058e.atc.army.mil>
From: "Carlos, John J USAATC" <john.carlos@atc.army.mil>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Date: Thu, 8 Sep 2005 06:31:46 -0400 
MIME-Version: 1.0
Content-Type: text/plain
Subject: Problems with DOC 128Mbyte, random data loss
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello All,

	I have a problem, I am running 2.4.18 (I know a bit old) I have a
DOC 128Mbyte inflt chip.  I had problems with it in the beginning and was
provided a patch to get it up and running.  Now it seems once in a while
some of the file systems gets trashed.  I have ext3 on it since jffs2 was
not supporting DOC at the time.  I also use DOC boot to boot the system.
Could someone tell me if the current drivers are more stable and if the have
been pushed back in the 2.4 series or has most of the current work only been
done for 2.6 series.  

Thanks,
John 
