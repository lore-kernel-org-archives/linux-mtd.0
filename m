Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oc1hJ-0006hZ-2A
	for linux-mtd@lists.infradead.org; Thu, 22 Jul 2010 19:44:49 +0000
Received: by wwd20 with SMTP id 20so113657wwd.0
	for <linux-mtd@lists.infradead.org>;
	Thu, 22 Jul 2010 12:44:46 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1279705759.2306.0.camel@localhost>
References: <1279059181-29300-1-git-send-email-norris@broadcom.com>
	<1279471132.16247.55.camel@localhost.localdomain>
	<4C44A833.3010500@broadcom.com> <1279705759.2306.0.camel@localhost>
Date: Thu, 22 Jul 2010 21:44:45 +0200
Message-ID: <AANLkTin0p9YlE59dejGKGcnhRteMlyLXrxWnu1o-zK_a@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Improved BB Scanning
From: Karl Beldan <karl.beldan@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: Thomas Gleixner <tglx@linutronix.de>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	David Woodhouse <David.Woodhouse@intel.com>,
	Brian Norris <norris@broadcom.com>,
	Maxim Levitsky <maximlevitsky@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jul 21, 2010 at 11:49 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Mon, 2010-07-19 at 12:32 -0700, Brian Norris wrote:
>> On 07/18/2010 09:38 AM, Artem Bityutskiy wrote:
>> > I did not _really_ review this, it the patches look good. How did you
>> > test them? Did you test on both large and small page NANDs?
>>
>> I referenced 30+ data sheets (covering 100+ parts), and I tested a
>> selection of 10 different chips to varying degrees. Particularly, I
>> tested the creation of bad-block descriptors and basic BB scanning on
>> three parts:
>>
>> ST NAND04GW3B2D, 2K page
>> ST NAND128W3A, 512B page
>> Samsung K9F1G08U0A, 2K page
>>
>> To test these, I wrote some fake bad block markers to the flash (in OOB
>> bytes 1, 6, and elsewhere) to see if the scanning routine would detect
>> them properly. However, this method was somewhat limited because the
>> driver I am using has some bugs in its OOB write functionality.
>
> Sounds like you did a lot of work. I'll add this information to the
> patch description.
>
I haven't seen many nandsim feedback, though it allows precise test scenarios
and easy flash forensics.
Still, FWIW, I too laud the effort.

-- 
Karl
