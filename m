Received: from mailhst2.its.tudelft.nl ([130.161.34.250])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15gW2a-0005n1-00
	for <linux-mtd@lists.infradead.org>; Mon, 10 Sep 2001 19:44:16 +0100
Date: Mon, 10 Sep 2001 20:50:17 +0200
From: Erik Mouw <J.A.K.Mouw@ITS.TUDelft.NL>
To: Robert Warner <rwarner@mediaone.net>
Cc: linux-mtd@lists.infradead.org
Subject: Re: list-newbie ... Have an Intel Flash E28F128 and want to ...
Message-ID: <20010910205017.A14221@arthur.ubicom.tudelft.nl>
References: <01090423503703.03804@amdk62300>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01090423503703.03804@amdk62300>; from rwarner@mediaone.net on Tue, Sep 04, 2001 at 11:50:37PM -0400
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

On Tue, Sep 04, 2001 at 11:50:37PM -0400, Robert Warner wrote:
> 1. In-circuit programming of CFI flashes .. is this feasible? does a utility 
> already exist?

A commonly used trick on StrongARM SA11x0 platforms is to program the
flash from the CPU JTAG interface (JTAG is a debugging interface). The
utility "jflash" exists for that, it bit-bangs the JTAG protocol on the
parallel port. You can get it (for the Intel Assabet board) at
ftp://ftp.arm.linux.org.uk/pub/linux/arm/people/nico/Assabet-Jflash-v1.2-1.tgz
No idea if it will be useful for you.


Erik

-- 
J.A.K. (Erik) Mouw, Information and Communication Theory Group, Department
of Electrical Engineering, Faculty of Information Technology and Systems,
Delft University of Technology, PO BOX 5031,  2600 GA Delft, The Netherlands
Phone: +31-15-2783635  Fax: +31-15-2781843  Email: J.A.K.Mouw@its.tudelft.nl
WWW: http://www-ict.its.tudelft.nl/~erik/
