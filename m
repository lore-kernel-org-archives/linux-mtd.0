Received: from wx-out-0506.google.com ([66.249.82.234])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I1g1u-0000yc-Ko
	for linux-mtd@lists.infradead.org; Fri, 22 Jun 2007 06:06:15 -0400
Received: by wx-out-0506.google.com with SMTP id h26so814284wxd
	for <linux-mtd@lists.infradead.org>;
	Fri, 22 Jun 2007 03:06:12 -0700 (PDT)
Message-ID: <366f00c80706220306l1e0ebcek3c7cdc988c82de81@mail.gmail.com>
Date: Fri, 22 Jun 2007 15:36:12 +0530
From: "Sudeep K N" <sudeepholla.maillist@gmail.com>
To: dedekind@infradead.org
Subject: UBI - Nand bad block management details required
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Does the UBI depend on the bad block table(BBT) built by MTD?
In otherwords, can the complete chip scan during chip probe be avoided
by enabling/setting NAND_SKIP_BBTSCAN in chip->options?

Does UBI built BBT independent of the MTD built BBT?

Regards,
Sudeep
