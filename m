From: Russ.Dill@asu.edu (Russ Dill)
Date: Fri, 28 Mar 2003 19:49:41 -0700
Subject: Required memory size for jffs2.
In-Reply-To: <00da01c2f4d6$ac6b3140$7d0323d3@tweedledum>
References: <00da01c2f4d6$ac6b3140$7d0323d3@tweedledum>
Message-ID: <1048828447.2530.2.camel@localhost>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

> I could hardly believe the results. jffs2 requires too much memory!!
> 

yes, its *very* advanced, and *very* nifty. I don't know how you
factored in buffered and cached memory, but it may be mostly that.
Also, yaffs has been designed for the purpose of using on large amounts
of NAND flash, quickly and with low overhead, so if you are using a large
amount of NAND flash, you may look into that.
