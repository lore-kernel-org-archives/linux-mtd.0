Received: from krynn.axis.se ([193.13.178.10])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16Wdrx-00076q-00
	for <linux-mtd@lists.infradead.org>; Fri, 01 Feb 2002 13:36:45 +0000
Subject: Re: chip drivers
From: Jonas Holmberg <jonas.holmberg@axis.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <29597.1012570470@redhat.com>
References: <1012561603.21481.4.camel@pcjonashg>  
	<29597.1012570470@redhat.com>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 01 Feb 2002 14:47:17 +0100
Message-Id: <1012571237.21594.8.camel@pcjonashg>
Mime-Version: 1.0
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

On Fri, 2002-02-01 at 14:34, David Woodhouse wrote:
> 
> jonas.holmberg@axis.com said:
> > I need to use different flash chips (AMD compatible, mixed CFI and
> > non-CFI, mixed geometry etc) at the same time :). I think I will need
> > to change the cfi drivers and the cfi- and jedec-probe to accomplish
> > this.  
> 
> Why do you think this? They should be fine. Just set up as many map 
> structures as you require and call the appropriate probe functions.

Do you mean using two map structures (one for each probe) and just let
the cfi_probe fill out one of them and jedec_probe the other? Because I
don't think that will work without complex code that calls the probes
over and over again.

/Jonas
