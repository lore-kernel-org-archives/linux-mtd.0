Received: from mms1.broadcom.com ([216.31.210.17])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oaw4a-0000sk-Ax
	for linux-mtd@lists.infradead.org; Mon, 19 Jul 2010 19:32:20 +0000
Message-ID: <4C44A833.3010500@broadcom.com>
Date: Mon, 19 Jul 2010 12:32:03 -0700
From: "Brian Norris" <norris@broadcom.com>
MIME-Version: 1.0
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Subject: Re: [PATCH v2 0/2] Improved BB Scanning
References: <1279059181-29300-1-git-send-email-norris@broadcom.com>
	<1279471132.16247.55.camel@localhost.localdomain>
In-Reply-To: <1279471132.16247.55.camel@localhost.localdomain>
Content-Type: text/plain;
 charset=utf-8;
 format=flowed
Content-Transfer-Encoding: 7bit
Cc: Thomas Gleixner <tglx@linutronix.de>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	David Woodhouse <David.Woodhouse@intel.com>,
	Maxim Levitsky <maximlevitsky@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 07/18/2010 09:38 AM, Artem Bityutskiy wrote:
> I did not _really_ review this, it the patches look good. How did you
> test them? Did you test on both large and small page NANDs?

I referenced 30+ data sheets (covering 100+ parts), and I tested a 
selection of 10 different chips to varying degrees. Particularly, I 
tested the creation of bad-block descriptors and basic BB scanning on 
three parts:

ST NAND04GW3B2D, 2K page
ST NAND128W3A, 512B page
Samsung K9F1G08U0A, 2K page

To test these, I wrote some fake bad block markers to the flash (in OOB 
bytes 1, 6, and elsewhere) to see if the scanning routine would detect 
them properly. However, this method was somewhat limited because the 
driver I am using has some bugs in its OOB write functionality.
