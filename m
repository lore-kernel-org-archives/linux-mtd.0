Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1ObW2I-0003bZ-5g
	for linux-mtd@lists.infradead.org; Wed, 21 Jul 2010 09:56:23 +0000
Subject: Re: [PATCH v2 0/2] Improved BB Scanning
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <norris@broadcom.com>
In-Reply-To: <4C44A833.3010500@broadcom.com>
References: <1279059181-29300-1-git-send-email-norris@broadcom.com>
	<1279471132.16247.55.camel@localhost.localdomain>
	<4C44A833.3010500@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 21 Jul 2010 12:49:19 +0300
Message-ID: <1279705759.2306.0.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Thomas Gleixner <tglx@linutronix.de>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	David Woodhouse <David.Woodhouse@intel.com>,
	Maxim Levitsky <maximlevitsky@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-07-19 at 12:32 -0700, Brian Norris wrote:
> On 07/18/2010 09:38 AM, Artem Bityutskiy wrote:
> > I did not _really_ review this, it the patches look good. How did you
> > test them? Did you test on both large and small page NANDs?
> 
> I referenced 30+ data sheets (covering 100+ parts), and I tested a 
> selection of 10 different chips to varying degrees. Particularly, I 
> tested the creation of bad-block descriptors and basic BB scanning on 
> three parts:
> 
> ST NAND04GW3B2D, 2K page
> ST NAND128W3A, 512B page
> Samsung K9F1G08U0A, 2K page
> 
> To test these, I wrote some fake bad block markers to the flash (in OOB 
> bytes 1, 6, and elsewhere) to see if the scanning routine would detect 
> them properly. However, this method was somewhat limited because the 
> driver I am using has some bugs in its OOB write functionality.

Sounds like you did a lot of work. I'll add this information to the
patch description.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
