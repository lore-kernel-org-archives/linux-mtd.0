Received: from beta.dmz-eu.st.com ([164.129.1.35])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HMQvc-0002de-SR
	for linux-mtd@lists.infradead.org; Wed, 28 Feb 2007 10:41:20 -0500
Received: from zeta.dmz-eu.st.com (ns2.st.com [164.129.230.9])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 06D46DB19
	for <linux-mtd@lists.infradead.org>;
	Wed, 28 Feb 2007 15:41:03 +0000 (GMT)
Received: from mail1.nap.st.com (mail1.nap.st.com [10.150.200.1])
	by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id ABF77474E6
	for <linux-mtd@lists.infradead.org>;
	Wed, 28 Feb 2007 15:41:03 +0000 (GMT)
From: Davide CASCONE <davide.cascone@st.com>
To: <linux-mtd@lists.infradead.org>
Subject: JFFS2 recovery strategy
Date: Wed, 28 Feb 2007 16:41:14 +0100
Message-ID: <002e01c75b4e$e1596f60$d204960a@nap.st.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


I'm using JFFS2 with Sibley device. During a file writing (for instance =
the copy of a file of 10KB), what happens when a single buffer program =
fails? It seams that JFFS2 tries to recovery the file. In which way does =
it work? I suppose that JFFS2 tries to write the remaining bytes on =
another flash block. Is it right? Please, could you summarize the JFFS2 =
recovery strategy?

Thanks in advance for your support.
Best regards,
Davide
