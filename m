Received: from qw-out-1920.google.com ([74.125.92.147])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M1K3x-0003oH-4k
	for linux-mtd@lists.infradead.org; Tue, 05 May 2009 12:48:03 +0000
Received: by qw-out-1920.google.com with SMTP id 4so3384725qwk.24
	for <linux-mtd@lists.infradead.org>;
	Tue, 05 May 2009 05:47:55 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1241526066.3760.37.camel@localhost.localdomain>
References: <71cd59b00905050249y7ea998c7mb5bb95c968d28b72@mail.gmail.com>
	<1241526066.3760.37.camel@localhost.localdomain>
Date: Tue, 5 May 2009 14:47:54 +0200
Message-ID: <71cd59b00905050547r2e4a67dft6c2848d6ff9c9c24@mail.gmail.com>
Subject: Re: mtdutils and libubiio
From: Corentin Chary <corentin.chary@gmail.com>
To: dedekind@infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>
> search the archives ... some one already posted a method for libifying
> the UBI code that exists in mtd-utils.  fixing up the minor remaining
> issues with that patch seems saner than trying to merge a completely
> unrelated code base.
libubiio use code from mtd-utils and UBI, so it's not realy a
"completely unrelated code base".


>We use them because they are simple.  There has been nothing to-date that
> has really required anything else.  I have no experience with CMake, but
> I'd rather avoid adding dependencies on it.
Makefile are simple, but so is CMake. Adding a new shared library is
as simple as that :

add_library(ubiio SHARED libubiio.c)
set_target_properties (ubiio PROPERTIES VERSION 0.1 SOVERSION 0)

But I understand is a big dependence to add.

> I do not know CMake, buy I thought Makefiles work just fine.
Ok, I just wanted to know.

>> I believe it's
>> simpler than creating a image, and using other tools to write it to the volume.
>> Where can libubiio be used ?
> Sure, go ahead.
I'll see what can I do with that.

-- 
Corentin Chary
http://xf.iksaif.net
