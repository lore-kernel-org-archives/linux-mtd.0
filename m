Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NhIeh-0001uA-7s
	for linux-mtd@lists.infradead.org; Tue, 16 Feb 2010 08:19:43 +0000
Subject: Re: [PATCH v3 2/2] Adding nand lock/unlock routines.
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Vimal Singh <vimal.newwork@gmail.com>
In-Reply-To: <ce9ab5791002150650x79e40747w7aa345c115356d06@mail.gmail.com>
References: <ce9ab5791002080220n51cd6611iafe09df6370d8dc2@mail.gmail.com>
	<1266244528.11659.108.camel@localhost>
	<ce9ab5791002150650x79e40747w7aa345c115356d06@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 16 Feb 2010 10:18:11 +0200
Message-ID: <1266308291.11659.179.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kishorek.kadiyala@gmail.com, Linux MTD <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-02-15 at 20:20 +0530, Vimal Singh wrote:
> On Mon, Feb 15, 2010 at 8:05 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> > On Mon, 2010-02-08 at 15:50 +0530, Vimal Singh wrote:
> >> This version fixes the compilation break reported by Kishore. 1st
> >> patch in this series remains untouched.
> >>
> >> -vimal
> >>
> >> From a28c230f3bd8fa765f78c0be91370f146e71f670 Mon Sep 17 00:00:00 2001
> >> From: Vimal Singh <vimalsingh@ti.com>
> >> Date: Wed, 3 Feb 2010 14:32:06 +0530
> >> Subject: [PATCH 2/2] Adding nand lock/unlock routines.
> >>
> >> Adding nand lock / unlock routines. At least 'micron' parts
> >> support this.
> >>
> >> Signed-off-by: Vimal Singh <vimalsingh@ti.com>
> >
> > These look OK to me, except the part where you export them. Why they
> > should be exported?
> 
> There was an earlier comment (in 1st RFC version of the patch), where
> you said probably it is not safer to assign mtd lock and unlock
> pointers in 'nand_scan_tail', as not all flashes have this feature.
> 
> So, I exported these so that a driver can use these by overwriting mtd
> lock and unlock pointers in its probe.

OK, push to my l2-mtd-2.6.git / master

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
