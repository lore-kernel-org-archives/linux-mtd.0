Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FBYdE-0004EM-S1
	for linux-mtd@lists.infradead.org; Tue, 21 Feb 2006 09:36:50 -0500
Message-ID: <43FB255B.9050305@yandex.ru>
Date: Tue, 21 Feb 2006 17:36:11 +0300
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Josh Boyer <jwboyer@gmail.com>
References: <43EB96DC.3030900@eptar.com>	
	<200602210942.38302.manningc2@actrix.gen.nz>	
	<1140471467.2480.793.camel@localhost.localdomain>	
	<200602211140.30069.manningc2@actrix.gen.nz>	
	<43FB0424.1020309@yandex.ru>
	<625fc13d0602210550l69546064r5562b59d05af2a3c@mail.gmail.com>
In-Reply-To: <625fc13d0602210550l69546064r5562b59d05af2a3c@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Vitaly Wool <vwool@ru.mvista.com>, William Watson <wjw1961@gmail.com>,
	yaffs@stoneboat.aleph1.co.uk, Charles Manning <manningc2@actrix.gen.nz>,
	linux-mtd@lists.infradead.org, tglx@linutronix.de
Subject: Re: [Yaffs] bit error rates --> a vendor speaks
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



Josh Boyer wrote:
> But Charles also wants clean interfaces.  I agree that clean
> interfaces are definitely a good thing, but trying to come up with a
> clean interface for OOB access that won't get bastardized seems to be
> unattainable.

But this does not mean that we should remove OOB support. Again, the 
right (IMO, of couse) way is to make several levels of generalization.

Just off the top of my head:

1. MTD level: a generic flash model with nothion of eraseblock, a 
mimimal I/O unit, read and write operations, nothing else. This level is 
for properly designed software.

2. NAND flash level: here you have OOB access. Work in terms of NAND 
pages, etc. Here YAFFS could be happy.

3. We could also have a DataFlash layer, where DataFlash guys could make 
use of their blocks and sectores, use features note visible from the 
topmost generic MTD layer.

> I think at some time in the not so distant future this whole
> conversation will become a moot point.  SLC NAND quality seems to be
> degradding as the die sizes go down, and MLC NAND is already of a
> degraded quality comparitively.  Better ECC algorithms will be needed
> to provide the reliability that people want and I can see that
> consuming all of the available OOB area anyway.

Still, the argument with CF cards makes me believe that vendors will 
provide some space for user data in OOB. Why can't they enlarge OOB size?

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
