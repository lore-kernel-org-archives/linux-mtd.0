Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 182wih-00085E-00
	for <linux-mtd@lists.infradead.org>; Sat, 19 Oct 2002 17:44:59 +0100
Date: Sat, 19 Oct 2002 18:44:45 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Frank Neuber <neuber@convergence.de>, linux-mtd@lists.infradead.org
Subject: Re: parse_cmdline_partitions equivalent for map_info
Message-ID: <20021019164445.GA9364@wohnheim.fh-wedel.de>
References: <20021018104910.GA11807@jupiter> <26791.1034943288@passion.cambridge.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <26791.1034943288@passion.cambridge.redhat.com>
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

On Fri, 18 October 2002 13:14:48 +0100, David Woodhouse wrote:
> neuber@convergence.de said:
> > Now I'm looking for the same feature to pass the physically
> > informations to the kernel (struct map_info). I could add this simply
> > to the cmdline.c file based on the parse_cmdline_partitions function.
> 
> That seems like a relatively sensible addition to physmap.c. You could make 
> it take the probe type that way too...
> 
>  'physmap=0xe0000000,0x100000,16,cfi'

Hmm, somewhere in my collection of yet-to-be-committed patches, I have
a variant of the physmap driver that does exactly this and is capable
of mapping up to eight independent devices. Interested?

Jörn

-- 
Write programs that do one thing and do it well. Write programs to work
together. Write programs to handle text streams, because that is a
universal interface. 
-- Doug MacIlroy
