Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15qqcy-0007mx-00
	for <linux-mtd@lists.infradead.org>; Tue, 09 Oct 2001 07:44:32 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <m3wv25gvdq.fsf@DLT.linuxnetworx.com> 
References: <m3wv25gvdq.fsf@DLT.linuxnetworx.com>  <m3y9mljsin.fsf@DLT.linuxnetworx.com> <29886.1002609959@redhat.com> 
To: ebiederman@lnxi.com (Eric W. Biederman)
Cc: linux-mtd@lists.infradead.org
Subject: Re: Q: Probing for devices > buswidth??? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 09 Oct 2001 07:53:40 +0100
Message-ID: <30115.1002610420@redhat.com>
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

ebiederman@lnxi.com said:
>  Just so I understand.  There are chips with a 16-bit interface that
> you can put in a crippled mode such that they pretend use only an 8
> bit bus.  But the id logic is the same as when the are on a 16-bit
> bus?

Basically, yes. They are 16-bit devices, with the A0 line selecting which 
16-bit word you should look at - and all the 'magic' addresses must be 
placed on the address bus starting at A0. But they decided they wanted to 
be able to use them with an 8-bit bus, so they added an 'A-1' address line 
too.

> I'm just trying to comprehend this weird situation.

Do yourself a favour - don't. Just accept it. Or do me a favour and take 
responsibility for it from now on :)

--
dwmw2
