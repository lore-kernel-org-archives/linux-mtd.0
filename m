Received: from beta.dmz-eu.st.com ([164.129.1.35])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1C5OPI-0005TK-L0
	for linux-mtd@lists.infradead.org; Thu, 09 Sep 2004 08:52:11 -0400
Received: from zeta.dmz-eu.st.com (ns2.st.com [164.129.230.9])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 43D5EDC7E
	for <linux-mtd@lists.infradead.org>;
	Thu,  9 Sep 2004 12:51:57 +0000 (GMT)
Received: from zeta.dmz-eu.st.com (localhost [127.0.0.1])
	by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D58C412301
	for <linux-mtd@lists.infradead.org>;
	Thu,  9 Sep 2004 12:51:56 +0000 (UTC)
Received: from mail1.agr.st.com (mail1.agr.st.com [164.130.4.71])
	by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 49161F2E6
	for <linux-mtd@lists.infradead.org>;
	Thu,  9 Sep 2004 12:51:56 +0000 (GMT)
Date: Thu, 9 Sep 2004 14:51:54 +0200
From: Lorenzo PARISI <lorenzo.parisi@st.com>
To: MTD mailing list <linux-mtd@lists.infradead.org>
MIME-Version: 1.0
Message-Id: <a9aea7e6.7d1fc97d.8199700@mail1.agr.st.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Subject: Don't detect my flashs
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I have a Simtec board: s3c2410
with Linux Debian 2.4.26 with patch-2.4.26-vrs1 and
patch-2.4.26-vrs1-bast3.
I have re-compiled the kernel for integrate MTD tools; but 
at boot my board don't detect my flashs.
My flashs are 3:
-> 1 Samsung
-> 2 ST Microelectronics

Thank you,
regards,
- Lorenzo
