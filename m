Received: from [203.200.31.15] (helo=mail.bpltelecom.com)
	by pentafluge.infradead.org with smtp (Exim 4.22 #5 (Red Hat Linux))
	id 19rths-0002NA-K6
	for <linux-mtd@lists.infradead.org>; Wed, 27 Aug 2003 07:23:00 +0100
Message-ID: <1574.10.10.14.131.1061966391.squirrel@mail.bpltelecom.com>
Date: Wed, 27 Aug 2003 12:09:51 +0530 (IST)
From: "Vidya Srinivas" <vidya.s@bpltelecom.com>
To: <ilatypov@infradead.org>
In-Reply-To: <20030826224753.GA4135@ei.homeip.net>
References: <1578.10.10.13.147.1061881336.squirrel@mail.bpltelecom.com>
        <20030826224753.GA4135@ei.homeip.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
Subject: Re: cramfs:wrong magic
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Thanks a lot for the support.

Actually it was a problem  regarding the endianness.
My system was a big endian system and i am supposed to create a cramfs
image for a big endian system (-rb option). One more person Mr. Fillod
Stephane helped me out.

Thanks again.

Regards,
Vidya


>
> On Tue, Aug 26, 2003 at 12:32:16PM +0530, Vidya Srinivas wrote:
>
>> root=/dev/mtdblock3 rootfstype=cramfs init=/sbin/init
>>
>> At the time of FS mounting, the kernel is throwing this error:
>>
>> cramfs : wrong magic
>
> I know Debian (http://debian.org/) has a kernel patch to correctly
> support cramfs root file system.  Debian maintainers provide this patch
> for a long time.
>
> I understand /dev/mtdblock3 can also be verified against the original
> image.
>
> --
> Ilguiz Latypov
>
> tel.  +1 (519) 569-7193
> 31 Oprington Drive, Unit D3
> Kitchener, Ontario N2N 3G3
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/


-- 
Vidya.S
BPL TELECOM LTD
11th KM, Arikere
Bannergatta Road,
Bangalore - 560072
email - vidya.s@bpltelecom.com
Ph - 6589080 extn - 2005
