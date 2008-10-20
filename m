Received: from mail-gx0-f10.google.com ([209.85.217.10])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Ks3kJ-0000sJ-D7
	for linux-mtd@lists.infradead.org; Mon, 20 Oct 2008 23:01:07 +0000
Received: by gxk3 with SMTP id 3so4937087gxk.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 20 Oct 2008 16:01:06 -0700 (PDT)
Message-ID: <9c9fda240810201601m2f5fbf9bqb5180c3617c01221@mail.gmail.com>
Date: Tue, 21 Oct 2008 08:01:06 +0900
From: "Kyungmin Park" <kmpark@infradead.org>
Sender: kyungmin78@gmail.com
To: "Adrian Hunter" <ext-adrian.hunter@nokia.com>
Subject: Re: [REFERENCE PATCH][OneNAND] S3C64XX support
In-Reply-To: <48FC9EB6.10000@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <20081020093220.GA18312@july> <48FC9EB6.10000@nokia.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 21, 2008 at 12:07 AM, Adrian Hunter
<ext-adrian.hunter@nokia.com> wrote:
> Kyungmin Park wrote:
>>
>> It's OneNAND support on New Samsung Mobile CPU S3C64XX series Now it's
>> only tested with s3c6410 with UBI & UBIFS.
>> If you want to use it on s3c6400, you should change some values.
>>
>> There's some ugly hack for support s3c64xx. It will be handled more fancy
>> later.
>>
>> Any comments are welcome
>
> Why not just make it a separate driver and skip using onenand_base etc?
>

DId you see the s3c64xx OneNAND controller?. It has its own OneNAND
controller and don't use the OneNAND memory access method as OMAP.

Yes it's possible to make an own OneNAND driver for s3c64xx, but maybe
a half of codes are redundant except the access method  so I want to
use default onenand_base and just redefine the OneNAND function for
s3c64xx.

Thank you,
Kyungmin Park
