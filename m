Received: from krynn.axis.se ([193.13.178.10])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16XlB9-0005np-00
	for <linux-mtd@lists.infradead.org>; Mon, 04 Feb 2002 15:37:11 +0000
Subject: Re: chip drivers
From: Jonas Holmberg <jonas.holmberg@axis.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <8523.1012575879@redhat.com>
References: <1012574966.21595.10.camel@pcjonashg>
	<1012571237.21594.8.camel@pcjonashg> <1012561603.21481.4.camel@pcjonashg>
	<29597.1012570470@redhat.com> <31144.1012571348@redhat.com>  
	<8523.1012575879@redhat.com>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 04 Feb 2002 16:47:50 +0100
Message-Id: <1012837670.4248.5.camel@pcjonashg>
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

> Register them as three separate chips 
> and then use the partition code that's been fixed to let you combine ranges 
> of separate devices into one 'partition' rather than just split devices up.

I haven't got past the probing part yet. I'm trying to use cfi_probe and
jedec_probe to find all chips in a really big window. So when the
cfi_probe or the jedec_probe has found something I make a copy of the
map it used and increase map_priv_1 (used by the read and write
callbacks as in physmap.c) in the new map. The new map is then used for
the next probe.

The problem is that I cannot determine if a previous probe found any
alias or not. I must not probe where an alias has been found by a
previous probe since the next probe will think it is a new chip and not
recognize it as an alias (sinze it will think that it found the chip at
location zero). And I must continue probing until the end of the window.

Do I have to change the interface of the probe functions (I need the
address of the last found alias without "manually" looking for aliases
like the probe functions do)?

/Jonas
