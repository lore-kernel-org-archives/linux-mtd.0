Received: from ug-out-1314.google.com ([66.249.92.168])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GkjPO-0004Ev-Tt
	for linux-mtd@lists.infradead.org; Thu, 16 Nov 2006 10:44:19 -0500
Received: by ug-out-1314.google.com with SMTP id m2so442258uge
	for <linux-mtd@lists.infradead.org>;
	Thu, 16 Nov 2006 07:44:08 -0800 (PST)
Message-ID: <79ac09b60611160744u4e3c1804q81bce772fdac7851@mail.gmail.com>
Date: Thu, 16 Nov 2006 09:44:08 -0600
From: Duke <ezbonites@gmail.com>
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: commandline physmap changed?
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,
I'm using 2.6.18 kernel setting up my nor flash with the commandline:

mtdparts=phys_mapped_flash:2m(boot),-(root)mtdparts=phys_mapped_flash:2m(boot),-(root)
, and the phys mapped driver would not shot these partition on boot.

I did the same thing on a previous 2.6.16 kernel and it worked ok.
What changed? I noticed a physmap-flash name change but that wasn't it
(i.e mtdparts=physmap-flash:2m(boot),-(root) ).
How do I fix it?

Thanks
