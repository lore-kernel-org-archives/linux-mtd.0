Received: from host-212-158-219-180.bulldogdsl.com ([212.158.219.180]
	helo=aeryn.fluff.org.uk)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CFrXk-0007gC-OL
	for linux-mtd@lists.infradead.org; Fri, 08 Oct 2004 06:00:10 -0400
Date: Fri, 8 Oct 2004 11:00:02 +0100
From: Ben Dooks <ben@fluff.org.uk>
To: Lorenzo PARISI <lorenzo.parisi@st.com>
Message-ID: <20041008100002.GJ12218@home.fluff.org>
References: <83197f15.8bfe70e2.81c1800@mail1.agr.st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <83197f15.8bfe70e2.81c1800@mail1.agr.st.com>
Sender: Ben Dooks <ben@fluff.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Benchmark errors
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 08, 2004 at 11:52:23AM +0200, Lorenzo PARISI wrote:
> Hi all,
> 
> when I benchmark the NAND with Bonnie++, I receive many 
> errors:
> 
> nand_write_oob: Failed write verify, page 0x0....
>      :                  :                :
>      :                  :                :
> 
> and Bonnie++ end with this messages:
> 
> Bonnie: drastic I/O error (rmdir): Directory not empty
> Cleaning up test directory after error
> Bonnie: drastic I/O error (rmdir): No such file or directory
> 
> Initially, I thinked that a problem of Bonnie++, but if I 
> run Bonnie++ on a NAND with JFFS2, I don't receive any 
> errors.

erm, what filesystem are you using the gives errors?

NAND is not guaranteed to be defectless, the fs must
be able to deal with bad blocks in the NAND.

-- 
Ben (ben@fluff.org, http://www.fluff.org/)

  'a smiley only costs 4 bytes'
