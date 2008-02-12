Received: from co203.xi-lite.net ([149.6.83.203] helo=toronto.xi-lite.net)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JOuM6-0006zh-N9
	for linux-mtd@lists.infradead.org; Tue, 12 Feb 2008 12:35:28 +0000
Message-ID: <47B18B77.1060602@parrot.com>
Date: Tue, 12 Feb 2008 13:05:11 +0100
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: Will Wagner <will_wagner@carallon.com>
Subject: Re: First access to mounted jffs2 partition is slow
References: <47B1840D.1010702@carallon.com>
In-Reply-To: <47B1840D.1010702@carallon.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
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

Will Wagner wrote:
> Hello,
> 
> I have an ARM11 system with a JFFS2 partition in NAND flash. It works 
> but the first time it is accessed after mounting it can be very slow.
I had a similar problem on ARM9 (see 
http://thread.gmane.org/gmane.linux.drivers.mtd/20340/focus=20355 )



Matthieu


-- 
Matthieu Castet
Ingénieur Développement Logiciel
Parrot SA
174 Quai de Jemmapes
75010 Paris, France

Tél: +33 (0) 1 48 03 74 78
Fax: +33 (0) 1 48 03 06 66
Email: matthieu.castet@parrot.fr
http://www.parrot.biz
