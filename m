Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FCy4u-0005HR-4G
	for linux-mtd@lists.infradead.org; Sat, 25 Feb 2006 06:59:15 -0500
Message-ID: <44004666.8030805@yandex.ru>
Date: Sat, 25 Feb 2006 14:58:30 +0300
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: tglx@linutronix.de
References: <43EB96DC.3030900@eptar.com>
	<43F74BF1.1080307@ru.mvista.com>	<1140337326.2480.674.camel@localhost.localdomain>	<200602210942.38302.manningc2@actrix.gen.nz>	<1140471467.2480.793.camel@localhost.localdomain>	<43FB00B4.9040706@yandex.ru>
	<1140523614.2480.931.camel@localhost.localdomain>
In-Reply-To: <1140523614.2480.931.camel@localhost.localdomain>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [Yaffs] bit error rates --> a vendor speaks
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

BTW, talking about generalization, that mtd->eraseregions stuff is as 
bad as OOB. IMO, it is better to treat different regions as different 
partitions or as different MTD devices.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
