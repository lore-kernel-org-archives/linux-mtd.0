Received: from n1.cetrtapot.si ([212.30.80.17])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DbJjI-0005BT-Cf
	for linux-mtd@lists.infradead.org; Thu, 26 May 2005 10:53:01 -0400
Message-ID: <4295E2BE.3070501@cetrtapot.si>
Date: Thu, 26 May 2005 16:52:46 +0200
From: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
MIME-Version: 1.0
To: Andrew Victor <andrew@sanpeople.com>
References: <4294D4F2.6010105@cetrtapot.si>
	<1117089331.6175.19.camel@fuzzie.sanpeople.com>
In-Reply-To: <1117089331.6175.19.camel@fuzzie.sanpeople.com>
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Serial flash memory support
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Andrew Victor wrote:
> hi Hinko,
> 
> 
>>Has anybody done something on the SPI flash memory devices already?
> 
> 
> Yes, there is a driver for Atmel's DataFlash.
> 

ST serial flash seems pretty close according to the specs.

> The driver is included in the 2.4 ARM-Linux kernels
> (www.arm.linux.org.uk) and the 2.6 patches for the AT91RM9200 processor
> (http://maxim.org.za/AT91RM9200/2.6/).
> 

Great, 2.6 patch looks promising. Thank you. Can you provide information about 
timings for accessing SPI serial flash. As I could see from kernel boot dump on 
the maxim.org.za page you seem to be using SPI serial flash for code and data.

Our application has user data on the SPI serial flash and at boot time its 
contents is read - it has to be done as fast as possible. Is there some fs you 
could recomend for this purpose?



regards,
hinko k

-- 
..because under Linux "if something is possible in principle,
then it is already implemented or somebody is working on it".

					--LKI
