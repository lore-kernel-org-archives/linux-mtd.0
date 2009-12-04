Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NGTs5-0003x3-17
	for linux-mtd@lists.infradead.org; Fri, 04 Dec 2009 08:50:41 +0000
Subject: Re: get mtd name and manufacturer from high level app
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Salvatore Frizzoli - IMS Italy <sfrizzoli@imsitaly.com>
In-Reply-To: <4B167A11.6010407@imsitaly.com>
References: <4B167A11.6010407@imsitaly.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 04 Dec 2009 10:50:04 +0200
Message-Id: <1259916604.8673.17.camel@localhost>
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

On Wed, 2009-12-02 at 15:30 +0100, Salvatore Frizzoli - IMS Italy wrote:
> Hi all,
> 
> I am working on an application under a uClinux kernel.
> This application would read name, manufacturer and id of the mtd flash 
> device.
> I have seen that it is not possible to do this by ioctl, so I don't know 
> how to do.

Take a look at the mtdinfo utility in mtd-utils/ubi-utils. It reads most
of the data from sysfs.

Manufecturer ID is not available though, and you need to teach the
kernel to export it.

Look inside of mtdinfo to find out how it does things. You can also
extend it and send patches.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
