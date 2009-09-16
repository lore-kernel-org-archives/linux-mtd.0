Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MnosP-0007ye-62
	for linux-mtd@lists.infradead.org; Wed, 16 Sep 2009 07:24:34 +0000
Subject: Re: Doubt regarding mtd test ( mtd_oobtest ) interpretation of oob
	data !
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Murali N <nalajala.murali@gmail.com>
In-Reply-To: <630851df0909160009w35efd6b2kb058593b59e1be66@mail.gmail.com>
References: <630851df0909160009w35efd6b2kb058593b59e1be66@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 16 Sep 2009 10:23:39 +0300
Message-Id: <1253085819.3778.5.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-09-16 at 12:39 +0530, Murali N wrote:
> Hi All,
> i have a doubt on how the OOB data is being managed in MTD driver.
> Recently i have enabled mtd-tests to test my driver for mtd
> compliance.After i ran "mtd_oobtest" i was messed up with test and
> come up with few questions:
> 
> 1) Is these tests are well validated? can i trust these tests 100%
> compliant to MTD API specification?

Not necessarily. We wrote these tests to test our OneNAND, and they
may contain bugs.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
