Received: from ip66-35-227-11.altera.com ([66.35.227.11] helo=www.altera.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15jN04-0000p0-00
	for <linux-mtd@lists.infradead.org>; Tue, 18 Sep 2001 16:41:28 +0100
Received: from Altera.COM (sunrise.altera.com [137.57.1.1])
	by www.altera.com (8.9.3+Sun/8.9.3) with ESMTP id IAA07670
	for <linux-mtd@lists.infradead.org>; Tue, 18 Sep 2001 08:44:26 -0700 (PDT)
Message-ID: <82B1591A280FD411B91200D0B75B484A015F5C3E@sis-uk-msg01.altera.com>
From: Clive Davies <cdavies@altera.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Intel Flash protection registers
Date: Tue, 18 Sep 2001 08:47:52 -0700
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

I'd like to be able to read/write the OTP protection registers which are a
feature of some Intel flash chips. Is anybody already looking at this?

If not then I'm intending to do it myself and map this onto the oob
read/write functionality. Is this a sensible approach or is there a better
approach?

Clive
