Received: from wproxy.gmail.com ([64.233.184.194])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DJ5y3-0002rW-Gg
	for linux-mtd@lists.infradead.org; Wed, 06 Apr 2005 04:32:58 -0400
Received: by wproxy.gmail.com with SMTP id 55so206636wri
	for <linux-mtd@lists.infradead.org>;
	Wed, 06 Apr 2005 01:32:55 -0700 (PDT)
Message-ID: <29f9165105040601323ef8d30@mail.gmail.com>
Date: Wed, 6 Apr 2005 04:32:55 -0400
From: alfred hitch <alfred.hitch@gmail.com>
To: linux-mtd@lists.infradead.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
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
