From: David Woodhouse <dwmw2@infradead.org>
To: Jun Sun <jsun@mvista.com>
In-Reply-To: <20031105095658.B19785@mvista.com>
References: <20031104164431.K16745@mvista.com>
	 <1068023691.6065.7.camel@hades.cambridge.redhat.com>
	 <20031105095658.B19785@mvista.com>
Content-Type: text/plain
Message-Id: <1068112207.6065.455.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Thu, 06 Nov 2003 09:50:07 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] extend physmap.c to support run-time configure and
	partitioning (take 3)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2003-11-05 at 09:56 -0800, Jun Sun wrote:
> Hmm, can you be more specific?  Here are all static variables that
> matter in physmap.c.  Which ones are you thinking to eliminate?  And in 
> what way?  (Assuming you do not mean I just drop "static" modifier...)

I mean mymtd, in particular. 

-- 
dwmw2
