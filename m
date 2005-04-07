Received: from wproxy.gmail.com ([64.233.184.202])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DJPqN-000737-2D
	for linux-mtd@lists.infradead.org; Thu, 07 Apr 2005 01:46:19 -0400
Received: by wproxy.gmail.com with SMTP id 36so566011wra
	for <linux-mtd@lists.infradead.org>;
	Wed, 06 Apr 2005 22:46:19 -0700 (PDT)
Message-ID: <29f916510504062239522af179@mail.gmail.com>
Date: Thu, 7 Apr 2005 01:39:38 -0400
From: alfred hitch <alfred.hitch@gmail.com>
To: linux-mtd@lists.infradead.org
In-Reply-To: <29f91651050406194833bd6bda@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
References: <29f9165105040601323ef8d30@mail.gmail.com>
	<29f91651050406194833bd6bda@mail.gmail.com>
Subject: 2nd flash detection on ixp425 based boards
Reply-To: alfred hitch <alfred.hitch@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

could some one please help me understand that why is the
genprobe_ident_chips function .. working this way ?

that is in for loop adding probed device size again ??
wouldnt it cause it to miss probes for devices whose size is lower
than firsqt one .. ?

Anyone provide some input ?

and surprisingly, when I remove this check / patch it to not add .. I
am able to work with my flash just fine .. ?
so what was the reason to do it that way ?

Cheers,
Alfred

---------- Forwarded message ----------
From: alfred hitch <alfred.hitch@gmail.com>
Date: Apr 6, 2005 4:32 AM
Subject: 2nd flash detection on ixp425 based boards
To: linux-mtd@lists.infradead.org

Hi,

This is regading cfi probe for multiple flash chips  ..

On my IXP425 based board, with 2 chips, one on CS0(16MB)
and other on CS1 (16 MB) ..

I am able to probe and write through to these devices in my probe ..
all's well .

but today, we were changing hardware configuration to have 8MB on CS1
in stead of 16MB ..
and I notice that in the gen_probe.c -> genprobe_ident_chips function ..
the for loop which checks for base size is to map->size will not pass thru ..
that is it will say find 16 + 16 <= 24 (configured as window_size)

I see a comment above it also saying that this is to check that the
size is good enough to accomodate another chip of same size in this
probe..

Please help me understand that why are we doing it this way .. is h/w
config like we are trying to have wrong ? why cannot I put base <
cfi.chipshiftsize in
that for loop and map both the devices .. why does the second one has
to be this way of size more or equal to first one ..

Cheers,
Alfred
