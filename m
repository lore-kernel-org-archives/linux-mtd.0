Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15qwgn-0008O1-00
	for <linux-mtd@lists.infradead.org>; Tue, 09 Oct 2001 14:12:53 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3BC2F94C.A641360C@inn.ericsson.se> 
References: <3BC2F94C.A641360C@inn.ericsson.se>  <m3y9mljsin.fsf@DLT.linuxnetworx.com> <29886.1002609959@redhat.com> <m3wv25gvdq.fsf@DLT.linuxnetworx.com> 
To: Kenneth Johansson <kenneth.johansson@inn.ericsson.se>
Cc: "Eric W. Biederman" <ebiederman@lnxi.com>,
    linux-mtd@lists.infradead.org
Subject: Re: Q: Probing for devices > buswidth??? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 09 Oct 2001 14:22:01 +0100
Message-ID: <21867.1002633721@redhat.com>
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

kenneth.johansson@inn.ericsson.se said:
>  Yes. I have a pcmcia linear flash device that is using Intel
> strataflash 28F640xxx. The chips is 16 bit but used as 8bit. To make
> things interesting they also interleave the chip so odd bytes goes to
> one chip and even to the other.

You have map driver code for PCMCIA devices? Is this a generic PCMCIA 
driver or a platform-specific hack?

--
dwmw2
