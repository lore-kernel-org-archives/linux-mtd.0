Received: from [203.194.209.83] (helo=machine36.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 18dwWp-00073k-00
	for <linux-mtd@lists.infradead.org>; Wed, 29 Jan 2003 18:01:39 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Mark Meade <mark@lakeshoremicro.com>
To: Raphael Hertzog <eng@eipm.ch>
Subject: Re: NFTL not recognizing disk on chip in some cases
Date: Wed, 29 Jan 2003 13:30:42 -0500
Cc: linux-mtd@lists.infradead.org
References: <1043844420.555.111.camel@localhost> <1043851709.11449.118.camel@henrik.marasystems.com> <1043858542.554.144.camel@localhost>
In-Reply-To: <1043858542.554.144.camel@localhost>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <E18dwWp-00073k-00@pentafluge.infradead.org>
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

On Wednesday 29 January 2003 11:42 am, Raphael Hertzog wrote:
> Unless the bad things are irreversible this should not be the case.
> AFAIR I always took care to remove the module before formating.

FWIW, I have seen the same problems you describe, but was never able to get 
to the point where it was repeatable.

The one thing that always seemed to get the DoC back to a reasonable state 
was running the M-Sys DFORMAT utility -- in your case, version 4.2.  For 
instance, if I had somehow corrupted the DoC with the nftl module loaded when 
it shouldn't have been, subsequent nftl_format commands (even without nftl 
loaded) didn't seem to make things right again.

Mark
