Received: from romsoft.iasi.rdsnet.ro ([82.77.20.73] helo=mail.rms.ro)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EZTue-0002iA-Aq
	for linux-mtd@lists.infradead.org; Tue, 08 Nov 2005 08:53:32 -0500
Received: from [192.168.100.31] (pc31.rms.ro [192.168.100.31])
	by mail.rms.ro (8.11.6/8.11.6) with ESMTP id jA8DA4U09752
	for <linux-mtd@lists.infradead.org>; Tue, 8 Nov 2005 15:10:04 +0200
Message-ID: <4370A357.5060805@rms.ro>
Date: Tue, 08 Nov 2005 15:08:39 +0200
From: Edgar Grimberg <edgar.grimberg@rms.ro>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: "Skipping dirent" message
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I have eCos and JFFS, and I get the following message from JFFS debug 
output:

<7>Skipping dirent: "2007-01-08 08-27", ino #10, type 8, because curofs 2 < offset 3

I am not sure what it means, but the fact is that I have the "2007-01-08 08-27" directory and I want to opendir and readdir it.

Regards,
Edgar
