Received: from sitemail3.everyone.net ([216.200.145.37] helo=omta03.mta.everyone.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 177pax-0001FQ-00
	for <linux-mtd@lists.infradead.org>; Wed, 15 May 2002 04:36:55 +0100
Content-Type: text/plain
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Date: Tue, 14 May 2002 20:36:50 -0700 (PDT)
From: Jim Zeus <zeusj@firstlinux.net>
To: "Subhash Chandra" <schandra@sasken.com>
Cc: all in MTD mailinglist <linux-mtd@lists.infradead.org>
Subject: Re: NAND vs NOR Flashs?
Reply-To: zeusj@firstlinux.net
Message-Id: <20020515033651.763F636F9@sitemail.everyone.net>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

--- "Subhash Chandra" <schandra@sasken.com> wrote:
>Hi,
>
>I would like to know the diff. between NAND and NOR flash types.
>Any pointers are appreciated.

The size of NAND flash (8-128M)is always bigger than NOR flash (1-16M);
Reading a NOR flash is a little faster than NAND flash;
Erasing and Writing a NAND flash is much faster than NOR flash;
So NAND flash is more fit for storing data and NOR flash is more fit for storing code.
And there is ECC (error correction) in NAND flash.
You can access NOR flash with SRAM interface and you have to do it with I/O port to NAND flash.
Those are some of the differences between NAND and NOR flash.


Jim Zeus



_____________________________________________________________
Want a new web-based email account ? ---> http://www.firstlinux.net

_____________________________________________________________
Promote your group and strengthen ties to your members with email@yourgroup.org by Everyone.net  http://www.everyone.net/?btn=tag
