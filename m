Received: from ash.lnxi.com ([207.88.130.242] helo=DLT.linuxnetworx.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15qqZc-0007mc-00
	for <linux-mtd@lists.infradead.org>; Tue, 09 Oct 2001 07:41:04 +0100
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Q: Probing for devices > buswidth???
References: <m3y9mljsin.fsf@DLT.linuxnetworx.com>
	<29886.1002609959@redhat.com>
From: ebiederman@lnxi.com (Eric W. Biederman)
Date: 09 Oct 2001 00:50:09 -0600
In-Reply-To: <29886.1002609959@redhat.com>
Message-ID: <m3wv25gvdq.fsf@DLT.linuxnetworx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

David Woodhouse <dwmw2@infradead.org> writes:

> ebiederman@lnxi.com said:
> > Trying to understand some anomolous results I discovered that
> > gen_probe_newchip is looking for: 16 bit devices on an 8 bit bus. byte
> > interleaved 16 bit devices on a 16 bit bus. And some really bizare
> > things for a 32 bit bus.
> 
> > Is there any good reason for doing it that way?
> 
> What it's probing for is a 16-bit device in 8-bit mode. This is _different_ 
> to an 8-bit device :)

Just so I understand.  There are chips with a 16-bit interface that
you can put in a crippled mode such that they pretend use only an 8
bit bus.  But the id logic is the same as when the are on a 16-bit
bus?

I'm just trying to comprehend this weird situation.

Eric
