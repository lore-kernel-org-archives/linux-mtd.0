Received: from mail2.gnudd.com ([213.203.150.91] helo=mail.gnudd.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MTuHF-0003Pk-NS
	for linux-mtd@lists.infradead.org; Thu, 23 Jul 2009 09:07:54 +0000
Date: Thu, 23 Jul 2009 11:07:30 +0200
From: Alessandro Rubini <rubini-list@gnudd.com>
To: rubini-list@gnudd.com
Subject: Re: [PATCH V4 1/2] Nand driver for Nomadik 8815 SoC (on NHK8815 board)
Message-ID: <20090723090730.GA24918@mail.gnudd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Sender: rubini-list@gnudd.com
In-Reply-To: <20090723065922.GA22450@mail.gnudd.com>
References: <20090723065922.GA22450@mail.gnudd.com>
	<ce9ab5790907222130o2f1d704u199fbf7f1435e74f@mail.gmail.com>
	<cover.1248300341.git.rubini@unipv.it>
	<cae21cf16cad72ef35ce7e8cc3effe25b497924e.1248300341.git.rubini@unip
	v.it>
Cc: STEricsson_nomadik_linux@list.st.com, linux@arm.linux.org.uk,
	vimal.newwork@gmail.com, linux-mtd@lists.infradead.org,
	andrea.gallo@stericsson.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>> 'nand_calculate_ecc' and 'nand_correct_data' (nand_ecc.c) do it in SW.
>> This need not to be re-do.
> 
> When I initially tried soft ecc it didn't work, so I thought ours was
> a different algorithm. Most likely I was wrong, I'll recheck ASAP.

It's slightly different. This is what I get (old is nand_calculate_ecc(), new is mine).

   old: 65 56 55
   new: 56 65 55

   old: 33 fc 0c
   new: fc 33 0c

   old: c0 c0 3c
   new: c0 c0 3c

   old: c3 3f cf
   new: 3f c3 cf

   old: c0 0f 30
   new: 0f c0 30

   old: 03 f3 3f
   new: f3 03 3f

So, the standard procedure is not compatible with data already in
flash (written with the older u-boot and kernel provided by the vendor
with the kit).

The code in nomadik_ecc512_calc() is derived from vendor data sheet,
looking at vendor code I got; since both routines gives the same results,
mine _should_ be compatible with hw ecc, for the day I'll be
able to make it work. However vendor code never used hw ecc, either,
so I'm not sure this routine is really compatible with it.

Actually, I got a hint about why hw ecc isn't working for me, but
can't try it these days.

In view of this, can my code stay? 

/alessandro
