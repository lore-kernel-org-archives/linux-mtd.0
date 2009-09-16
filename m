Received: from mail-px0-f190.google.com ([209.85.216.190])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Mnoe0-0006o1-Rd
	for linux-mtd@lists.infradead.org; Wed, 16 Sep 2009 07:09:41 +0000
Received: by pxi28 with SMTP id 28so3948504pxi.2
	for <linux-mtd@lists.infradead.org>;
	Wed, 16 Sep 2009 00:09:34 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 16 Sep 2009 12:39:34 +0530
Message-ID: <630851df0909160009w35efd6b2kb058593b59e1be66@mail.gmail.com>
Subject: Doubt regarding mtd test ( mtd_oobtest ) interpretation of oob data !
From: Murali N <nalajala.murali@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,
i have a doubt on how the OOB data is being managed in MTD driver.
Recently i have enabled mtd-tests to test my driver for mtd
compliance.After i ran "mtd_oobtest" i was messed up with test and
come up with few questions:

1) Is these tests are well validated? can i trust these tests 100%
compliant to MTD API specification?
2) In "mtd_oobtest" ( drivers/mtd/tests/ ), there was a "test 4 of 5"
in this there was a few checks for writing/reading end off OOB data.
            - In these tests what is the significance of using
"ooboffs" in OOB_AUTO mode?
3) Is MTD driver ask the below NAND driver to read/write the oob data
integral of oobavail size in OOB_AUTO mode? How MTD driver behaves if
it is not!!!
4) Finally, can anyone please explain bit more about OOB_PLACE mode?
also the significance of ooboffs field usage?

I appreciate your help, thanks
